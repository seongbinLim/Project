<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${userinfo != null }">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HappyHouse 회원목록 조회</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		function searchMember() {
			if(document.getElementById("word").value == "") {
				alert("모든 목록 조회!!");
			}
			document.getElementById("searchform").action = "${root}/user.do";
			document.getElementById("searchform").submit();
		}
		</script>
	</head>
	<body>
	<jsp:include page="../nav.jsp"></jsp:include>
	<br/><br/>
	<div class="container" align="center">
	  <div class="col-lg-8" align="center">
	  <h2>HappyHouse 회원 정보 목록</h2> 
	  <form id="searchform" method="post" class="form-inline" action="">
	  <input type="hidden" name="act" id="act" value="memberlist">
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right">
		  	  <select class="form-control" name="key" id="key">
		  	  	<option value="all" selected="selected">전체</option>
			    <option value="id">아이디</option>
			    <option value="name">이름</option>
			    <option value="area">관심 지역</option>
			  </select>
			  <input type="text" class="form-control" placeholder="검색어 입력." name="word" id="word">
			  <button type="button" class="btn btn-primary" onclick="javascript:searchMember();">검색</button>
			</td>
	  	</tr>
	  </table>
	  </form>
	  <c:if test="${memberlist.size() != 0}">
	  	<c:forEach var="member" items="${memberlist}">
	  <table class="table table-active">
	    <tbody>
	      <tr>
	        <td colspan="2" class="table-danger"><strong>이름 : ${member.userName}, 아이디: ${member.userId} </strong></td>
	      </tr>
	      <tr>
	        <td colspan="2">전화번호 : ${member.userPhone}, 관심지역 : ${member.userArea}</td>
	      </tr>
	    </tbody>
	  </table>
	  	</c:forEach>
	  </c:if>
	  <c:if test="${memberlist.size() == 0}">
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info" align="center">
	        <td>회원 목록을 조회할 수 없습니다.</td>
	      </tr>
	    </tbody>
	  </table>
	  </c:if>
	  </div>
	</div>
		
	</body>
</html>
</c:if>