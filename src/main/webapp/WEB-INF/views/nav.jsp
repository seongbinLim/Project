<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<style> 
	ul {
		list-style-type: none;
		margin: 0;
		padding: 0;
	}
	li {
		float: left;
	}
	li a {
		display: block;
		padding: 8px;
	}
</style>
</head>
<body>
<nav id="menubar" class="navbar navbar-expand-lg navbar-dark bg-dark">
	  <a class="navbar-brand" href="${root}/mvmain">Happy House</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
	  <a class="nav-item nav-link" href="${root}/noticelist?page=1">공지사항</a>
	    <div class="navbar-nav">
	      <c:if test="${userinfo == null}">
		      <a class="nav-item nav-link" href="${root}/mvlogin">로그인</a>
		      <a class="nav-item nav-link" href="${root}/mvjoin">회원가입</a>
	      </c:if>
	      <c:if test="${userinfo != null}">
			  <strong>${userinfo.userName}</strong>님 환영합니다.
			  <a class="nav-item nav-link" href="${root}/logout">로그아웃</a>
			  <a class="nav-item nav-link" href="${root}/memberinfo">회원정보</a>
			  	<c:if test="${userinfo.userId == 'admin'}">
			  	<a class="nav-item nav-link" href="${root}/memberlist">회원정보목록</a>
			  	</c:if>
			  <a class="nav-item nav-link" href="${root}/commerceinfo">상권정보</a>
		  </c:if>
		  <a class="nav-item nav-link" href="${root}/envinfo">환경정보</a>
		  <a class="nav-item nav-link" href="${root}/airpollute?page=1">대기정보</a>
		  <a class="nav-item nav-link" href="${root}/vue">QnA</a>
	    </div>
	  </div>
</nav>
</body>
</html>
