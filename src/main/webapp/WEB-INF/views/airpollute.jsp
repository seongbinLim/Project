<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Air Pollute</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function pageMove(num) {
// 		console.log("http://localhost:8080/ssafy/airpollute?page="+num);
		location.href="http://localhost:8080/ssafy/airpollute?page="+num;
	}
</script>
</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>
<br/><br/>
<div id="container" align="center">
	<h2>HappyHouse 대기정보 목록</h2>
	<table class="table">
		<thead class="table-active">
			<tr>
				<td>날짜</td>
				<td>지역</td>
				<td>O2</td>
				<td>오존</td>
				<td>탄소</td>
				<td>황</td>
				<td>미세먼지</td>
				<td>초미세먼지</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="l" items="${list}">
			<tr>
				<td>${l.polluteDate }</td>
				<td>${l.district }</td>
				<td>${l.o2 }</td>
				<td>${l.ozon }</td>
				<td>${l.carbon }</td>
				<td>${l.sulfur }</td>
				<td>${l.finedust }</td>
				<td>${l.ultraFinedust }</td>
			</tr>
			</c:forEach>	
		</tbody>
	</table>
		<table>
	  		<tr>
	  			<td>${nav.navigator}</td>
	  		</tr>
	  	</table>
</div>
</body>
</html>