<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../etc/header.jsp" %>
   
    <!-- Page Header-->
    <header class="masthead" style="background-image: url('assets/img/contact-bg.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="page-heading">
                        <h2 align="center">Email Pass Number</h2>
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
                    <p>Enter your email pass code...</p>
                    <div class="my-5">
                    
                       <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                       
                           <input type="hidden" value="${checkNum}" name="checkNum">
						   <input type="hidden" value="${ vo.idx }" name="idx">
                       
                           <div class="form-floating">
                               <input class="form-control" name="pass_number" id="pass_number" type="text" placeholder="Enter your pass number..." data-sb-validations="required" />
                               <label for="pass_number">Pass Number</label>
                               <div class="invalid-feedback" data-sb-feedback="password:required">A pass number is required.</div>
                            </div>
                            <br />
                            
                            <div class="d-none" id="submitSuccessMessage">
                                <div class="text-center mb-3">
                                    <div class="fw-bolder">Please wait You are checking in.</div>
                                </div>
                            </div>
                            
                            <!-- Submit Button-->
                            <div align="center">
                            	<input class="btn btn-primary" value="Pass Number Check" onclick="send(this.form);">
                        	</div>
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
			
				var checkNum = f.checkNum.value;
				var pass_number = f.pass_number.value.trim();
				
				if(checkNum != pass_number) {
					alert("인증번호가 일치하지 않습니다. 다시 입력하세요.");
					return;
				}
				
				f.action = "fine_pwd_reset_form.do";
				f.method = "post";
				f.submit();
			}
        </script>
        
        <%@include file="../etc/footer.jsp" %>