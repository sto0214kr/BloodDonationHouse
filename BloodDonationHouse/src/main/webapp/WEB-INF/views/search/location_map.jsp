<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
      
	<%@include file="../etc/header.jsp" %>
			                 
		<!-- Page Header-->
        <header class="masthead" style="background-image: url('assets/img/about-bg.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="post-heading">
                            <h2 align="center">Blood Donation House Location Map View</h2>
                            <!-- <h2 class="subheading"></h2> -->
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Post Content-->
        <article class="mb-4">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                    	
                    	<h4 align="center">Blood Donation House Location Map</h4><br>
                    	
                    	<!-- 카카오 지도 시작 -->
                    	<div class="map_wrap">
						    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> 
						    <!-- 지도타입 컨트롤 div 입니다 -->
						    <div class="custom_typecontrol radius_border">
						        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
						        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
						    </div>
						    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
						    <div class="custom_zoomcontrol radius_border"> 
						        <span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
						        <span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
						    </div>
						</div>
						<br><br>
						<!-- 카카오 지도 끝 -->

                    </div>
                </div>
            </div>
        </article>   
        
         <style>
			html, body {width:100%;height:100%;margin:0;padding:0;} 
			.map_wrap {position:relative;overflow:hidden;width:100%;height:350px;}
			.radius_border{border:1px solid #919191;border-radius:5px;}     
			.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
			.custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
			.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
			.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
			.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
			.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
			.custom_typecontrol .selected_btn:hover {color:#fff;}   
			.custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
			.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
			.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
			.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}            
		</style>     
        
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1be6aed197baa6bb2c3bd7f5540a2df2&libraries=services"></script>
	
		<script>
			var infowindow = new kakao.maps.InfoWindow({zIndex:1});
			
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.584009, 126.970626), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
			
			// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수
			function zoomIn() {
			    map.setLevel(map.getLevel() - 1);
			}

			// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수
			function zoomOut() {
			    map.setLevel(map.getLevel() + 1);
			}
			
			// 장소 검색 객체 생성
			var ps = new kakao.maps.services.Places();
			
			// 키워드로 장소 검색
			ps.keywordSearch('헌혈의 집', placesSearchCB); 
			
			// 키워드 검색 완료시 호출되는 콜백함수
			function placesSearchCB (data, status, pagination) {
			    if (status === kakao.maps.services.Status.OK) {

			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가
			        var bounds = new kakao.maps.LatLngBounds();

			        for (var i=0; i<data.length; i++) {
			            displayMarker(data[i]);    
			            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
			        }       

			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정
			        map.setBounds(bounds);
			    } 
			}
		
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수
			function setMapType(maptype) { 
			    var roadmapControl = document.getElementById('btnRoadmap');
			    var skyviewControl = document.getElementById('btnSkyview'); 
			    if (maptype === 'roadmap') {
			        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
			        roadmapControl.className = 'selected_btn';
			        skyviewControl.className = 'btn';
			    } else {
			        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
			        skyviewControl.className = 'selected_btn';
			        roadmapControl.className = 'btn';
			    }
			}

			
			
			// 지도에 마커를 표시하는 함수
			function displayMarker(place) {
			    
			    // 마커를 생성하고 지도에 표시
			    var marker = new kakao.maps.Marker({
			        map: map,
			        position: new kakao.maps.LatLng(place.y, place.x) 
			    });

			    // 마커에 클릭이벤트를 등록
			    kakao.maps.event.addListener(marker, 'click', function() {
			        // 마커를 클릭하면 장소명이 인포윈도우에 표출
			        infowindow.setContent('<div style="text-align:center;padding:5px;font-size:12px;">' + place.place_name + '</div>');
			        infowindow.open(map, marker);
			    });
			}
		</script>
                
	<%@include file="../etc/footer.jsp" %>