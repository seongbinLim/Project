<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="saveid" value="${cookie.ssafy_id.value}"/>
	<c:set var="idck" value=" checked=\"checked\""/>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>HappyHouse 로그인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<!-- jquery추가하기 -->
<script type="text/javascript">
function login() {
	if(document.getElementById("userid").value == "") {
		alert("아이디를 입력하세요.");
		return;
	} else if(document.getElementById("userpwd").value == "") {
		alert("비밀번호를 입력하세요.");
		return;
	} else {
		console.log($(''))
		var save = '';
		if($('#idsave').is(":checked") == true) {
		    save = "saveok";
		}
		console.log($('#userid').val()+" "+$('#userpwd').val()+" "+save);
		$.ajax({
			url: '${pageContext.request.contextPath}/login',
			method: 'POST',
			data: {
				userid: $('#userid').val(),
				userpwd: $('#userpwd').val(),
				idsave: save
			}
		})
		.done(function(res) {
			console.log(res);
			if(res) {
				close();
				location.href='${pageContext.request.contextPath}/mvmain';
			}
			else {
				alert("ID또는 비밀번호가 틀렸습니다.");	
			}
		})
// 		document.getElementById("loginform").action = "${root}/login";
// 		document.getElementById("loginform").submit();
	}
}

</script>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>
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
@font-face { 
	font-family: 'NanumBarunGothic'; 
	font-style: normal; 
	font-weight: 400; 
	src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot'); src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype'); } @font-face { font-family: 'NanumBarunGothic'; font-style: normal; font-weight: 700; src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot'); src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.ttf') format('truetype') } @font-face { font-family: 'NanumBarunGothic'; font-style: normal; font-weight: 300; src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot'); src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.ttf') format('truetype'); 
} 
* {
	font-family: 'NanumBarunGothic', 'NanumBarunGothic'; 
}
</style>
</head>
<body style="background-image: url('resources/img/home10.jpg');">
<%-- <jsp:include page="../nav.jsp"></jsp:include> --%>
<br/><br/>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<div class="container" align="center">
	<div class="col-lg-6" align="center">
		<form id="loginform" method="post" action="">
		<input type="hidden" name="act" id="act" value="login">
			<div class="form-group" align="center">
				<h3>HappyHouse 로그인</h3>
			</div>
			<div class="form-group" align="left">
				<label for="">아이디</label>
				<input type="text" class="form-control" id="userid" name="userid" placeholder="" value="${saveid}">
			</div>
			<div class="form-group" align="left">
				<label for="">비밀번호</label>
				<input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="" onkeydown="javascript:if(event.keyCode == 13) {login();}">
			</div>
			<div class="form-group form-check" align="right">
			    <label class="form-check-label">
			      <input class="form-check-input" type="checkbox" id="idsave" name="idsave" value="saveok"${idck}> 아이디저장
			    </label>
			</div>
			<div class="form-group" align="center">
				<button type="button" class="btn btn-dark btn-lg btn-block" onclick="javascript:login();">로그인</button>
			</div>
			<a href="${root}/mvsearchpw">비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${root}/mvjoin">회원가입</a>
		</form>
	</div>
</div>
</body>
</html>