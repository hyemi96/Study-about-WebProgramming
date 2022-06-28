
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
.layer{
	display: none; 
	width: auto; 
	height: auto; 
	border: 2px solid gray; 
	background-color:#FFF; 
	padding:10px; 
	font-size:15px; 
	line-height:20px; 
	font-weight:100
}
</style>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=A~~~~~~~~8" ></script>
<script type="text/javascript">
$(document).ready(function() { 
		
	getLocation();
	
    $("#btnSearch").click(function() {
    	codeAddress();
    });
    $("#btnReset").click(function() {
    	getLocation();
    });

});


var geocoder;
var map;
var lat;
var lon;



/* 현재 위치 구하기 */
function getLocation() {
	  if (navigator.geolocation) { // GPS를 지원하면
	    navigator.geolocation.getCurrentPosition(function(position) {
	      
	    	console.log(position.coords.latitude + ' ' + position.coords.longitude);
	    	
		    lat = position.coords.latitude;
		    lon = position.coords.longitude;
		    
		    console.log("현재 lat : " + lat + ',' + "현재 lon : "+ lon);
		    
		    initialize(lat, lon); /* 콜백 */
	      
	    }, function(error) {
	      console.error(error);
	    }, {
	      enableHighAccuracy: false,
	      maximumAge: 0,
	      timeout: Infinity
	    });
	  } else {
	    alert('GPS를 지원하지 않습니다');
	  }
}


/* 엔터키 검색기능 */
function enterkey() {
    if (window.event.keyCode == 13) {
    	codeAddress();
    }
}


/* 지도 초기화 모드 */
function initialize(lat , lon) {
	
	console.log(lat, lon);
	
	$("#layer").html(`
			<div class="title">
				<strong>검색위치 :</strong> <span id="title">도시명</span>
			</div>
			<div class="latitude">
				<strong>위도 :</strong> <span id="latitude">해당 위도값</span>
			</div>
			<div class="longitude">
				<strong>경도 :</strong> <span id="longitude">해당 경도값</span>
			</div>
			<div class="weather">
				<strong>날씨 :</strong> <span id="weatherUi">날씨를 조회할 곳을 검색해보세요</span>
			</div>
			`);
	
	$("#positionList").html(`
					<tr>
					<td style="height: 50px;" colspan="5"> 조회 내역이 없습니다. </td>
					</tr>
					`);
	
	$("#hide").hide();
	
	//지도에 기본값을 현위치로 표출하기
	geocoder = new google.maps.Geocoder();
	
	var latlng = new google.maps.LatLng(lat, lon);
	var mapOptions = {
	  zoom: 10,
	  center: latlng
	}
	map = new google.maps.Map(document.getElementById('map'), mapOptions);
	
	
	//현재위치 마커표시
    var marker = new google.maps.Marker({
        map: map,
        position: latlng,
        style : color='bule'
    });
    var message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
	
    var iwContent = message, // 인포윈도우에 표시할 내용
    iwRemoveable = true;

	// 인포윈도우를 생성합니다
	var infowindow = new google.maps.InfoWindow({
	    content : iwContent,
	    removable : iwRemoveable
	});
	
	// 인포윈도우를 마커위에 표시합니다 
	infowindow.open(map, marker);   
	  
}


/* 해당 검색어의 위도 경도 구하기 */
function codeAddress() {

	var address = document.getElementById('searchKeyword').value;
	
	if(address ==""){
		getLocation();
		return;
	}
	
	geocoder = new google.maps.Geocoder();
	
	geocoder.geocode( { 'address': address}, function(results, status) {
	  if (status == 'OK') {
	    map.setCenter(results[0].geometry.location);
	    var marker = new google.maps.Marker({
	        map: map,
	        position: results[0].geometry.location
	        
	    });
	    
	    lat = marker.getPosition().lat();
	    lon = marker.getPosition().lng();

	    console.log("위도 : "+ lat + ", 경도 : "+lon);
	    
	    
		var innerHTML = `
			           <tr> 
			              <td>` + address + `</td>
			              <td><input type="hidden" id="lat" name="lat" value="` +lat+ `"/>` + lat + `</td>
			              <td><input type="hidden" id="lon" name="lon" value="` +lon+ `"/>` + lon + `</td>
			              <td id="weatherImg"></td>
			              <td id="airImg"></td> 
			           </tr>
			        `;

		$("#positionList").html(innerHTML);
		
		weather();/* 구한위도 경도로 날씨 검색 */
        airPollution();/* 구한위도 경도로 미세먼지 검색 */
	    
	  } else {
	    //alert('Geocode was not successful for the following reason: ' + status);
	    if (status == 'ZERO_RESULTS') {
	    	alert('조회결과가 없습니다!: ' + status);
	    	$("#searchKeyword").val("");
	    }else{
	    	alert('Geocode was not successful for the following reason: ' + status);
	    	$("#searchKeyword").val("");
	    }
	  }
	});
}



