<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>g_map2</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/live7/00.bs4.css" />
</head>
<body>
	<div class="container">
		<!-- ======= Breadcrumbs ======= -->
		<section>
		<div>
			<div class="container">
				<div class="mt-2 mb-2">
					<h2>g_map2</h2>
				</div>
			</div>
		</div>
		</section>
		<!-- End Breadcrumbs -->
		<!-- section start -->
		<section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 450px;">
				<div class="card-body">

<!-- here start -->
    <div id="map" style="width: 100%; height: 500px; margin: auto;"></div>
	<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC3Jh6Rt72qHXe5GomCfP_4LAuHjs_sr0U&callback=initMap"></script>
    <script>
		var multi = {lat: 37.5012743, lng: 127.039585};
		var map;
		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {
				center: multi, zoom: 13
			});
			var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
			var markers = locations.map(function(location, i) {
				return new google.maps.Marker({
					position: location,
		            label: labels[i % labels.length]
				});
			});
			var markerCluster = new MarkerClusterer(map, markers,
		            {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
		}
		var locations = [
			{lat: 37.5175526, lng: 127.047466},
			{lat: 38.5145960, lng: 127.106067},
			{lat: 36.5300762, lng: 127.123670},
			{lat: 37.4837249, lng: 127.032566},
			{lat: 38.5122476, lng: 126.939739}
		];
	</script>
<!-- here end -->

				</div>
			</div>
		</section>
		<!-- section end -->
		<footer class="col-ms-12 bg-dark rounded mt-1"></footer>
	</div>
</body>
</html>
