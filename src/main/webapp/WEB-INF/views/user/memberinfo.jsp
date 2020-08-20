<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		<title>HappyHouse 회원 정보</title>
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
		</style>
	</head>
	<body>
	<jsp:include page="../nav.jsp"></jsp:include>
	<br/><br/>
	<div class="container" align="center">
			<h3>HappyHouse 회원정보</h3>
			<table class="table table-hover">
			<thead class="table-active">
				<tr>
					<td>이름</td>
					<td>아이디</td>
					<td>생일</td>
					<td>전화번호</td>
					<td>관심지역</td>
				</tr>
			</thead>
	    	<tbody class="table-hover">
	    		<tr>
	    			<td>${userinfo.userName }</td>
	    			<td>${userinfo.userId }</td>
	    			<td>${userinfo.userBirth }</td>
	    			<td>${userinfo.userPhone }</td>
	    			<c:if test="${userinfo.userArea eq null }">
	    				<td>관심지역 없음</td>
	    			</c:if>
	    			<c:if test="${userinfo.userArea ne null }">
	    				<td>${userinfo.userArea }</td>
	    			</c:if>
	    		</tr>
<!-- 	      		<tr> -->
<%-- 	        		<td colspan="2" class="table-danger">이름 : ${userinfo.userName} </td> --%>
<!-- 	      		</tr> -->
<!-- 	      		<tr> -->
<%-- 	        		<td colspan="2">아이디 : ${userinfo.userId} </td> --%>
<!-- 	      		</tr> -->
<!-- 	      		<tr> -->
<%-- 	        		<td colspan="2">생일 : ${userinfo.userBirth} </td> --%>
<!-- 	      		</tr> -->
<!-- 	      		<tr> -->
<%-- 	        		<td colspan="2">전화번호 : ${userinfo.userPhone} </td> --%>
<!-- 	      		</tr> -->
<!-- 	      		<tr> -->
<!-- 	        		<td colspan="2">관심지역 : -->
<%-- 	        		<c:if test="${userinfo.userArea eq null }"> --%>
<!-- 	        		관심지역 없음 -->
<%-- 	        		</c:if>  --%>
<%-- 	        		<c:if test="${userinfo.userArea ne null }"> --%>
<%-- 	        		${userinfo.userArea} --%>
<%-- 	        		</c:if> --%>
<!-- 	        		</td> -->
<!-- 	      		</tr> -->
	    	</tbody>
	  </table>
			<div class="updateanddelete" align="center">
				<a href="${root}/mvupdate">수정</a>
				<a href="${root}/delete">삭제</a><br>
				<a href="${root}/mvmain">메인으로 가기</a>
			</div>
	</div>
	</body>
</html>