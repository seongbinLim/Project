<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>HappyHouse 회원정보 수정</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
function update() {
	if(document.getElementById("userpwd").value == "") {
		alert("비밀번호 입력!!!");
		return;
	}else if(document.getElementById("userpwd").value != document.getElementById("pwdcheck").value){
		alert("비밀번호 일치 확인!!!");
		return;
	}else if(document.getElementById("phone").value == ""){
		alert("전화번호 확인!!!");
		return;
	}else if(document.getElementById("areaname").value == ""){
		alert("관심 지역 확인!!!");
		return;
	}else {
		document.getElementById("memberform").action = "${root}/update";
		document.getElementById("memberform").submit();
	}
}
</script>
</head>
<body>
<jsp:include page="../nav.jsp"></jsp:include>
<br/><br/>
<div class="container" align="center">
	<div class="col-lg-6" align="center">
		<form id="memberform" method="post" action="">
		<input type="hidden" name="act" id="act" value="insert">
		<input type="hidden" name="userid" id="userid" value="${userinfo.userId}"> 
			<div class="form-group" align="center">
				<h3>HappyHouse 회원정보수정</h3>
			</div>
			<div class="form-group" align="left">
				<label for="pw">비밀번호</label>
				<input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="pwck">비밀번호재입력</label>
				<input type="password" class="form-control" id="pwdcheck" name="pwdcheck" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="tel">전화번호</label>
				<div id="tel" class="custom-control-inline">
 				<input type="text" class="form-control" id="phone" name="phone" placeholder="">
				</div>
			</div>
			<div class="form-group" align="left">
				<label for="area">관심 지역</label><br>
				<div id="area" class="custom-control-inline">
				<select class="form-control" id="areaname" name="areaname">
					<option value="사직동">사직동</option>
					<option value="서초동">서초동</option>
					<option value="양재동">양재동</option>
					<option value="역삼동">역삼동</option>
					<option value="잠실동">잠실동</option>
					<option value="합정동">합정동</option>
					<option value="신림동">신림동</option>
				</select>
				</div>
			</div>
			<div class="form-group" align="center">
				<button type="button" class="btn btn-primary" id="registerBtn"  onclick="javascript:update();">수정</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</div>
		</form>
	</div>
</div>

</body>
</html>