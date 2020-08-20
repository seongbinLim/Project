<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	$(document).ready(function() {
		$('#chat').click(function() {
			console.log("click");
			window.open('http://pf.kakao.com/_rkyLxb', '해피하우스 채팅', 'width=500, height=500, top=100, left=200, location=no');
		});
	})
</script>
</head>
<body>
	<footer style="width: 100%; height: 125px;">
	<hr>
		<div style="float: left; padding-left: 150px; padding-top: 30px;">
			<table class="table table-borderless table-sm">
				<tr>
					<th scope="col">개발자</th>
					<td>신은총</td>
					<td>임성빈</td>
				</tr>
				<tr>
					<th scope="row">강조하는거</th>
					<td>대충아무거나 채워넣어야됨</td>
					<td>내키는대로 걍넣기</td>
				</tr>
			</table>
		</div>
	
		<div style="float: right; padding-top: 30px; padding-right: 100px;">
			<img id="chat" width="50" height="50" src="https://cdn.icon-icons.com/icons2/1744/PNG/512/3643728-balloon-chat-conversation-speak-word_113413.png" alt="chat">
		</div>
	</footer>
</body>
</html>