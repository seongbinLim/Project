<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String no = request.getParameter("no");
%> 
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
</head>
<body>
<jsp:include page="../nav.jsp"></jsp:include>
<br/><br/>
<div id="container" align="center">
<h3>공지사항 수정하기</h3>
<form action="${pageContext.request.contextPath }/noticemodify?no=<%=no %>" method="post">
	제목: <input type="text" id="title" name="title"><br/>
	내용: <input type="text" id="content" name="content"><br/>
	<input type="submit" value="Submit">
</form>
</div>
</body>
</html>