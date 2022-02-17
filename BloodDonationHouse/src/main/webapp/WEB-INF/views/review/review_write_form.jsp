<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../etc/header.jsp" %>
  
  <c:if test="${ empty sessionScope.loginid }">
	<script>
		 alert("로그인 후 이용 가능한 페이지입니다.");
		 location.href="login_form.do";
	</script>
  </c:if>
   
    <!-- Page Header-->
    <header class="masthead" style="background-image: url('assets/img/home-bg.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="page-heading">
                        <h2 aling="center">Review Write</h2>
                        <span class="subheading">Have questions? I have answers.</span>
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
                    <p>Let's all participate in blood donation together. Your heart goes to many places.</p>
                    <div class="my-5">
                    
                       <form id="contactForm" data-sb-form-api-token="API_TOKEN" method="post" enctype="multipart/form-data">
                           <div class="form-floating">
                                <textarea class="form-control" name="content" oninput='handleOnInput(this, 30)' id="message" placeholder="Enter your message here..." style="height: 12rem" data-sb-validations="required"></textarea>
                                <label for="message">Content</label>
                                <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                            </div>
                            <div class="form-floating">
                                <input class="form-control" name="name" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                                <label for="name">Name</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                            </div>
                           <div class="form-floating">
                                <input class="form-control" name="photo" id="name" type="file" placeholder="Enter your photo..." data-sb-validations="required" />
                                <label for="photo">Photo</label>
                                <div class="invalid-feedback" data-sb-feedback="photo:required">A photo is required.</div>
                            </div>
                            
                            <input type="hidden" value="${ sessionScope.loginid }" name="member_id">
                            
                            <br />
                                <!-- Submit error message-->
                                <!---->
                                <!-- This is what your users will see when there is-->
                                <!-- an error submitting the form-->
                            <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                                <!-- Submit Button-->
                            <input class="btn btn-primary" id="submitButton" value="Upload" onclick="send(this.form);" size="5">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        
        <script>
        	// 내용 입력시 글자수 30자 이내만 가능
        	function handleOnInput(el, maxlength) {
        		
        	  if(el.value.length > maxlength)  {
        	    el.value = el.value.substr(0, maxlength);
        	  }
        	}
        
        	function send(f) {
        		
        		f.action = "review_write.do";
        		f.submit();
        	}
        </script>
        
        <%@include file="../etc/footer.jsp" %>