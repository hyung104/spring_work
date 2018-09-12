<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/updateform.jsp</title>
<style>
	#profileImage{
		width: 50px;
		height: 50px;
		background-color: yellow;
		border-radius: 50%;
		cursor: pointer;
	}
	/* 폼 숨기기 */
	#profileForm{
		display: none;
	}
</style>
</head>
<body>
<h3>회원정보 수정 페이지 입니다.</h3>
<c:choose>
	<c:when test="${empty dto.profileImage }">
		<img id="profileImage" src="${pageContext.request.contextPath }/resources/images/kim1.png" />	
	</c:when>
	<c:otherwise>
		<img id="profileImage" src="${pageContext.request.contextPath }/upload/${dto.profileImage }" />		
	</c:otherwise>
</c:choose>

<form action="update.do" method="post" id="updateForm">
	<input type="hidden" name="id" value="${id }"/>
	<label for="id">아이디</label>
	<input type="text" id="id" value="${id }" disabled="disabled"/><br/>
	<label for="email">이메일 주소</label>
	<input type="text" name="email" id="email" value="${dto.email }"/><br/>
	<button type="submit">수정 확인</button>
</form>
<form action="profile_upload.do" method="post" enctype="multipart/form-data" id="profileForm">
	<input type="file" name="file" id="file" />
</form>
<a href="pw_changeform.do">비밀번호 변경</a>
</body>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>
	//이미지를 클릭했을때
	$("#profileImage").click(function(){
		//폼 안에 있는 input[type=file] 을 강제 클릭 시킨다. - 클릭 이벤트 발생
		$("#file").click();
		//$("#profileForm input[type=file]").click();		
	});
	//프로필 이미지를 선택했을 때 실행할 함수 등록
	//$("#profileForm input[type=file]").on("input", function(){		
	$("#file").on("input", function(){
		// 폼 강제 제출
		$("#profileForm").submit();
	});
	
	//프로필 이미지 폼이 ajax 요청으로 제출되도록 
	$("#profileForm").ajaxForm(function(responseData){
		// 저장된 파일명을 얻어온다.
		var fileName=responseData.fileName;		
		//이미지 경로
		var imagePath="${pageContext.request.contextPath }/upload/"+fileName;
		$("#profileImage").attr("src", imagePath);
	});	
</script>
</html>










