<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>
<br/>
<div id="container" align="center">
<h3>공지사항 추가하기</h3>
<jsp:include page="../nav.jsp"></jsp:include>
<br/><br/>
<form action="${pageContext.request.contextPath }/noticeinsert" method="post">
	제목:<input type="text" name="title" id="title"><br/>
	내용:<input type="text" id="content" name="content" width="100px" height="300px;"><br/>
	<input type="submit" value="submit">
</form>
</div>
</body>
</html>