<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../etc/header.jsp" %>
  
  <c:if test="${ empty sessionScope.loginid }">
	  <script>
		  alert("로그인 후 이용 가능한 페이지입니다.");
		  location.href="login_form.do";
	  </script>
  </c:if>
  <!DOCTYPE html>
   
    <!-- Page Header-->
    <header class="masthead" style="background-image: url('assets/img/contact-bg.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="page-heading">
                        <h2 align="center">MyPage</h2>
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
                    <p>This is the member information registered when you signed up.</p>
                    <div class="my-5">
                    
                       <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                       
                           <input type="hidden" value="${ vo.idx }" name="idx">
                           <input type="hidden" value="${ vo.pwd }" name="c_pwd">
                       
                           <div class="form-floating">
                               <input class="form-control" name="id" value="${ vo.id }" id="id" type="text" placeholder="Enter your id..." data-sb-validations="required" />
                                <label for="id"></label>
                               <div class="invalid-feedback" data-sb-feedback="id:required">A id is required.</div>
                            </div>
                            <div class="form-floating">
                               <input class="form-control" name="pwd" id="password" type="password" placeholder="Enter your password..." data-sb-validations="required" />
                               <label for="password">Please enter your password</label>
                               <div class="invalid-feedback" data-sb-feedback="password:required">A password is required.</div>
                            </div>
                           <div class="form-floating">
                                <input class="form-control" name="name" value="${ vo.name }" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                                <label for="name"></label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                            </div>
                            <!-- <div class="form-floating">
                                <textarea class="form-control" id="message" placeholder="Enter your message here..." style="height: 12rem" data-sb-validations="required"></textarea>
                                <label for="message">Phone</label>
                                <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                            </div> -->
                            <div class="form-floating">
                                <input class="form-control" name="phone" value="${ vo.phone }" id="phone" type="tel" placeholder="Enter your phone number..." data-sb-validations="required" />
                                <label for="phone"></label>
                                <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>
                            </div>
                             <div class="form-floating">
                               <input class="form-control" name="email" value="${ vo.email }" id="email" type="email" placeholder="Enter your email..." data-sb-validations="required,email" />
                               <label for="email"></label>
                               <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
                               <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
                            </div>
                            <br />
                                <!-- Submit success message-->
                                <!---->
                                <!-- This is what your users will see when the form-->
                                <!-- has successfully submitted-->
                            <div class="d-none" id="submitSuccessMessage">
                                <div class="text-center mb-3">
                                    <br />
                                </div>
                            </div>
                                <!-- Submit error message-->
                                <!---->
                                <!-- This is what your users will see when there is-->
                                <!-- an error submitting the form-->
                            <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                                <!-- Submit Button-->
                            <!-- <button class="btn btn-primary text-uppercase disabled" id="submitButton" onclick="send(this.form);">Update</button> -->
                            <input class="btn btn-primary" typte="button" value="Update" onclick="send(this.form)" size="6">
                            <input class="btn btn-primary" typte="button" value="Delete" onclick="del(this.form)" size="6">
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
        	// 수정
        	function send(f) {
        		
        		var idx = f.idx.value;
        		var pwd = f.pwd.value;
        		var c_pwd = f.c_pwd.value.trim();
        		
        		if(pwd != c_pwd) {
        			alert("수정 실패. 비밀번호가 일치하지 않습니다.");
        			return;
        		}
        		
        		if(!confirm("정말 수정하시겠습니까?")) {
        			return;
        		}
        		
        		f.action = "update.do";
        		f.method = "post";
        		f.submit();
        	}
        	
        	// 삭제
        	function del(f) {
        		
        		var idx = f.idx.value;
        		var pwd = f.pwd.value;
        		var c_pwd = f.c_pwd.value.trim();
        		
        		if(pwd != c_pwd) {
        			alert("삭제 실패. 비밀번호가 일치하지 않습니다.");
        			return;
        		}
        		
        		if(!confirm("정말 탈퇴하시겠습니까?")) {
        			return;
        		}
        		
        		f.action = "delete.do";
        		f.method = "post";
        		f.submit();
        	}
        </script>
        
        <%@include file="../etc/footer.jsp" %>