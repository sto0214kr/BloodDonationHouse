<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../etc/header.jsp" %>
   
    <!-- Page Header-->
    <header class="masthead" style="background-image: url('assets/img/contact-bg.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="page-heading">
                        <h2 align="center">Fine ID</h2>
                    </div>
                </div>
            </div>
        </div>
   </header>
   <!-- Main Content-->
   <main class="mb-4">
       <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <p>Enter your email and password to retrieve your ID.<br>
                    Search is possible only with a verified email.</p>
                    <div class="my-5">
                    
                       <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                       
                           <div class="form-floating">
                               <input class="form-control" name="email" id="email" type="text" placeholder="Enter your email..." data-sb-validations="required" />
                                <label for="email">Email</label>
                               <div class="invalid-feedback" data-sb-feedback="email:required">A email is required.</div>
                            </div>
                            <div class="form-floating">
                               <input class="form-control" name="pwd" id="password" type="password" placeholder="Enter your password..." data-sb-validations="required" />
                               <label for="password">Password</label>
                               <div class="invalid-feedback" data-sb-feedback="password:required">A password is required.</div>
                            </div>
                            <br />
                            
                            <!-- 아이디 찾기 실패시 -->
                            <div>
	                            <c:if test="${ param.chk eq 1 }">
	                            	<span style="color:red">이메일 혹은 비밀번호가 일치하지 않습니다.</span>
	                            </c:if>
                            </div><br>
                            
                            <div class="d-none" id="submitSuccessMessage">
                                <div class="text-center mb-3">
                                    <div class="fw-bolder">Please wait You are fine id.</div>
                                </div>
                            </div>
                            
                            <!-- 아이디 / 비밀번호 찾기 -->
                            <div align="right"> 
                            	<a href="fine_pwd_form.do">Fine Password</a>
                            </div>
                            
                            <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                                <!-- Submit Button-->
                            <button class="btn btn-primary text-uppercase disabled" id="submitButton" onclick="send(this.form);">Fine</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
        
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        
        <script>
        	function send(f) {
        		
        		f.action = "fine_id.do";
        		f.method = "post";
        		f.submit();
        	}
        </script>
        
        <%@include file="../etc/footer.jsp" %>