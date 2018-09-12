<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax/upload_form.jsp</title>
<style>
	img{
		width: 400px;
	}
	
	#profileImg{
		width: 100px;
		height: 100px;
		background-color: yellow;
		cursor: pointer;
		border-radius: 50%;
	}
	#fileForm4{
		display: none;
	}
</style>
</head>
<body>
<h3>ajax 파일 업로드 예제</h3>
<form action="upload.do" method="post" enctype="multipart/form-data" id="fileForm">
	<label for="file">파일 첨부</label>
	<input type="file" name="file" id="file" />
	<button type="submit">업로드</button>
</form>
<hr />
<h3>ajax 파일 업로드 예제2</h3>
<form action="upload2.do" method="post" enctype="multipart/form-data" id="fileForm2">
	<label for="file">파일 첨부</label>
	<input type="file" name="file" id="file" />
	<button type="submit">업로드</button>
</form>
<hr />
<h3>ajax 파일 업로드 예제3 - 파일선택시 자동 업로드</h3>
<form action="upload2.do" method="post" enctype="multipart/form-data" id="fileForm3">
	<label for="file">파일 첨부</label>
	<input type="file" name="file" id="file" />
</form>
<div id="result">

</div>
<hr />
<h3>ajax 파일 업로드 예제4</h3>
<form action="upload2.do" method="post" enctype="multipart/form-data" id="fileForm4">
	<label for="file">파일 첨부</label>
	<input type="file" name="file" id="file" />
</form>
<img src="${pageContext.request.contextPath }/resources/images/kim1.png" id="profileImg" />

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>
	//form 플로그인 동작 시키기 - submit 막음
	$("#fileForm").ajaxForm(function(responseData){
		console.log(responseData);		
	});
	
	$("#fileForm2").ajaxForm(function(responseData){
		// 저장된 파일명을 얻어온다.
		var fileName=responseData.fileName;
		
		//이미지 경로
		var imagePath="${pageContext.request.contextPath }/upload/"+fileName;
		$("#result").empty();
		//이미지 요소를 만들어서  div에 추가
		$("<img>").attr("src", imagePath).appendTo("#result");
	});
	
	$("#fileForm3").ajaxForm(function(responseData){
		// 저장된 파일명을 얻어온다.
		var fileName=responseData.fileName;
		
		//이미지 경로
		var imagePath="${pageContext.request.contextPath }/upload/"+fileName;
		$("#result").empty();
		//이미지 요소를 만들어서  div에 추가
		$("<img>").attr("src", imagePath).appendTo("#result");
		// 파일 input 리셋  -  선택내용 reset - 속성 수정 후 원상복귀 하면 clear됨.
		$("#formForm3 input[type=file]").attr("type", "").attr("type", "file").val("");
		
		//폼 리셋 시키기  $(this)[0] 오류남.
		//$('#fileForm3')[0].reset();		
	});	
	
	//파일을 선택했을때 실행할 함수 등록
	$("#fileForm3 input[type=file]").on("input", function(){
		$("#fileForm3").submit();
	});
	
	$("#fileForm4").ajaxForm(function(responseData){
		// 저장된 파일명을 얻어온다.
		var fileName=responseData.fileName;		
		//이미지 경로
		var imagePath="${pageContext.request.contextPath }/upload/"+fileName;
		$("#profileImg").attr("src", imagePath);
	});	
	$("#fileForm4 input[type=file]").on("input", function(){
		$("#fileForm4").submit();
	});
	//이미지를 클릭했을때
	$("#profileImg").click(function(){
		//폼 안에 있는 input[type=file] 을 강제 클릭 시킨다. - 클릭 이벤트 발생
		$("#fileForm4 input[type=file]").click();		
	});
	
</script>
</body>
</html>