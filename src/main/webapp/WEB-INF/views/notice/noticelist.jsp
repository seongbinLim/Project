<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function pageMove(num) {
	//		console.log("http://localhost:8080/ssafy/noticelist?page="+num);
		location.href="http://localhost:8080/ssafy/noticelist?page="+num;
	}
</script>
<style type="text/css">
table {
	text-align: center;
	align: center;
}
#header {
	padding: 0px 30px 50px 80px;
}
section {
	float: left;
}
aside {
	float: right;
}
#list {
	clear: both;
}
</style>
</head>
<body>
<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="act" id="act" value="noticelist">
		<input type="hidden" name="pg" id="pg" value="">
</form>
<jsp:include page="../nav.jsp"></jsp:include>
<br/><br/>
<div id="container" align="center">
<div id="header">
<section>
<h3>공지사항</h3>
</section>
<aside>
<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/insertnotice'">공지사항 추가</button>
</aside>
</div>
<div id="list">
<c:if test="${list.size() == 0}">
	공지사항을 등록하세요<br/>
</c:if>
<c:if test="${list.size() != 0}">
	<table class="table">
		<thead class="table-active">
			<tr>
				<td scope="col">제목</td>
				<td scope="col">내용</td>
				<td scope="col">삭제</td>
				<td scope="col">수정</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="l" items="${list }" >
			<tr>
				<td>${l.title }</td>
				<td>${l.content }</td>
				<td><button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/noticedelete?no=${l.no}'">삭제</button>
							<td><button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/updatenotice?no=${l.no}'">수정</button>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<table>
	  	<tr>
	  	<td>
	  	${navigation.navigator}
	  	</td>
	  	</tr>
	</table>
</c:if>
</div>
</div>

</body>
</html>