/* 날씨 구현부분 */
function weather() {

var lat = $("#lat").val();
var lon = $("#lon").val();


var apiURI ="http://api.openweathermap.org/data/2.5/onecall?lat="+lat+"&lon="+lon+"&appid=5~~~~~~~~~~~~~f";
	$.ajax({
	    url: apiURI,
	    dataType: "json",
	    type: "GET",
	    async: "false",
	    success: function(resp) {

	        //console.log("현재온도 : "+ (resp.current.temp- 273.15) );
	        //console.log("현재습도 : "+ resp.current.humidity);
	        //console.log("날씨 : "+ resp.current.weather[0].main );
	        //console.log("상세날씨설명 : "+ resp.current.weather[0].description );
	        //console.log("날씨 이미지 : "+ resp.current.weather[0].icon );
	        //console.log("바람   : "+ resp.current.wind_speed );
	        //console.log("나라   : "+ resp.sys.country );
	        //console.log("도시이름  : "+ resp.name );
	        //console.log("구름  : "+ (resp.current.clouds) +"%" );
	        //console.log("타임존  : "+ resp.timezone );
	        
	        //console.log("오늘부터 향후 7일간데이터  : "+ (resp.daily[0].weather[0].icon) 
	        //		+ "," + (resp.daily[1].weather[0].icon) 
			//        + "," + (resp.daily[2].weather[0].icon)
			//        + "," + (resp.daily[3].weather[0].icon)
			//        + "," + (resp.daily[4].weather[0].icon)
			//        + "," + (resp.daily[5].weather[0].icon)
			//        + "," + (resp.daily[6].weather[0].icon)
	        //);
	        
	        
	        $("#title").text(document.getElementById('searchKeyword').value);
	        
	        $("#latitude").text( $("#lat").val());
	        $("#longitude").text($("#lon").val());
	        
			var innerHTML = `
					  <img id="weather-picture" src="http://openweathermap.org/img/w/` + resp.current.weather[0].icon + `.png" />
		              <div>현재날씨명 : ` + resp.current.weather[0].main+ `</div>
		              <div>상세날씨설명 : ` + resp.current.weather[0].description + `</div>
		              <div>현재바람 : ` + resp.current.wind_speed + `m/s</div>
		              <div>현재온도 : ` + (resp.current.temp- 273.15).toFixed(2) + `</div>
		              <div>현재습도 : ` + resp.current.humidity + `%</div>
	                  <div>타임존 : ` + resp.timezone + `</div> 
		        `;
	        
			$("#weatherImg").html((resp.current.temp- 273.15).toFixed(2)+`/<img id="weather-picture" src="http://openweathermap.org/img/w/` + resp.current.weather[0].icon + `.png" />`);
	        $("#weatherUi").html(innerHTML);
	        
			
	        /* 7일 데이터 넣기 */
			
			$("#hide").show();
			
			var innerHTML2 = `
					       <tr>
							  <td>온도/날씨</td>
				              <td>` + (resp.daily[0].temp.day- 273.15).toFixed(2) + `/<img src="http://openweathermap.org/img/w/` + resp.daily[0].weather[0].icon + `.png" /></td>
				              <td>` + (resp.daily[1].temp.day- 273.15).toFixed(2) + `/<img src="http://openweathermap.org/img/w/` + resp.daily[1].weather[0].icon + `.png" /></td>
				              <td>` + (resp.daily[2].temp.day- 273.15).toFixed(2) + `/<img src="http://openweathermap.org/img/w/` + resp.daily[2].weather[0].icon + `.png" /></td>
				              <td>` + (resp.daily[3].temp.day- 273.15).toFixed(2) + `/<img src="http://openweathermap.org/img/w/` + resp.daily[3].weather[0].icon + `.png" /></td>
				              <td>` + (resp.daily[4].temp.day- 273.15).toFixed(2) + `/<img src="http://openweathermap.org/img/w/` + resp.daily[4].weather[0].icon + `.png" /></td>
				              <td>` + (resp.daily[5].temp.day- 273.15).toFixed(2) + `/<img src="http://openweathermap.org/img/w/` + resp.daily[5].weather[0].icon + `.png" /></td>
				              <td>` + (resp.daily[6].temp.day- 273.15).toFixed(2) + `/<img src="http://openweathermap.org/img/w/` + resp.daily[6].weather[0].icon + `.png" /></td>
				           </tr>
	        			`;
	        			
			$("#weatherList").html(innerHTML2);
	    }
	})
}


