<%@page import="com.ssafy.dto.HouseInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String isLogin = (String) request.getAttribute("isLogin");
%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="size" value="${list.size() }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>HappyHouse</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">  <!-- Google web font "Open Sans" -->
	<link rel="stylesheet" href="resources/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="resources/css/magnific-popup.css"/>
	<link rel="stylesheet" type="text/css" href="resources/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="resources/slick/slick-theme.css"/>
	<link rel="stylesheet" href="resources/css/tooplate-style.css">
<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
		var renderPage = true;

	if(navigator.userAgent.indexOf('MSIE')!==-1
		|| navigator.appVersion.indexOf('Trident/') > 0){
   		/* Microsoft Internet Explorer detected in. */
   		alert("Please view this in a modern browser such as Chrome or Microsoft Edge.");
   		renderPage = false;
	}
	function pageMove(num) {
		console.log('${pageContext.request.contextPath}/list?page='+num);
		$.ajax({
			url:'${pageContext.request.contextPath}/list?page='+num,
			method: 'GET'
		})
		.done(function(res) {
			$('#table').html();
// 			console.log("ajax");
// 			console.dir(res);
// 			console.dir(res.navigation.navigator);
			var list = res.list;
			var html = "<table class='table'><tr><td>동</td><td>아파트이름</td><td>최근거래일자</td><td>예약여부</td></tr>";
			var size = res.list.length;
			for(var i = 0; i < size; i++) {
// 				console.log(list[i]);
// 				console.log(list[i].isreserved+" "+(list[i].isreserved == false));
				html += "<tr><input type='text' style='display: none;' value="+list[i].no+">";
				html += "<td class='selected' value="+list[i].no+">"+list[i].dong+"</td>";
				html += "<td>"+list[i].aptName+"</td>";
				html += "<td>"+list[i].dealYear+"-"+list[i].dealMonth+"-"+list[i].dealDay+"</td>";
				if(list[i].isreserved == false) {
					html += "<td><button class='preserve btn btn-secondary btn-block' value="+list[i].no+">예약가능</button></td>";
				}
				else {
					html += "<td>예약불가</td>";
				}
// 				html += "<td>"+list[i].isreserved+"</td></tr>";
			}
			html += "</table>";
			$('#table').html(html);
			console.log(html);
		})
		.fail(function() {
			alert("데이터 조회에 실패했습니다. 다시 시도해 주세요");
			location.href('${pageContext.request.contextPath}/mvmain');
		});
	}
	//로그아웃추가하기
	$(document).on('click', '#tmNavLink7', function() {
		$.ajax({
			url: '${pageContext.request.contextPath}/logout'
		})
		.done(function() {
			location.href = '${pageContext.request.contextPath}/mvmain';
		})
	})
	$(document).on('click', '#tmNavLink6', function() {
		$.ajax({
			url: '${pageContext.request.contextPath}/airpollute?page=0',
			method: 'GET',
		})
		.done(function(res) {
			console.log(res);
			var html = '<table class="table" style="width: 700px;">';
			var length = res.list.length;
			html += "<tr><td>주소</td><td>미세먼지</td><td>초미세먼지</td>";
			for(var i = 0; i < length; i++) {
				console.dir(res.list[i]);
				html += "<tr><td>"+res.list[i].district+"</td>";
				html += "<td>"+res.list[i].finedust+"</td>";
				html +="<td>"+res.list[i].ultraFinedust+"</td>";
			}
			html += "</table>";
// 			console.log(html);
			$('#airPaging').html(res.nav.navigator);
			$('#air').html(html);
		}) 
		.fail(function() {
			alert("로그인을 시도해주세요.");
			location.href='${pageContext.request.contextPath}/mvmain';
		})
	})
	$(document).on('click', '#tmNavLink4', function() {
		$.ajax({
			url: '${pageContext.request.contextPath}/commerceinfo',
			method: 'post',
			data: {
				page: 0
			}
		})
		.done(function(res) {
// 			console.log(res.lists);
			var html = '<table class="table" style="width: 700px;">';
			var list = res.lists;
			var length = list.length;
			html += "<tr><td>동</td><td>지역</td><td>가게이름</td>";
			for(var i = 0; i < length; i++) {
				console.dir(list[i].address.split(" "));
				html += "<tr>";
				html += "<td>"+list[i].dong+"</td><td>";
				for(var j = 0; j < list[i].address.split(" ").length; j++) {
					if(j == 0) {
						continue;
					}
					html += list[i].address.split(" ")[j]+" ";
				}
				html +="</td><td>"+list[i].shopname+"</td>";
			}
			html += "</table>";
			$('#commerce').html(html);
			$('#commercePaging').html(res.navigation.navigator);
		}) 
		.fail(function() {
			alert("로그인이 되어있지 않습니다.");
		})
	})
	$(document).on('click', '#tmNavLink3', function() {
		$.ajax({
			url: '${pageContext.request.contextPath}/api/qna',
			method: 'GET'
		})
		.done(function(res) {
			console.dir(res);
			var html = "<table class='table'>";
			var list = res;
			var length = res.length;
			html += "<tr><td>번호</td><td>제목</td><td>내용</td><td>작성한사람</td><td>수정</td><td>삭제</td></tr>";
			for(var i = 0; i < length; i++) {
				html += "<tr><td>"+list[i].qnaNo+"</td>";
				html += "<td>"+list[i].qnaTitle+"</td>";
				html += "<td>"+list[i].qnaContent+"</td>";
				html += "<td>"+list[i].qnaUserid+"</td>";
				html += "<td><button type='button' id='updateQnA' class='btn btn-dark btn-lg btn-block' value="+list[i].qnaNo+">수정하기</button></td>";
				html += "<td><button type='button' id='deleteQnA' class='btn btn-dark btn-lg btn-block' value="+list[i].qnaNo+">삭제하기</button></td></tr>";
			}
			html += "</table>";
			html += "<button type='button' id='addQnA' class='btn btn-dark btn-lg btn-block'>추가하기</button>";
			$('#qna').html(html);
// 			$('#qnaPaging').html(res.navigation.navigator);
		})
		.fail(function() {
			alert("fail");
		})
	})
	$(document).on('click', '#deleteQnA', function() {
		$.ajax({
			url: '${pageContext.request.contextPath}/api/qna/delete?qnaNo='+this.value,
			method: 'GET'
		})
		.done(function(res) {
			console.log("success");
			console.dir(res);
		})
		.fail(function(res) {
			console.log("fail");
			console.dir(res);
		})
	})
	$(document).on('click', '#updateQnA', function() {
		$('#qna').html('');
		var html = '';
		$.ajax({
			url: '${pageContext.request.contextPath}/api/qna/search?qnaNo='+this.value,
			method: 'GET'
		})
		.done(function(res) {
			console.dir(res);
			html += "<div class='form-group' align='left'><label for=''>제목</label>";
			html += "<input type='text' class='form-control' id='qnaTitle' name='userid' placeholder='"+res.qnaTitle+"'></div>";
			html += "<div class='form-group' align='left'><label for=''>내용</label>";
			html += "<input type='text' class='form-control' id='qnaContent' name='userpwd' placeholder='"+res.qnaContent+"' onkeydown='javascript:if(event.keyCode == 13) {login();}'></div>";
			html += "<button type='button' id='update' value='"+res.qnaNo+"' class='btn btn-dark btn-lg btn-block'>질문 수정하기</button>";
			console.log(html);
			$('#qna').html(html);
		})
	})
	$(document).on('click', '#update', function() {
		$.ajax({
			url: '${pageContext.request.contextPath}/api/qna/update',
			method: 'POST',
			dataType: 'json',
			data: {
				qnaTitle: $('#qnaTitle').val(),
				qnaContent: $('#qnaContent').val(),
				qnaNo: this.value
			}
		})
		.done(function(res) {
			console.log(res);
			location.href = '${pageContext.request.contextPath}/mvmain';
		})
	})
	$(document).on('click', '#addQnA', function() {
		$('#qna').html('');
		var html = "<div class='form-group' align='left'><label for=''>제목</label>"
		html += "<input type='text' class='form-control' id='qnaTitle' name='qnaTitle' placeholder='제목''></div>";
		html += "<div class='form-group' align='left'><label for=''>내용</label>";
		html += "<input type='text' class='form-control' id='qnaContent' name='qnaContent' placeholder='내용' onkeydown='javascript:if(event.keyCode == 13) {login();}'></div>";
		html += "<button type='button' id='add' class='btn btn-dark btn-lg btn-block'>질문 등록하기</button>";
		$('#qna').html(html);
		//#tmNavLink3를 추가창으로 바꾸기 
	})
	$(document).on('click', '#add', function() {
		$.ajax({
			url: '${pageContext.request.contextPath}/api/qna/create',
			method: 'POST',
			dataType: 'json',
			data: {
				qnaTitle: $('#qnaTitle').val(),
				qnaContent: $('#qnaContent').val()
			}
		})
		.done(function(res) {
			console.log(res);
			location.href = '${pageContext.request.contextPath}/mvmain';
		})
		.fail(function(res) {
			console.log(res);
// 			alert("허락된 사용자가 아닙니다.");
// 			location.href = '${pageContext.request.contextPath}/mvlogin';
		})
	})
