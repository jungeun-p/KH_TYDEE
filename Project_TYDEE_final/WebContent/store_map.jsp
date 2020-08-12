<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TYDEE</title>
<!--google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="./map_css/map.css" />
<!--font awsome-->
<script src="https://kit.fontawesome.com/9378bc4c66.js"
	crossorigin="anonymous"></script>
<style>
.all {
	padding-right: 10px;
	padding-top: 10px;
	padding-left: 10px;
	padding-bottom: 10px;
	border-radius: 10px;
}

a {
	text-decoration: none;
	font-weight: bold;
}

div {
	border-radius: 15px;
	font-size: 12px;
}

#map > div{
	text-align: center;
}

.header {
	position: sticky;
	top: 0;
}
</style>
</head>
<body>
	</head>
<body>
	<div class="header">
		<%@ include file="./include/main_header_test.jsp"%>
	</div>
	<div class="tydee__maps">
		<div class="tydee__maps__title">
			<h2>Map</h2>
		</div>
		<section class="tydee__map">
			<div class="search">
				<input class="tiny__search" type="text" name="search" /> <span
					class="icon"><i class="fas fa-search" type="button"
					id="button"></i></span>
			</div>
			<div id="map" style="width: 700px; height: 400px;"></div>
		</section>
	</div>
	<script
		src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=4c35c6f158102c8e29ea7ee8363b1de1"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.507964, 126.982740), // 지도의 중심좌표
			level : 7, // 지도의 확대 레벨
			mapTypeId : kakao.maps.MapTypeId.ROADMAP
		// 지도종류
		};

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption);

		//반복생성 

		var dt = [
				[
						37.500168,
						127.142190,
						"<a href='http://cafe.naver.com/sssaemaul'><div class='all'>🎍송파구 재활용센터🎍</div></a>" ],
				[
						37.591151,
						126.884284,
						"<a href='http://woorirecycle.uweb.kr/'><div class='all'>🎍은평구 재활용센터🎍</div></a>" ],
				[
						37.572110,
						127.067691,
						"<a href='http://www.dm8272.co.kr/'><div class='all'>🎍동대문구 제3재활용센터🎍</div></a>" ],
				[
						37.578858,
						127.068980,
						"<a href='http://www.dm8272.co.kr/'><div class='all'>🎍동대문구 제1재활용센터🎍</div></a>" ],
				[
						37.580190,
						127.051144,
						"<a href='http://www.dm8272.co.kr/'><div class='all'>🎍동대문구 제2재활용센터🎍</div></a>" ],
				[
						37.566467,
						126.842259,
						"<a href='http://www.gurogu.co.kr/main/main.php/'><div class='all'>🎍강서구 중고재활용센터🎍</div></a>" ],
				[
						37.503233,
						126.886017,
						"<a href='http://www.gurogu.co.kr/main/main.php/'><div class='all'>🎍구로구 재활용센터🎍</div></a>" ],
				[
						37.526019,
						126.893969,
						"<a href='http://www.seoule.co.kr/'><div class='all'>🎍영등포구 재활용센터1관🎍</div></a>" ],
				[
						37.585730,
						127.088141,
						"<a href='http://010-3763-8939.infom.kr/'><div class='all'>🎍중랑구 재활용센터🎍</div></a>" ],
				[
						37.545155,
						126.844101,
						"<a href='http://gsjunggo.godohosting.com/'><div class='all'>🎍강서 재활용센터🎍</div></a>" ],
				[
						37.585730,
						127.088141,
						"<a href='http://010-3763-8939.infom.kr/'><div class='all'>🎍중랑구 재활용센터🎍</div></a>" ],
				[ 37.481127, 126.909353,
						"<a href='http://www.jungo.co.kr/'><div class='all'>🎍관악구 제활용센터1관🎍</div></a>" ],
				[ 37.473790, 126.903070,
						"<a href='http://www.jungo.co.kr/'><div class='all'>🎍독산동 재활용센터🎍</div></a>" ],
				[ 37.489346, 127.066226,
						"<a href='http://gnthct.ihope.co.kr/'><div class='all'>🎍강남구 재활용센터🎍</div></a>" ],
				[ 37.539064, 126.842533,
						"<a href='https://relive.modoo.at/'><div class='all'>🎍친환경 재활용센터🎍</div></a>" ],
				[ 37.557585, 127.157056,
						"<a href='http://www.rety.co.kr/'><div class='all'>🎍(주)리싸이클씨티🎍</div></a>" ],
				[ 37.582758, 126.936668,
						"<a href='http://www.s8272.co.kr/'><div class='all'>🎍서대문구 재활용센터🎍</div></a>" ],
				[ 37.524009, 126.869100,
						"<a href='http://www.ycrc.co.kr/'><div class='all'>🎍양천구 목동 재활용센터🎍</div></a>" ],
				[ 37.516570, 126.838829,
						"<a href='http://www.ycrc.co.kr/'><div class='all'>🎍양천구 서부 재활용센터🎍</div></a>" ],
				[
						37.644429,
						127.020975,
						"<a href='http://www.zungo.co.kr/main/'><div class='all'>🎍강북구 재활용센터🎍</div></a>" ],
				[
						37.605521,
						127.047389,
						"<a href='http://www.zungo.co.kr/main/'><div class='all'>🎍성북구 재활용센터🎍</div></a>" ],
				[
						37.636053,
						127.071598,
						"<a href='http://www.zungo.co.kr/north/'><div class='all'>🎍노원구 재활용센터 1관🎍</div></a>" ],
				[
						37.654729,
						127.073917,
						"<a href='http://www.zungo.co.kr/north/'><div class='all'>🎍노원구 재활용센터 2관🎍</div></a>" ],
				[ 37.459038, 127.040550,
						"<a href='http://www.서초구5717272.com/'><div class='all'>🎍서초구 재활용센터🎍</div></a>" ],
				[
						37.498734,
						126.913851,
						"<a href='http://www.seoule.co.kr/'><div class='all'>🎍영등포구 재활용센터 2관🎍</div></a>" ],
				[ 37.547346, 126.971477,
						"<a href='http://www.seoule.co.kr/'><div class='all'>🎍용산 재활용센터🎍</div></a>" ],
				[
						37.505905,
						127.024104,
						"<a href='http://www.rety.co.kr/'><div class='all'>&nbsp;&nbsp;&nbsp;🎍리싸이클세상🎍</div></a>" ],

		]

		for (var i = 0; i < dt.length; i++) {

			//지도에 마커를 생성하고 표시한다.
			var marker = new kakao.maps.Marker({
				position : new kakao.maps.LatLng(dt[i][0], dt[i][1], dt[i][2],
						dt[i][3]), //마커의 좌표
				// 마커를 표시할 지도 객체
				map : map

			});

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : dt[i][2]
			});

			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker);

		}
	</script>

</body>


</html>