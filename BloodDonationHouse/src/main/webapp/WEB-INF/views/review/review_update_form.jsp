
  <%@include file="../etc/header.jsp" %>
   
    <!-- Page Header-->
    <header class="masthead" style="background-image: url('assets/img/home-bg.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="page-heading">
                        <h2 aling="center">Review Modify</h2>
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
                    <p>Want to get in touch? Fill out the form below to send me a message and I will get back to you as soon as possible!</p>
                    <div class="my-5">
                    
                       <form id="contactForm" data-sb-form-api-token="API_TOKEN" method="post" enctype="multipart/form-data">
                           <div class="form-floating">
                                <textarea class="form-control" name="content" id="message" placeholder="Enter your message here..." style="height: 12rem" data-sb-validations="required">${ vo.content }</textarea>
                                <label for="message">Content</label>
                                <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                            </div>
                            <div class="form-floating">
                                <input class="form-control" name="name" value="${ vo.name }" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                                <label for="name">Name</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                            </div>
                           <div class="form-floating">
                                <input class="form-control" name="photo" value="${ vo.filename }" id="name" type="file" placeholder="Enter your photo..." data-sb-validations="required" />
                                <label for="photo">Photo</label>
                                <div class="invalid-feedback" data-sb-feedback="photo:required">A photo is required.</div>
                            </div>
                            
                            <%-- <input type="hidden" value="${ sessionScope.loginid }" name="member_id"> --%>
                            <input type="hidden" value="${ vo.idx }" name="idx">
                            
                            <br />
                                <!-- Submit success message-->
                                <!---->
                                <!-- This is what your users will see when the form-->
                                <!-- has successfully submitted-->
                            <!-- <div class="d-none" id="submitSuccessMessage">
                                <div class="text-center mb-3">
                                    <div class="fw-bolder">Please wait. Registering as a member.</div>
                                </div>
                            </div> -->
                                <!-- Submit error message-->
                                <!---->
                                <!-- This is what your users will see when there is-->
                                <!-- an error submitting the form-->
                            <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                                <!-- Submit Button-->
                            <input class="btn btn-primary" id="submitButton" value="Upload" onclick="send(this.form);" size="5">
                            <input class="btn btn-primary" value="Cancel" onclick="location.href='review.do'" size="5">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        
        <script>
        	function send(f) {
        		
        		var idx = f.idx.value;
        		
        		f.action = "review_update.do?idx=" + idx;
        		f.submit();
        	}
        </script>
        
        <%@include file="../etc/footer.jsp" %>