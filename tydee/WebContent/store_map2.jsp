<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

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
			center : new kakao.maps.LatLng(37.558419, 126.983245), // 지도의 중심좌표
			level : 7, // 지도의 확대 레벨
			mapTypeId : kakao.maps.MapTypeId.ROADMAP
		// 지도종류
		};

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption);

		//반복생성 

		var dt = [
				[37.558419, 126.983245,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(본부)🚞</div></a>" ],
				[37.536737, 126.882202,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(목동)🚞</div></a>" ],
				[37.503372, 127.113628,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(송파)🚞</div></a>" ],
				[37.565757, 127.030291,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(상왕십리)🚞</div></a>" ],
				[37.493071, 127.017679,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(서초)🚞</div></a>" ],
				[37.520126, 126.904736,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(영등포)🚞</div></a>" ],
				[37.544134, 126.838508,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(강서화곡)🚞</div></a>" ],
				[37.555292, 126.910510,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(망원역)🚞</div></a>" ],
				[37.487488, 127.033133,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(양재)🚞</div></a>" ],
				[37.558684, 127.157052,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(강동고덕)🚞</div></a>" ],
				[37.624042, 127.073174,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(노원공릉)🚞</div></a>" ],
				[37.578802, 126.985033,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(안국점)🚞</div></a>" ],
				[37.535780, 127.069011,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(광진자양)🚞</div></a>" ],
				[37.484570, 126.937390,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(관악자명)🚞</div></a>" ],
				[37.530152, 127.122820,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(강동구청역)🚞</div></a>" ],
				[37.630575, 127.024798,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(미아)🚞</div></a>" ],
				[37.620072, 126.922813,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(연신내)🚞</div></a>" ],
				[37.483098, 126.975495,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(남성역)🚞</div></a>" ],
				[37.573827, 127.023135,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(동대문)🚞</div></a>" ],
				[37.543147, 126.972817,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(숙대입구)🚞</div></a>" ],
				[37.527370, 127.030972,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(압구정)🚞</div></a>" ],
				[37.498678, 126.927754,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(신대방)🚞</div></a>" ],
				[37.588554, 127.005529,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(삼선교)🚞</div></a>" ],
				[37.497161, 126.857216,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(개봉)🚞</div></a>" ],
				[37.600024, 127.102709,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(망우)🚞</div></a>" ],
				[37.516355, 127.037857,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(강남구청)🚞</div></a>" ],
				[37.656415, 127.039669,"<a href='http://www.beautifulstore.org'><div class='all'>🚞아름다운가게(방학)🚞</div></a>" ]
				
	
	

		]

		for (var i = 0; i < dt.length; i++) {

			//지도에 마커를 생성하고 표시한다.
			var marker = new kakao.maps.Marker({
				position : new kakao.maps.LatLng(dt[i][0], dt[i][1],dt[i][2],dt[i][3]), //마커의 좌표
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