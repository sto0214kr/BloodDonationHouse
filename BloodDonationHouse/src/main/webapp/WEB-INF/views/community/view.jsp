<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>

      <%@include file="../etc/header.jsp" %>
      
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('assets/img/home-bg.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="post-heading">
                            <h2 align="center">Community View</h2>
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
                    	
                    	<!-- 공지사항 등록 폼 시작 -->
                    	<form id="contactForm" data-sb-form-api-token="API_TOKEN">
                           <div class="form-floating">
                               <input class="form-control" name="title" value="${ vo.title }" id="title" type="text" placeholder="Enter your title..." data-sb-validations="required" />
                                <label for="title"></label>
                               <div class="invalid-feedback" data-sb-feedback="title:required">A title is required.</div>
                            </div>
                            <div class="form-floating">
                                <textarea class="form-control" name="content" id="content" placeholder="Enter your content here..." style="height: 12rem" data-sb-validations="required">${ vo.content }</textarea>
                                <label for="content"></label>
                                <div class="invalid-feedback" data-sb-feedback="content:required">A content is required.</div>
                            </div>
                           <div class="form-floating">
                                <input class="form-control" name="writer" value="${ vo.writer }" id="writer" type="text" data-sb-validations="required" readonly="readonly"/>
                                <label for="writer"></label>
                            </div>
                            <div class="form-floating">
                                <input class="form-control" name="writeday" value="${ vo.writeday }" id="writeday" type="text" data-sb-validations="required" readonly="readonly"/>
                                <label for="writeday"></label>
                            </div>
                            <br />
                                <!-- Submit success message-->
                                <!---->
                                <!-- This is what your users will see when the form-->
                                <!-- has successfully submitted-->
                            <div class="d-none" id="submitSuccessMessage">
                                <div class="text-center mb-3">
                                    <div class="fw-bolder">Please wait. Registering as a member.</div>
                                </div>
                            </div>
                                <!-- Submit error message-->
                                <!---->
                                <!-- This is what your users will see when there is-->
                                <!-- an error submitting the form-->
                            <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                                <!-- Submit Button-->
                           <!--  <button class="btn btn-primary text-uppercase disabled" id="submitButton" onclick="send(this.form);">Join</button> -->
                           
                           <input type="hidden" value="${ vo.idx }" name="idx">
                           
                           <c:if test="${ sessionScope.loginid eq 'admin' }">
	                           <input class="btn btn-primary" type="button" value="Modify" onclick="send(this.form);">
	                           <input class="btn btn-primary" type="button" value="Delete" onclick="del(this.form);">
                           </c:if>
                           <input class="btn btn-primary" type="button" value="List" onclick="location.href='community.do?page=${ param.page }'">
                       
                       	   <input type="hidden" name="page" value="${ param.page }">	
                       	   
                        </form>
                        <!-- 공지사항 등록 폼 끝 -->
                    	
                    </div>
                </div>
            </div>
        </article>
        
        <script>
        	function send(f) {
        		
        		var idx = f.idx.value;
        		
        		if(!confirm("수정을 완료 하시겠습니까?")) {
        			return;
        		}
        		
        		f.action = "modify.do?idx=" + idx;
        		f.method = "post";
        		f.submit();
        	}
        	
        	function del(f) {
        		
        		var idx = f.idx.value;
        		
        		if(!confirm("정말 삭제하시겠습니까?")) {
        			return;
        		}
        		
        		f.action = "del.do?idx=" + idx;
        		f.method = "post";
        		f.submit();
        	}
        </script>
        
        <%@include file="../etc/footer.jsp" %>