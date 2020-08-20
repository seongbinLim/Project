<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>HappyHouse 비밀번호 찾기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
function searchpw() {
	if(document.getElementById("userid").value == "") {
		alert("아이디 입력!!!");
		return;
	} else {
		document.getElementById("searchform").action = "${root}/searchpw";
		document.getElementById("searchform").submit();
	}
}
</script>
<style>
@font-face { 
	font-family: 'NanumBarunGothic'; 
	font-style: normal; 
	font-weight: 400; 
	src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot'); src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype'); } @font-face { font-family: 'NanumBarunGothic'; font-style: normal; font-weight: 700; src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot'); src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.ttf') format('truetype') } @font-face { font-family: 'NanumBarunGothic'; font-style: normal; font-weight: 300; src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot'); src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.ttf') format('truetype'); 
} 
* {
	font-family: 'NanumBarunGothic', 'NanumBarunGothic'; 
}
a:link {
	color: #111111;
}
a:hover {
	color: #444444;
}
a:visited {
	color: #333333;	
}
a:active {
	color: #000000;
}
</style>
</head>
<body style="background-image: url('resources/img/home13.jpg');">
<br/>
<div class="container" align="center">
	<div class="col-lg-6" align="center">
		<form id="searchform" method="post" action="">
		<input type="hidden" name="act" id="act" value="searchpw">
			<div class="form-group" align="center">
				<h3>비밀번호 찾기</h3>
			</div>
			<div class="form-group" align="left">
				<label for="id">아이디를 입력하세요</label>
				<input type="text" class="form-control" id="userid" name="userid" placeholder="">
			</div>
			<div class="form-group" align="center">
				<button type="button" class="btn btn btn-secondary btn-block" id="registerBtn"  onclick="javascript:searchpw();">비밀번호 찾기</button>
				<button type="reset" class="btn btn btn-dark btn-block">초기화</button>
			</div>
			<a href="${root}/mvlogin">로그인 화면</a>
		</form>
	</div>
</div>

</body>
</html>