/* 지도맵 마우스 오버시 날씨 상세정보 팝업 띄우기 */
$(
	function(){
		$('.map').mouseover(function(e) { // 마우스 오버시 좌표를 얻고, 다음 코드를 실행한다.
			$(this).mousemove(function(e) {
			//$('#layer #title').empty().append($(this).attr("city_name"));// layer안에있는 title의 값을 data의 wr_name 값으로 치환한다.
			//$('#layer #latitude').empty().append($(this).attr("lat_name")); // layer안에있는 latitude의 값을 data의 wr_name 값으로 치환한다.
			//$('#layer #longitude').empty().append($(this).attr("lon_name")); // layer안에있는 longitude의 값을 data의 내용으로 치환한다.
			//$('#layer #weatherUi').empty().append($(this).attr("weather_text"));
			
			var t=e.pageY-200; // 레이어를 띄울 곳 : 현재 마우스의  Y 좌표에 -200를 한값
			var l=e.pageX-350; // 레이어를 띄울 현재 마우스의 X 좌표에 -350를 한값을 구한다.
			$('#layer').css({"top":t, "left":l,"position":"absolute","opacity":"0,8" }).show(); // 위에서 구한 좌표값으로 레이어를 띄운다.
			});
		});
		$('.map').mouseout(function() { // 마우스 아웃시 실행한다.
			$('#layer').hide(); // 레이어를 숨긴다.
		});
	}
); 


/* 대기 오염 예보 가져오기 */
function airPollution() {

var lat = $("#lat").val();
var lon = $("#lon").val();


var apiURI ="http://api.openweathermap.org/data/2.5/air_pollution?lat="+lat+"&lon="+lon+"&appid=58~~~~~~~~~~~~~~~~~~f3f";
	$.ajax({
	    url: apiURI,
	    dataType: "json",
	    type: "GET",
	    async: "false",
	    success: function(resp) {

	        //console.log("미세먼지 정도 : "+ (resp.list[0].main.aqi) );
	        //console.log("현재날짜 : "+ resp.list[0].dt);
	        
	        if(resp.list[0].main.aqi =="1"){
	        	$("#airImg").html(`<span>매우 좋음</span>`);
	        }else if(resp.list[0].main.aqi =="2"){
	        	$("#airImg").html(`<span>좋음</span>`);
	        }else if(resp.list[0].main.aqi =="3"){
	        	$("#airImg").html(`<span>보통</span>`);
	        }else if(resp.list[0].main.aqi =="4"){
	        	$("#airImg").html(`<span>조금 나쁨</span>`);
	        }else if(resp.list[0].main.aqi =="5"){
	        	$("#airImg").html(`<span>매우 나쁨</span>`);
	        }

	    }
	})
}
 


</script>


