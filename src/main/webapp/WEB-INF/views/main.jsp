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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
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
<!-- 	<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script> -->
<script>
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
					html += "<td><button class='preserve' value="+list[i].no+">예약가능</button></td>";
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
	$(document).on('click', '.selected', function() {
		var val = $(this).next().next().next().children().attr('value');
		var html = "<table>";
		$.ajax({
			url: '${pageContext.request.contextPath}/detail?no='+val,
			method: 'GET'
		})
		.done(function(res) {
// 			console.dir(res.data);
			html += "<tr><td>거래금액</td><td>"+res.data.dealAmount+"</td></tr>";
			html += "<tr><td>최근거래일</td><td>"+res.data.dealYear+"-"+res.data.dealMonth+"-"+res.data.dealDay+"</td></tr>";
			html += "<tr><td>전용면적</td><td>"+res.data.area+"</td></tr>";
			html += "<tr><td>예약금</td><td>"+res.data.deposit*100+"</td></tr>";
			console.log(html);
			$('#result').html(html);
		})
		.fail(function(res) {
			alert("데이터 불러오기에 실패했습니다.");
		})
// 		var html = '<table><tr><td>거래금액</td><td>'+$(this).prev().prev().prev().prev().prev().val()+"</td></tr>";
// 		html += '<tr><td>최근거래일</td><td>';
// 		var month = $(this).prev().prev().val();
// 		var day = $(this).prev().val();
// 		if(month < 10) {
// 			month = "0" + month;
// 		}
// 		if(day < 10) {
// 			day = "0" + day;
// 		}
// 		html += $(this).prev().prev().prev().val()+"-"+month+"-"+day+"</td></tr>";
// 		html += '<tr><td>전용면적</td><td>'+$(this).prev().prev().prev().prev().val()+"</td></tr>";
// 		html += '<tr><td>예약금</td><td>'+$(this).prev().prev().prev().prev().prev().val()+"</td></tr></table>";
	})
	$(document).on('click','.preserve',function(event){
// 	$('.reserve').on('click', function() {
			//로그인되어있는지를 판단해서 로그인되어있지않으면 alert(로그인하세요)를 띄운다.
	<%-- 			console.log('<%=isLogin%>'); --%>
			if(!<%=isLogin%>) {
				alert("로그인이 필요한 서비스입니다.");
				location.href = '${pageContext.request.contextPath}/login';
				return;
			}
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
// 		console.log('${pageContext.request.contextPath}/list?page='+0);
		$.ajax({
			url:'${pageContext.request.contextPath}/list?page='+0,
			method: 'GET'
		})
		.done(function(res) {
			console.dir(res);
// 			console.dir(res.navigation.navigator);
			$('#navigator').html(res.navigation.navigator);
			console.dir(res);
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
					html += "<td><button class='preserve' value="+list[i].no+">예약가능</button></td></tr>";
				}
				else {
					html += "<td>예약불가</td></tr>";
				}
			}
// 			console.log(hidden);
// 			$('#mapInfo').html(hidden);
			html += "</table>";
			$('#table').html(html);
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
.table {
	
}

#chat:hover {
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<br />
	<br />
	<div id="container" align="center">
		<div style="float: center;">
			<input type="checkbox" name="type" value="1">아파트 매매 <input
				type="checkbox" name="type" value="2">아파트 전월세 <input
				type="checkbox" name="type" value="3">연립, 주택 매매 <input
				type="checkbox" name="type" value="4">연립, 주택 전월세 <br /> <br />
			<select name="search" id="search">
				<option value="dong">동으로 검색</option>
				<option value="name">아파트 이름으로 검색</option>
			</select> <input type="text" id="searchValue">
			<button type="button" id="searchHome">검색</button>
		</div>
		<hr />
		<div>
			<div style="display: inline-block;" id="table"></div>
			<div id="mapInfo" style="display: none;"></div>
			<div
				style="float: right; display: inline-block; padding-right: 100px; width: 400px;">
				<div id="map"
					style="width: 100%; height: 400px; margin-bottom: 30px;"></div>
				<div id="result"></div>
			</div>
			<div style="clear: both; width: 600px; margin: auto;" id="navigator">
			</div>
<!-- <script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script> -->
<!-- <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDijPLobXDOT-R3Aq8WMi4HxXHybVrAUH8&callback=initMap"></script> -->
<!-- <script> -->
<!-- // 	var arr = new Array(); -->
<!-- // 	for(var i = 0; i < 10; i++) { -->
<!-- // 		arr[i] = new Array(); -->
<!-- // 	} -->
<!-- // 	var lat = new Array(); -->
<!-- // 	var idx = 0; -->
<!-- // 	var avgLat = 0; -->
<!-- // 	var avgLng = 0; -->
<!-- // 	$('.lat').each(function() { -->
<!-- // 		arr[idx++][0] = $(this).val(); -->
<!-- // // 		console.log("lat: "+$(this).val()); -->
<!-- // 		avgLat += $(this).val()*1; -->
<!-- // 	}) -->
<!-- // 	console.log(avgLat); -->
<!-- // 	var lng = new Array(); -->
<!-- // 	idx = 0; -->
<!-- // 	$('.lng').each(function() { -->
<!-- // 		arr[idx++][1] = $(this).val(); -->
<!-- // 		avgLng += $(this).val()*1; -->
<!-- // // 		console.log("lng: "+$(this).val()); -->
<!-- // 	}) -->
<!-- // // 	console.log(avgLng); -->
<!-- // 	var locations = new Array(); -->
<!-- // 	for(var i = 0; i < 10; i++) { -->
<!-- // 		var json = new Object(); -->
<!-- // 		json.lat = arr[i][0]*1; -->
<!-- // 		json.lng = arr[i][1]*1; -->
<!-- // 		locations.push(json); -->
<!-- // 	} -->
<!-- // 	console.log(avgLat+" "+avgLng); -->
<!-- // 	var multi = {lat: avgLat/10, lng: avgLng/10}; -->
<!-- // // 	console.dir(multi); -->
<!-- // 	var map; -->
<!-- // 	function initMap() { -->
<!-- // 		map = new google.maps.Map(document.getElementById('map'), { -->
<!-- // 			center: multi, zoom: 13 -->
<!-- // 		}); -->
<!-- // 		var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'; -->
<!-- // 		var markers = locations.map(function(location, i) { -->
<!-- // 			return new google.maps.Marker({ -->
<!-- // 				position: location, -->
<!-- // 	            label: labels[i % labels.length] -->
<!-- // 			}); -->
<!-- // 		}); -->
<!-- // 		var markerCluster = new MarkerClusterer(map, markers, -->
<!-- // 	            {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'}); -->
<!-- // 	} -->
<!-- </script> -->
<br /> <br />
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>

