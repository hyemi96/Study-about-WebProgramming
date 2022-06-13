 <script type="text/javascript">
    $(document).ready(function(){

      //검색 없이 DB에 있는 모든 정보를 마커에 띄우고 싶다면
      //페이지 시작시 모든 마커 조회 함수실행
      //setSelectMarkers();
    
    });
    var map;
    var infowindow = new google.maps.InfoWindow();
    var marker = [];
    var geocoder;
    var geocodemarker = [];

    var latlng = new google.maps.LatLng(37.5240220, 126.9265940);

    var addrOptions = {
      zoom: 10,
      center: latlng, //
      mapTypeControl: false,
      navigationControlOptions: {
        style: google.maps.NavigationControlStyle.SMALL
      },
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map(document.getElementById("googleMap"), addrOptions);
    geocoder = new google.maps.Geocoder();
    google.maps.event.addListener(map, 'click', codeCoordinate);


    function Setmarker(latLng) {
      if (marker.length > 0) {
        marker[0].setMap(null);
      }

      marker = [];
      marker.length = 0;

      marker.push(new google.maps.Marker({
        position: latLng,
        map: map,
        title: "You are here!"
      }));

    }

    //지도 검색
    function codeAddress(event) {

      clearMarkers();

      var address = document.getElementById("AddrSearch").value;
      
      geocoder.geocode({ 'address': address }, function (results, status) {
      if (status == 'OK') {
        alert(results.length + "개의 결과를 찾았습니다.");
        
        for (var i = 0; i < results.length; i++) {
          map.setCenter(results[i].geometry.location);
            marker = new google.maps.Marker({
            map: map,
            position: results[i].geometry.location,
          });
        }

      var lat = marker.getPosition().lat();
	    var lon = marker.getPosition().lng();

	    console.log("위도 : "+ lat + ", 경도 : "+lon);
      //해당 위도 경도로 만드신 DB에 조회해서 그 내용을 마커위에 띄우기

      var content = "위도 : "+ lat + ", 경도 : "+lon;// 말풍선 안에 들어갈 내용
         
      infowindow = new google.maps.InfoWindow({ content: content});

      infowindow.open(map,marker);
          
        /*         if (status == google.maps.GeocoderStatus.OK) {
          alert(results.length + "개의 결과를 찾았습니다.");

          for (var i = 0; i < results.length; i++) {
            map.setCenter(results[i].geometry.location);
            geocodemarker.push(new google.maps.Marker({
              center: results[i].geometry.location,
              position: results[i].geometry.location,
              map: map

            }));
          }
*/
        }
        else {
          alert("Geocode was not successful for the following reason: " + status);
        }
      });
    }

    function codeCoordinate(event) {
      Setmarker(event.latLng);

      geocoder.geocode({ 'latLng': event.latLng }, function (results, status) {

        if (status == google.maps.GeocoderStatus.OK) {
          if (results[1]) {
            infowindow.setContent(results[1].formatted_address);
            infowindow.open(map, marker[0]);
          }
        }
      });
    }

    // GeoLocation
    function codeGeoLocation() {
      navigator.geolocation.getCurrentPosition(success);

      function success(position) {
        var lat = position.coords.latitude;
        var long = position.coords.longitude;
        alert(lat + " " + long + " 성공");

        var coords = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
        map.setCenter(coords);
        map.setZoom(15);

        //마커 추가
      }

    }

    //마커 리셋 함수
    function clearMarkers() {
      for (var i = 0; i < marker.length; i++ ) {
        marker[i].setMap(null);
      }
      marker.length = 0;
    }

    function setSelectMarkers() {

     //파이어베이스 DB의 모든 addr를 배열로 가져온다.
     var addr = [];
     
     //가져온 배열을 폴문을 돌려 마커생성
     for( var j=0; i< addr.length; j++) {
        //addr을 통해 구글에 요청
        geocoder.geocode({ 'address': addr[j] }, function (results, status) {
          if (status == 'OK') {
            //alert(results.length + "개의 결과를 찾았습니다.");
            
            for (var i = 0; i < results.length; i++) {
              map.setCenter(results[i].geometry.location);
                marker = new google.maps.Marker({
                map: map,
                position: results[i].geometry.location,
              });
            }

          var lat = marker.getPosition().lat();
          var lon = marker.getPosition().lng();

          console.log("위도 : "+ lat + ", 경도 : "+lon);
          //이건 예시인데 DB에 가져온 내용을 마커위에 띄운다.
          // 말풍선 안에 들어갈 내용
          var content = "Addr :" +
                        "Latitude : "+ lat + ", Longitude : "+lon + 
                        "Link :" + 
                        "Name : " + 
                        "Review: " + 
                        "Score: ";
            
          infowindow = new google.maps.InfoWindow({ content: content});

          infowindow.open(map,marker);
        }
      }
    
    }
  }
  </script>
