<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HappyHouse 환경정보 조회</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		function searchEnv() {
			if(document.getElementById("word").value == "") {
				alert("모든 목록 조회!!");
			}
			document.getElementById("searchform").action = "${root}/env.do";
			document.getElementById("searchform").submit();
		}
		function pageMove(pg) { 
			document.getElementById("pg").value=pg;
			document.getElementById("pageform").action = "${root}/env.do";
			document.getElementById("pageform").submit();
		}
		function pageMove(num) {
//	 		console.log("http://localhost:8080/ssafy/airpollute?page="+num);
			location.href="http://localhost:8080/ssafy/envinfo?page="+num;
		}
		</script>
	</head>
	<body>
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="act" id="act" value="envinfo">
		<input type="hidden" name="pg" id="pg" value="">
		<input type="hidden" name="key" id="key" value="${key}">
		<input type="hidden" name="word" id="word" value="${word}">
	</form>
	<jsp:include page="../nav.jsp"></jsp:include>
	<br/><br/>
	  <div class="container" align="center">
	  <div class="col-lg-8" align="center">
	  <h2>HappyHouse 환경 점검 목록</h2> 
	  <p>구 이름으로 검색, 동 이름으로 검색이 가능합니다</p> 
	  <form id="searchform" method="post" class="form-inline" action="">
	  <input type="hidden" name="act" id="act" value="envinfo">
	  <input type="hidden" name="pg" id="pg" value="1">
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right">
		  	  <select class="form-control" name="key" id="key">
		  	  	<option value="all" selected="selected">전체</option>
			    <option value="gu">구</option>
			    <option value="dong">동</option>
			  </select>
			  <input type="text" class="form-control" placeholder="검색어 입력." name="word" id="word">
			  <button type="button" class="btn btn-primary" onclick="javascript:searchEnv();">검색</button>
			</td>
	  	</tr>
	  </table>
	  </form>
	  <c:if test="${lists.size() != 0}">
	  	<c:forEach var="list" items="${lists}">
	  <table class="table">
	  <thead class="table-active">
	  	<tr>
	    	<td>상호명</td>
	    	<td>동</td>
	    	<td>주소</td>
	    </tr>
	  </thead>
	    <tbody>
	    	<tr>
	    		<td>${list.name }</td>
	    		<td>${list.dong }</td>
	    		<td>${list.address }</td>
<!-- 	      <tr> -->
<%-- 	        <td colspan="2" class="table-danger"><strong>상호명 : ${list.name}, 동: ${list.dong} </strong></td> --%>
<!-- 	      </tr> -->
<!-- 	      <tr> -->
<%-- 	        <td colspan="2">주소 : ${list.address}</td> --%>
<!-- 	      </tr> -->
			</tr>
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
	        <td>환경 점검 목록을 조회할 수 없습니다.</td>
	      </tr>
	    </tbody>
	  </table>
	  </c:if>
	  </div>
	  </div>
	</body>
</html>