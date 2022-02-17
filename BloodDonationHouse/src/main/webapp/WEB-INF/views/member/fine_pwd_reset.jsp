<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../etc/header.jsp" %>
   
    <!-- Page Header-->
    <header class="masthead" style="background-image: url('assets/img/contact-bg.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="page-heading">
                        <h2 align="center">Reset Password</h2>
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
                    <p>Enter the password to reset.</p>
                    <div class="my-5">
                    
                       <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                       
                           <input type="hidden" value="${ idx }" name="idx">
                       
                           <div class="form-floating">
                               <input class="form-control" name="pwd" id="password" type="password" placeholder="Enter your password..." data-sb-validations="required" />
                               <label for="password">Password</label>
                               <div class="invalid-feedback" data-sb-feedback="password:required">A password is required.</div>
                            </div>
                            <div class="form-floating">
                               <input class="form-control" name="pwd_chk" id="password" type="password" placeholder="Enter your password check..." data-sb-validations="required" />
                               <label for="password">Password Check</label>
                               <div class="invalid-feedback" data-sb-feedback="password:required">A password check is required.</div>
                            </div>
                            <br />
                            
                            <!-- 실패시 -->
                            <div>
	                            <c:if test="${ param.chk eq 1 }">
	                            	<span style="color:red">이메일 혹은 아이디가 일치하지 않습니다.</span>
	                            </c:if>
                            </div><br>
                            <!-- 실패시 -->
                            
                            <div class="d-none" id="submitSuccessMessage">
                                <div class="text-center mb-3">
                                    <div class="fw-bolder">Please wait You are submit in.</div>
                                </div>
                            </div>
                            
                            <!-- Submit Button-->
                            <div align="center">
                            	<input class="btn btn-primary" value="Password Reset" onclick="send(this.form);">
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
        		
        		var pwd = f.pwd.value.trim();
        		var pwd_chk = f.pwd_chk.value.trim();
        		var idx = f.idx.value;
        		//alert(idx);
        		
        		if(pwd == '') {
        			alert("비밀번호를 입력하세요.");
        			return;
        		}
        		if(pwd_chk == '') {
        			alert("비밀번호 확인을 입력하세요.");
        			return;
        		}
        		if(pwd != pwd_chk) {
        			alert("입력한 비밀번호가 일치하지 않습니다. 다시 입력하세요.");
        			return;
        		}
        		
        		f.action = "fine_pwd_reset.do?idx=" + idx;
        		f.method = "post";
        		f.submit();
        	}
        </script>
        
        <%@include file="../etc/footer.jsp" %>