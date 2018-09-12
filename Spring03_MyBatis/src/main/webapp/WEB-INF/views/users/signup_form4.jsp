<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/signup_form.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body ng-app="myApp">

<div class="container">
	<h3>회원 가입 페이지 입니다.</h3>	
	<form ng-submit="onSubmit($event)" ng-controller="formCtrl" action="signup.do" method="post" name="signupForm" novalidate>
		<div class="form-group has-feedback"
			ng-class="{'has-success':signupForm.id.$valid && checkId ,'has-error': (signupForm.id.$invalid || !checkId ) && signupForm.id.$dirty }">
			<label>아이디</label>
			<input type="text" class="form-control" name="id" ng-model="id" 
				ng-required="true"
				ng-minlength="5"
				ng-change="onIdInput()" 
				ng-pattern="/^[a-zA-Z0-9]+$/"/>
			<span class="form-control-feedback glyphicon glyphicon-ok" ng-show="signupForm.id.$valid && checkId"></span>
			<span class="form-control-feedback glyphicon glyphicon-remove" ng-show="(signupForm.id.$invalid || !checkId ) && signupForm.id.$dirty"></span>
			<p class="help-block" ng-show="signupForm.id.$invalid && signupForm.id.$dirty">반드시 입력하세요</p>
			<p class="help-block" ng-show="signupForm.id.$error.minlength">5글자 이상 입력하세요</p>
			<p class="help-block" ng-show="signupForm.id.$error.pattern">영문자, 숫자만 가능합니다.</p>
			<p class="help-block" ng-show="!checkId && signupForm.id.$dirty">사용할 수 없는 아이디입니다.</p>
		</div>
		<div class="form-group has-feedback" 
			ng-class="{'has-success':signupForm.pwd.$valid ,'has-error': signupForm.pwd.$invalid && signupForm.pwd.$dirty }">
			<label>비밀번호</label>
			<input type="text" class="form-control" name="pwd" 	ng-model="pwd" 
				ng-required="true"
				ng-minlength="5"
				ng-maxlength="10"
				ng-pattern="/^[a-zA-Z0-9]+$/"/>
			<span class="form-control-feedback glyphicon glyphicon-ok" ng-show="signupForm.pwd.$valid"></span>
			<span class="form-control-feedback glyphicon glyphicon-remove" ng-show="signupForm.pwd.$invalid && signupForm.pwd.$dirty"></span>
			<p class="help-block" ng-show="signupForm.pwd.$invalid && signupForm.pwd.$dirty">반드시 입력하세요</p>
			<p class="help-block" ng-show="signupForm.pwd.$error.minlength">5글자 이상 입력하세요</p>
			<p class="help-block" ng-show="signupForm.pwd.$error.maxlength">10글자 이하 입력하세요</p>
			<p class="help-block" ng-show="signupForm.pwd.$error.pattern">영문자,숫자만 가능합니다.</p>
		</div>
		<div class="form-group has-feedback" 
			ng-class="{'has-success':signupForm.email.$valid ,'has-error': signupForm.email.$invalid && signupForm.email.$dirty }">
			<label>이메일</label>
			<input type="text" class="form-control" name="email" 	ng-model="email" 
				ng-required="true"
				ng-pattern="/^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/"/>
			<span class="form-control-feedback glyphicon glyphicon-ok" ng-show="signupForm.email.$valid"></span>
			<span class="form-control-feedback glyphicon glyphicon-remove" ng-show="signupForm.email.$invalid && signupForm.email.$dirty"></span>
			<p class="help-block" ng-show="signupForm.email.$invalid && signupForm.email.$dirty">반드시 입력하세요</p>
			<p class="help-block" ng-show="signupForm.email.$error.pattern">이메일 형식을 확인하세요.</p>
		</div>	
		<button ng-disabled="signupForm.$invalid" class="btn btn-primary">가입</button>	
	</form>
</div>
<script src="${pageContext.request.contextPath }/resources/js/angular.min.js"></script>	
<script>
	var app=angular.module("myApp", []);
	app.controller("formCtrl", function($scope, $http){
		//아이디를 입력했을때 호출되는 함수 
		$scope.onIdInput=function(){
			//입력한 내용을 서버에 ajax 요청을 통해서 보낸다. 
			$http({
				url:"checkid.do",
				method:"get",
				params:{inputId:$scope.id}
			}).success(function(data){
				//console.log(data);
				$scope.checkId=data.canUse;
				console.log($scope.checkId);
			});
		};
		
		//폼의 유효성 여부
		$scope.formValid=false;
		
		//폼 전송 이벤트가 발생했을때 호출하는 함수
		$scope.onSubmit=function(e){
			//폼이 유효하지 않으면 
			if (!$scope.formValid) {
				//폼 전송 이벤트 막기
				e.preventDefault();
			}
		}
	});
</script>
</body>
</html>