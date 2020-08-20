<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HappyHouse 상권정보 조회</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			function searchCommerce() {
				if(document.getElementById("word").value == "") {
					alert("모든 목록 조회!!");
				}
				document.getElementById("searchform").action = "${root}/commerce.do";
				document.getElementById("searchform").submit();
			}
			function pageMove(pg) { 
				document.getElementById("pg").value=pg;
				document.getElementById("pageform").action = "${root}/commerce.do";
				document.getElementById("pageform").submit();
			}
			$(document).ready(function() {
				$.ajax({
					url: '${pageContext.request.contextPath}/commerceinfo?page=1',
					method: 'GET'
					
				})
			})
		</script>
	</head>
	<body>
	<jsp:include page="../nav.jsp"></jsp:include>
	<br/><br/>
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="act" id="act" value="commerceinfo">
		<input type="hidden" name="pg" id="pg" value="">
		<input type="hidden" name="key" id="key" value="${key}">
		<input type="hidden" name="word" id="word" value="${word}">
	</form>
	<div class="container" align="center">
	  <div class="col-lg-8" align="center">
	  <h2>HappyHouse 상권 정보 목록</h2>
	  <p>기본 화면은 ${userinfo.userName}님의 관심지역 상권정보입니다.</p>  
	  <form id="searchform" method="post" class="form-inline" action="">
	  <input type="hidden" name="act" id="act" value="commerceinfo">
	  <input type="hidden" name="pg" id="pg" value="1">
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right">
		  	  <select class="form-control" name="key" id="key">
		  	  	<option value="all" selected="selected">전체</option>
			    <option value="city">도시</option>
			    <option value="shopname">상호명</option>
			    <option value="codename3">업종</option>
			  </select>
			  <input type="text" class="form-control" placeholder="검색어 입력." name="word" id="word">
			  <button type="button" class="btn btn-primary" onclick="javascript:searchCommerce();">검색</button>
			</td>
	  	</tr>
	  </table>
	  </form>
	  <c:if test="${lists.size() != 0}">
	  	<c:forEach var="list" items="${lists}">
	  <table class="table">
	  	<thead class="table-active">
	  		<tr>
	  			<td>도시명</td>
	  			<td>동</td>
	  			<td>상호명</td>
	  			<td>업종</td>
	  		</tr>
	  	</thead>
	    <tbody>
	    	<tr>
	    		<td>${list.city }</td>
	    		<td>${list.dong }</td>
	    		<td>${list.shopname }</td>
	    		<td>${list.codename3 }</td>
	    	</tr>
<!-- 	      <tr> -->
<%-- 	        <td colspan="2" class="table-danger"><strong>도시 : ${list.city}, 동: ${list.dong} </strong></td> --%>
<!-- 	      </tr> -->
<!-- 	      <tr> -->
<%-- 	        <td colspan="2">상호명 : ${list.shopname}, 업종 : ${list.codename3}</td> --%>
<!-- 	      </tr> -->
	    </tbody>
	  </table>
	  	</c:forEach>
	  	<table>
	  	<tr>
	  	<td>
	  	${navigation.navigator}
	  	</td>
	  	</tr>
	  	</table>
	  </c:if>
	  <c:if test="${lists.size() == 0}">
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info" align="center">
	        <td>상권 목록을 조회할 수 없습니다.</td>
	      </tr>
	    </tbody>
	  </table>
	  </c:if>
	  </div>
	</div>
		
	</body>
</html>