// 	$(document).on('click', '#updateQnA', function() {
// 		//클릭한 테이블의 값 가져오고 #tmNavLink3를 수정창으로 바꾸기 
// 	})
	$(document).on('click', '#tmNavLink2', function() {
		var admin = '';
		$.ajax({
			url: 'getUser',
			method: 'GET'
		})
		.done(function(result) {
			admin = result;
		});
		$.ajax({
			url: '${pageContext.request.contextPath}/noticelist?page=1',
			method: 'GET'
		})
		.done(function(res) {
// 			console.dir(res);
			var button = '';
// 			console.log(admin);
			var html = "<table class='table'>";
			var list = res.list;
			var len = list.length;
			html += "<tr><td>번호</td><td>제목</td><td>내용</td>";
			if(admin) {
				html += "<td>수정</td><td>삭제</td>";
			}
			html += "</tr>";
			for(var i = 0; i < res.list.length; i++) {
				var no = res.list[i].no;
				var title = res.list[i].title;
				var content = res.list[i].content;
				html += "<tr><td>"+no+"</td>";
				html += "<td>"+title+"</td>";
				html += "<td>"+content+"</td>";
				if(admin) {
					html += "<td><button type='button' id='updateNotice' value='"+no+"'class='btn btn-secondary btn-lg btn-block'>공지수정하기</button></td>";
					html += "<td><button type='button' id='deleteNotice' value='"+no+"'class='btn btn-secondary btn-lg btn-block'>공지삭제하기</button></td>";
				}
				html += "</tr>";
			}
			html += "</table>";
			if(admin) {
				html += "<button type='button' id='addNotice' class='btn btn-dark btn-lg btn-block'>공지등록하기</button>";	
			}
			$('#notice').html(html);
// 			$('#noticePaging').html(res.navigation.navigator);
			console.dir(res);
		})
		.fail(function() {
			alert("fail");
		})
	})
	$(document).on('click', '#updateNotice', function() {
		var html = "<div class='form-group' align='left'><label for=''>제목</label>"
			html += "<input type='text' class='form-control' id='title' name='qnaTitle' placeholder='제목''></div>";
			html += "<div class='form-group' align='left'><label for=''>내용</label>";
			html += "<input type='text' class='form-control' id='content' name='qnaContent' placeholder='내용' onkeydown='javascript:if(event.keyCode == 13) {login();}'></div>";
			html += "<button type='button' value='"+this.value+"'id='setNotice' class='btn btn-dark btn-lg btn-block'>공지사항 수정하기</button>";
			$('#notice').html(html);
	})
	$(document).on('click', '#setNotice', function() {
		$.ajax({
			url: '${pageContext.request.contextPath}/noticemodify',
			method: 'POST',
			data: {
				no: this.value,
				title: $('#title').val(),
				content: $('#content').val() 
			}
		})
		.done(function(res) {
			
		})
	})
	$(document).on('click', '#deleteNotice', function() {
		$.ajax({
			url: '${pageContext.request.contextPath}/noticedelete',
			method: 'POST',
			data: {
				no: this.value
			}
		})
		.done(function(res) {
		})
	})
	$(document).on('click', '#addNotice', function() {
		var html = "<div class='form-group' align='left'><label for=''>제목</label>"
			html += "<input type='text' class='form-control' id='title' name='qnaTitle' placeholder='제목''></div>";
			html += "<div class='form-group' align='left'><label for=''>내용</label>";
			html += "<input type='text' class='form-control' id='content' name='qnaContent' placeholder='내용' onkeydown='javascript:if(event.keyCode == 13) {login();}'></div>";
			html += "<button type='button' id='insertNotice' class='btn btn-dark btn-lg btn-block'>공지사항 등록하기</button>";
			$('#notice').html(html);
	})
	$(document).on('click', '#insertNotice', function() {
		$.ajax({
			url: '${pageContext.request.contextPath}/noticeinsert',
			method: 'POST',
			data: {
				title: $('#title').val(),
				content: $('#content').val()
			}
		})
		.done(function(res) {
			if(res) {
				console.log("success");	
			}
			else {
				alert("공지사항을 등록할 수 있는 사용자가 아닙니다.");
				location.href = '${pageContext.request.contextPath}/mvmain';	
			}
		})
	})
	$(document).on('click', '.selected', function() {
		var val = $(this).next().next().next().children().attr('value');
		var html = "<table class='table'>";
		$.ajax({
			url: '${pageContext.request.contextPath}/detail?no='+val,
			method: 'GET'
		})
		.done(function(res) {
			var win = window.open('', 'Detail', "width=250, height=150");
// 			console.dir(res.data);
			html += "<tr><td>거래금액</td><td>"+res.data.dealAmount+"</td></tr>";
			html += "<tr><td>최근거래일</td><td>"+res.data.dealYear+"-"+res.data.dealMonth+"-"+res.data.dealDay+"</td></tr>";
			html += "<tr><td>전용면적</td><td>"+res.data.area+"</td></tr>";
			html += "<tr><td>예약금</td><td>"+res.data.deposit*100+"</td></tr>";
			console.log(html);
// 			$('#result').html(html);
			win.document.write(html);
		})
		.fail(function(res) {
			alert("데이터 불러오기에 실패했습니다.");
		})
	})
	$(document).on('click','.preserve',function(event){
<%-- 			if(!<%=isLogin%>) { --%>
// 				alert("로그인이 필요한 서비스입니다.");
// 				location.href = '${pageContext.request.contextPath}/login';
// 				return;
// 			}
			console.log(this.value);
			var no = '';
			$.post('${pageContext.request.contextPath}/pay',
					{
						no: this.value
					}, function(result) {
						var data = JSON.parse(result);
						no = data.no;
						IMP.request_pay({
							pg : 'html5_inicis', // version 1.1.0부터 지원.
							pay_method : 'card',
							merchant_uid : 'merchant_' + new Date().getTime(),
							name : data.addr,
							//결제창에서 보여질 이름
							amount : data.price/100,
							//가격
							buyer_email : 'email@email.com',
							buyer_name : data.user,
							buyer_tel : data.phone,
							buyer_addr : data.addr,
							buyer_postcode : '123-456',
							m_redirect_url : '${pageContext.request.contextPath}/mvmain'
						}, function(rsp) {
							console.log(rsp);
							if (rsp.success) {
								var msg = '결제가 완료되었습니다.';
								msg += '고유ID : ' + rsp.imp_uid;
								msg += '상점 거래ID : ' + rsp.merchant_uid;
								msg += '결제 금액 : ' + rsp.paid_amount/100;
								msg += '카드 승인번호 : ' + rsp.apply_num;
								location.href = '${pageContext.request.contextPath}/payments/complete?no='+no;
							} else {
								var msg = '결제에 실패하였습니다.';
								msg += '에러내용 : ' + rsp.error_msg;
							}
							alert(msg);
						});
					}
			)
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	})
	$(document).ready(function() {
		$('#chat').click(function() {
			console.log("click");
			window.open('http://pf.kakao.com/_rkyLxb', '해피하우스 채팅', 'width=500, height=500, top=100, left=200, location=no');
		});
// 		console.log('${pageContext.request.contextPath}/list?page='+0);
		$.ajax({
			url:'${pageContext.request.contextPath}/list?page='+0,
			method: 'GET'
		})
		.done(function(res) {
// 			console.dir(res.navigation.navigator);
			$('#navigator').html(res.navigation.navigator);
			var list = res.list;
			var html = "<table class='table'><tr><td>동</td><td>아파트이름</td><td>최근거래일자</td><td>예약여부</td></tr>";
			var size = res.list.length;
			var hidden = "";
			for(var i = 0; i < size; i++) {
// 				console.log(list[i]);
				hidden += "<input type='hidden' class='lat' name='lat' value='"+list[i].lat+"'><br/>";
			  	hidden += "<input type='hidden' class='lng' name='lng' value='"+list[i].lng+"'><br/>";	
			  	html += "<tr><input type='text' style='display: none;' value="+list[i].no+">";
				html += "<td class='selected'>"+list[i].dong+"</td>";
				html += "<td>"+list[i].aptName+"</td>";
				html += "<td>"+list[i].dealYear+"-"+list[i].dealMonth+"-"+list[i].dealDay+"</td>";
				if(list[i].isreserved == false) {
					html += "<td><button class='preserve btn btn-secondary btn-block' value="+list[i].no+">예약가능</button></td></tr>";
				}
				else {
					html += "<td>예약불가</td></tr>";
				}
			}
// 			console.log(hidden);
// 			$('#mapInfo').html(hidden);
			html += "</table>";
			$('#table').html(html);
			$('#mainPaging').html(res.navigation.navigator);
// 			console.log(html);
		})
		.fail(function() {
			console.log("fail");
		});
		var IMP = window.IMP; // 생략가능
		IMP.init('imp22846604');
		var root = '';
		$('#searchHome').click(function() {
			var checkbox = '';
			$('input:checkbox[name="type"]:checked').each(function() {
				if(checked = true) {
					checkbox += $(this).val();
				}
			})	
			location.replace("/ssafy/mvmain?searchType="+$('#search option:selected').val()+"&value="+$('#searchValue').val()+"&type="+checkbox);
		});
	});
	</script>
	
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
.page-link:link {
	color: black;
}
.page-link:hover {
	color: #777777;
}
.page-link:visited {
	color: #EEEEEE;	
}
.page-link:active {
	color: #000000;
}
table {
	text-align: center;
	align: center;
}
</style>
</head>

<body>
	<!-- Loader -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
	</div>
	
	<!-- Page Content -->
	<div class="container-fluid tm-main">
		<div class="row tm-main-row">

			<!-- Sidebar -->
			<div id="tmSideBar" class="col-xl-3 col-lg-4 col-md-12 col-sm-12 sidebar">

				<button id="tmMainNavToggle" class="menu-icon">&#9776;</button>

				<div class="inner">
					<nav id="tmMainNav" class="tm-main-nav">
						<ul>
							<li>
								<a href="#intro" id="tmNavLink1" class="scrolly active" data-bg-img="home13.jpg" data-page="#tm-section-1">
									<i class="fas fa-home tm-nav-fa-icon"></i>
									<span>주택 목록보기</span>
								</a>
							</li>
							<li>
								<a href="#products" id="tmNavLink2" class="scrolly" data-bg-img="home02.jpg" data-page="#tm-section-2" data-page-type="carousel">
									<i class="fa fa-cog fa-spin tm-nav-fa-icon"></i>
									<span>공지사항</span>
								</a>
							</li>							
							<li>
								<a href="#company"  id="tmNavLink3" class="scrolly" data-bg-img="home10.jpg" data-page="#tm-section-3">
									<i class="fas fa-users tm-nav-fa-icon"></i>
									<span>QnA</span>
								</a>
							</li>
							<li>
								<a href="#commerce"  id="tmNavLink4" class="scrolly" data-bg-img="home04.jpg" data-page="#tm-section-4">
									<i class="fas fa-comments tm-nav-fa-icon"></i>
									<span>상가정보</span>
								</a>
							</li>
<!-- 							<li> -->
<!-- 								<a href="#env"  id="tmNavLink5" class="scrolly" data-bg-img="home08.jpg" data-page="#tm-section-4"> -->
<!-- 									<i class="fas fa-comments tm-nav-fa-icon"></i> -->
<!-- 									<span>환경정보</span> -->
<!-- 								</a> -->
<!-- 							</li> -->
							<li>
								<a href="#weather"  id="tmNavLink6" class="scrolly" data-bg-img="home07.jpg" data-page="#tm-section-5">
									<i class="fas fa-comments tm-nav-fa-icon"></i>
									<span>대기정보</span>
								</a>
							</li>
							<li>
								<a href="#logout"  id="tmNavLink7" class="scrolly" data-bg-img="home07.jpg" data-page="#tm-section-6">
									<i class="fa fa-quote-left fa-lg fa-pull-left tm-nav-fa-icon"></i>
									<span>&nbsp;&nbsp;로그아웃</span>
								</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>

			<div class="col-xl-9 col-lg-8 col-md-12 col-sm-12 tm-content">
					<!-- section 1 -->
					<section style="margin: auto; width: 1000px;"id="tm-section-1" class="tm-section">
					<h1 align="center">HAPPY HOUSE</h1>
						<div style="float: left; padding-left: 100px;">
							<div id="table"></div>
						</div>
						<div style="float: right; padding-right: 50px;">
							<div id="result"></div>
						</div>
						<div style="clear: both;">
							<div id="mainPaging"></div>
						</div>
					</section>
					
					<section id="tm-section-2" class="tm-section" style="margin: auto; width: 700px;">
						<h1 align="center">공지사항</h1>
						<div id="notice"></div>
						<div id="noticePaging" style="width: 400px; margin: auto;"></div>
					</section>
					<!-- section 3 -->
					<section id="tm-section-3" class="tm-section" style="margin: auto; width: 1000px;">
						<h1 align="center">QnA</h1>
						<div id="qna"></div>
						<div id="qnaPaging"></div>						
					</section>

					<!-- section 4 -->
					<section id="tm-section-4" class="tm-section" style="margin: auto;">
						<h1 align="center">상가정보</h1>
						<div id="commerce"></div>
						<div id="commercePaging"></div>
					</section>		
					<!-- section 5 -->
<!-- 					<section id="tm-section-5" class="tm-section"> -->
<!-- 						<div id="env"></div> -->
<!-- 						<div id="envPagin"></div> -->
<!-- 					</section> -->
					<!-- section 6 -->
					<section id="tm-section-5" class="tm-section" style="margin: auto; width: 700px;">
						<h1 align="center">대기정보</h1>
						<div id="air"></div>
						<div id="airPaging"></div>
					</section>
					<!-- section 7 -->
					<section id="tm-section-6" class="tm-section" style="margin: auto; width: 700px;">
					</section>						
				</div>	<!-- .tm-content -->							
				<footer class="footer-link">
					<p class="tm-copyright-text">Copyright &copy; 2020 임성빈, 신은총
                    - Design: 신은총&nbsp;&nbsp;&nbsp;&nbsp;
                    <img style="cursor: pointer; "id="chat" width="50" height="50" src="resources/img/chat.png" alt="chat">
                    </p>
                    
				</footer>
			</div>	<!-- row -->			
		</div>
		<div id="preload-01"></div>
		<div id="preload-02"></div>
		<div id="preload-03"></div>
		<div id="preload-04"></div>

		<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="resources/js/jquery.magnific-popup.min.js"></script>
		<script type="text/javascript" src="resources/js/jquery.backstretch.min.js"></script>
		<script type="text/javascript" src="resources/slick/slick.min.js"></script> <!-- Slick Carousel -->

		<script>

		var sidebarVisible = false;
		var currentPageID = "#tm-section-1";

		// Setup Carousel
		function setupCarousel() {

			// If current page isn't Carousel page, don't do anything.
			if($('#tm-section-2').css('display') == "none") {
			}
			else {	// If current page is Carousel page, set up the Carousel.

				var slider = $('.tm-img-slider');
				var windowWidth = $(window).width();

				if (slider.hasClass('slick-initialized')) {
					slider.slick('destroy');
				}

				if(windowWidth < 640) {
					slider.slick({
	              		dots: true,
	              		infinite: false,
	              		slidesToShow: 1,
	              		slidesToScroll: 1
	              	});
				}
				else if(windowWidth < 992) {
					slider.slick({
	              		dots: true,
	              		infinite: false,
	              		slidesToShow: 2,
	              		slidesToScroll: 1
	              	});
				}
				else {
					// Slick carousel
	              	slider.slick({
	              		dots: true,
	              		infinite: false,
	              		slidesToShow: 3,
	              		slidesToScroll: 2
	              	});
				}

				// Init Magnific Popup
				$('.tm-img-slider').magnificPopup({
				  delegate: 'a', // child items selector, by clicking on it popup will open
				  type: 'image',
				  gallery: {enabled:true}
				  // other options
				});
      		}
  		}

  		// Setup Nav
  		function setupNav() {
  			// Add Event Listener to each Nav item
	     	$(".tm-main-nav a").click(function(e){
	     		e.preventDefault();
		    	
		    	var currentNavItem = $(this);
		    	changePage(currentNavItem);
		    	
		    	setupCarousel();
		    	setupFooter();

		    	// Hide the nav on mobile
		    	$("#tmSideBar").removeClass("show");
		    });	    
  		}

  		function changePage(currentNavItem) {
  			// Update Nav items
  			$(".tm-main-nav a").removeClass("active");
     		currentNavItem.addClass("active");

	    	$(currentPageID).hide();

	    	// Show current page
	    	currentPageID = currentNavItem.data("page");
	    	$(currentPageID).fadeIn(1000);

	    	// Change background image
	    	var bgImg = currentNavItem.data("bgImg");
	    	$.backstretch("resources/img/" + bgImg);		    	
  		}

  		// Setup Nav Toggle Button
  		function setupNavToggle() {

			$("#tmMainNavToggle").on("click", function(){
				$(".sidebar").toggleClass("show");
			});
  		}

  		// If there is enough room, stick the footer at the bottom of page content.
  		// If not, place it after the page content
  		function setupFooter() {
  			
  			var padding = 100;
  			var footerPadding = 40;
  			var mainContent = $("section"+currentPageID);
  			var mainContentHeight = mainContent.outerHeight(true);
  			var footer = $(".footer-link");
  			var footerHeight = footer.outerHeight(true);
  			var totalPageHeight = mainContentHeight + footerHeight + footerPadding + padding;
  			var windowHeight = $(window).height();		

  			if(totalPageHeight > windowHeight){
  				$(".tm-content").css("margin-bottom", footerHeight + footerPadding + "px");
  				footer.css("bottom", footerHeight + "px");  			
  			}
  			else {
  				$(".tm-content").css("margin-bottom", "0");
  				footer.css("bottom", "20px");  				
  			}  			
  		}

  		// Everything is loaded including images.
      	$(window).on("load", function(){

      		// Render the page on modern browser only.
      		if(renderPage) {
				// Remove loader
		      	$('body').addClass('loaded');

		      	// Page transition
		      	var allPages = $(".tm-section");

		      	// Handle click of "Continue", which changes to next page
		      	// The link contains data-nav-link attribute, which holds the nav item ID
		      	// Nav item ID is then used to access and trigger click on the corresponding nav item
		      	var linkToAnotherPage = $("a.tm-btn[data-nav-link]");
			    
			    if(linkToAnotherPage != null) {
			    	
			    	linkToAnotherPage.on("click", function(){
			    		var navItemToHighlight = linkToAnotherPage.data("navLink");
			    		$("a" + navItemToHighlight).click();
			    	});
			    }
		      	
		      	// Hide all pages
		      	allPages.hide();

		      	$("#tm-section-1").fadeIn();

		     	// Set up background first page
		     	var bgImg = $("#tmNavLink1").data("bgImg");
		     	
		     	$.backstretch("resources/img/" + bgImg, {fade: 500});

		     	// Setup Carousel, Nav, and Nav Toggle
			    setupCarousel();
			    setupNav();
			    setupNavToggle();
			    setupFooter();

			    // Resize Carousel upon window resize
			    $(window).resize(function() {
			    	setupCarousel();
			    	setupFooter();
			    });
      		}	      	
		});

		</script>
	</body>
</html>