<!-- main-content opened -->
<div class="main-content horizontal-content">
    <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="bg-gray-100 bd-b">
            <div class="d-flex flex-row align-items-stretch ht-45 container admin-breadcrumbs">
                <div class="pd-9 pd-l-0-f flex-grow-1">
                    <a href="javascript:void(0);" class="tx-20">날씨</a>
                </div>
                <div class="pd-10 bg-gray-200 d-none d-sm-block">
                    <a href="javascript:void(0);"><i class="typcn typcn-home"></i></a>
                </div>
                <div class="pd-12 pd-r-0-f align-items-center d-none d-sm-flex">
                    <a href="javascript:void(0);">관제</a> <i class="fe fe-chevron-right mx-2"></i> <a href="javascript:void(0);">날씨</a>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumbs closed -->

    <!-- container opened -->
    <div class="container">
        <div class="row">
            <div class="col-sm-12 mb-5">
                <div class="mg-t-35">
                    <!--===========form 예시2=============-->
                    <div class="border bg-gray-50 rounded">
                        <div class="p-3">
                            <form:form commandName="FaqVO" id="fm" name="fm" method="post" onSubmit="return false;">
                                <div class="d-flex align-items-center w-100 md-nowrow">
                                    <div class="form-between">
                                        <label class="form-label-tx mr-2">검색</label>
                                        <input class="form-control form-control-sm form-control-tx" placeholder="도시를 검색하세요." type="text" style="line-height: 1.2;" id="searchKeyword" name="searchKeyword" value="" maxlength="100" onkeyup="enterkey()" />
                                    </div>
                                    <div class="ml-auto ml-md-0">
                                        <button class="btn btn-primary wd-60 pd-0" style="height: 29.5px;" type="button" id="btnSearch" name="btnSearch">검색</button>
                                    </div>
                                    <div class="ml-1">
                                        <button class="btn btn-secondary wd-60 pd-0" style="height: 29.5px;" type="reset" id="btnReset" name="btnReset">초기화</button>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                    <!--===========/FORM 예시2=============-->
                </div>
                <!-- 지도맵 시작 -->
                <div class="mg-t-35">
					<div id="map" class="map" style="height: 600px;" city_name="검색한 도시명" lat_name="마크업위도값" lon_name="마크업경도값" weather_text="검색한 날씨 값">
					</div>
                </div>
                <!-- 지도맵 끝 -->
				<!-- 지도맵 마우스 오버시 팝업 레이아웃 html -->
				<div id="layer" class="layer" style="top: 277px; left: 1212px; position: absolute; display: none;">
					<div class="title">
						<strong>검색위치 :</strong> <span id="title">도시명</span>
					</div>
					<div class="latitude">
						<strong>위도 :</strong> <span id="latitude">해당 위도값</span>
					</div>
					<div class="longitude">
						<strong>경도 :</strong> <span id="longitude">해당 경도값</span>
					</div>
					<div class="weather">
						<strong>날씨 :</strong> <span id="weatherUi">날씨를 조회할 곳을 검색해보세요</span>
					</div>
				</div>
				<!-- 지도맵 마우스오버시 팝업 레이아웃 끝 -->
                <div class="mg-t-35">
                    <div class="table-responsive template-table-y">
                        <table class="table main-table-reference template-table word-keep-all mb-0" >
                            <colgroup>
                                <col style="width:auto">
                                <col style="width:auto">
                                <col style="width:auto">
                                <col style="width:10%">
                                <col style="width:10%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>도시명</th>
                                    <th>위도</th>
                                    <th>경도</th>
                                    <th>현재날씨</th>
                                    <th>현재미세먼지</th>
                                </tr>
                            </thead>
                            <tbody id="positionList">
                                <tr>
                                    <td style="height: 50px;" colspan="5"> 조회 내역이 없습니다. </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="mg-t-35" id="hide">
                    <div class="table-responsive template-table-y">
                        <table class="table main-table-reference template-table word-keep-all mb-0" >
                            <colgroup>
                                <col style="width:auto">
                                <col style="width:auto">
                                <col style="width:auto">
                                <col style="width:auto">
                                <col style="width:auto">
                                <col style="width:auto">
                                <col style="width:auto">
                                <col style="width:auto">
                            </colgroup>
                            <thead>
                                <tr>
                                	<th>7일간 일기예보</th>
                                    <th>1day</th>
                                    <th>2day</th>
                                    <th>3day</th>
                                    <th>4day</th>
                                    <th>5day</th>
                                    <th>6day</th>
                                    <th>7day</th>
                                </tr>
                            </thead>
                            <tbody id="weatherList">
                                <tr>
                                    <td style="height: 50px;" colspan="8"> 원하시는 지역의 7일 일기예보를 검색해보세요. </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Container closed -->
</div>
<!-- main contoent closed -->
