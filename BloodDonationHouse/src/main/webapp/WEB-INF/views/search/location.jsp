<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
      
      <%@include file="../etc/header.jsp" %>
      
      <style>
      	.info_box table {
      		border-collapse: collapse;
      		margin: 30px auto;
      		border: 1px solid gray;
      	}
      	.info_box table th {
      		padding-top: 20px;
      		padding-bottom: 20px;
      		text-align: center;
      		border-bottom: 1px solid gray;
      		border-left: 1px solid gray;
      	}
      	.info_box table td {
      		padding-top: 10px;
      		padding-bottom: 10px;
      		border: 1px solid #eeeeee;
      	}
      </style>
            
      <!-- Ajax 사용을 위한 준비 -->
	  <script src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
      
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('assets/img/about-bg.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="post-heading">
                            <h2 align="center">Blood Donation House Location Information</h2>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Post Content-->
        <article class="mb-4" id="top_btn">
            <div class="container px-4 px-lg-5">
                        
                        <h4 align="center">List of all blood donation centers nationwide.</h4><br>
                        
                        <div align="center">
                        	<input class="btn btn-primary" type="button" value="Map View" onclick="location.href='location_map.do'">
                        </div>
                        
                        <!--헌혈의 집 정보 출력 -->
                        <div class="info_box">
	                        <table id="table" border="1" width="1000">
	                        	<tr>
	                        		<th width="90px;">혈액원</th>
	                        		<th>헌혈의 집</th>
	                        		<th>주소</th>
	                        		<th width="135px">전화번호</th>
	                        	</tr>
	                        	<tbody>
	                        	</tbody>
	                        </table>           
                        </div>
                        
                        <div style="position:fixed; bottom: 15px; right: 40px; border-radius: 10px;">
                        	<a href="#top_btn"><img src="${ pageContext.request.contextPath }/resources/img/top.png" title="맨 위로" width="60px;"></a>
                        </div>
                        
            </div>
        </article>
        
        <%@include file="../etc/footer.jsp" %>
        
       <script>
        	window.onload = function() {
        		loadApi();
        	}
        	
        	function loadApi() {
        		//alert("확인용");
        		//var url = "https:api.odcloud.kr/api/15050729/v1/uddi:03c4700e-0d6d-4dc1-914b-d0b8720dfaa9?page=1&perPage=10&serviceKey=Tf9OkpiPqakqHVaBDYbjQNMfhW%2FpdCopT%2Fod5BxHlxmaht9zS9HbUu5G3UMvrSzummqTfHctcrjrFbIadFW39A%3D%3D";
        		var url = "https:api.odcloud.kr/api/15050729/v1/uddi:03c4700e-0d6d-4dc1-914b-d0b8720dfaa9?page=1&perPage=142&serviceKey=Tf9OkpiPqakqHVaBDYbjQNMfhW%2FpdCopT%2Fod5BxHlxmaht9zS9HbUu5G3UMvrSzummqTfHctcrjrFbIadFW39A%3D%3D";
        		var param = "";
        		
        		sendRequest(url, param, resultFn, "GET");
        	}
        	
        	// 콜백 메소드
    		function resultFn() {
    			
    			if(xhr.readyState == 4 && xhr.status == 200) {
    				
    				var data = xhr.responseText;
    				var json = eval("[" + data + "]");
    				//alert(data);
    				var totalCount = json[0].totalCount;
    				//alert(totalCount);
    				    		    	
    				// 잘 출력되는지 확인해 보자!
    				//alert(json[0].data[0].전화번호 + "\n" + json[0].data[0].주소지 + "\n" 
    				//		+ json[0].data[0]['헌혈의 집'] + "\n" + json[0].data[0].혈액원);
    								    
				    var arrayPlace = new Array();
				    var arrayName = new Array();
				    var arrayAddr = new Array();
				    var arrayPhone = new Array();
				    
    				for( i=0; i<totalCount; i++ ) {
    					
    					arrayPlace[i] = json[0].data[i].혈액원;
    					arrayName[i] = json[0].data[i]['헌혈의 집'];
    					arrayAddr[i] = json[0].data[i].주소지;
    					arrayPhone[i] = json[0].data[i].전화번호;
    					    					
    				}
    				var table = document.getElementById('table');
    				
    				for(i=0; i<totalCount; i++) {
    					var tr = document.createElement("tr");
    					
    					var td1 = document.createElement("td");
    					td1.appendChild(document.createTextNode(arrayPlace[i] + ""));
    					
    					var td2 = document.createElement("td");
    					td2.appendChild(document.createTextNode(arrayName[i] + ""));
    					
    					var td3 = document.createElement("td");
    					td3.appendChild(document.createTextNode(arrayAddr[i] + ""));
    					
    					var td4 = document.createElement("td");
    					td4.appendChild(document.createTextNode(arrayPhone[i] + ""));
    					
    					tr.appendChild(td1);
    					tr.appendChild(td2);
    					tr.appendChild(td3);
    					tr.appendChild(td4);
    					
    					table.appendChild(tr);
    				}
    				
    				
    				json.forEach(function(info, idx) {
    					console.log(info);
    				});
    				    				
    			}
    		}
        </script>