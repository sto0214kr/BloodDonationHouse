
  <%@include file="../etc/header.jsp" %>
   
    <!-- Page Header-->
    <header class="masthead" style="background-image: url('assets/img/contact-bg.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="page-heading">
                        <h2 align="center">Join</h2>
                        <span class="subheading">There are more benefits.</span>
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
                    
                       <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                           <div class="form-floating">
                               <input class="form-control" name="id" id="id" type="text" placeholder="Enter your id..." data-sb-validations="required" />
                                <label for="id">ID</label>
                               <div class="invalid-feedback" data-sb-feedback="id:required">A id is required.</div>
                            </div>
                            <div class="form-floating">
                               <input class="form-control" name="pwd" id="password" type="password" placeholder="Enter your password..." data-sb-validations="required" />
                               <label for="password">Password</label>
                               <div class="invalid-feedback" data-sb-feedback="password:required">A password is required.</div>
                            </div>
                           <div class="form-floating">
                                <input class="form-control" name="name" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                                <label for="name">Name</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                            </div>
                            <div class="form-floating">
                                <input class="form-control" name="phone" id="phone" type="tel" placeholder="Enter your phone number..." data-sb-validations="required" />
                                <label for="phone">Phone</label>
                                <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>
                            </div>
                             <div class="form-floating">
                               <input class="form-control" name="email" id="email" type="email" placeholder="Enter your email..." data-sb-validations="required,email" />
                               <label for="email">Email</label>
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
                                    <div class="fw-bolder">Please wait. Registering as a member.</div>
                                </div>
                            </div>
                                <!-- Submit error message-->
                                <!---->
                                <!-- This is what your users will see when there is-->
                                <!-- an error submitting the form-->
                            <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                                <!-- Submit Button-->
                            <button class="btn btn-primary text-uppercase disabled" id="submitButton" onclick="send(this.form);">Join</button>
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
        		
        		f.action = "join.do";
        		f.method = "post";
        		f.submit();
        	}
        </script>
        
        <%@include file="../etc/footer.jsp" %>