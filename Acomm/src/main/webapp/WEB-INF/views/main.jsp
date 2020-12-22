<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<jsp:include page="common/header.jsp" flush="true"></jsp:include>
	    <div class="site-blocks-cover overlay" style="background-image: url(img/banner.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
	      <div class="container">
	        <div class="row align-items-center justify-content-center text-center">
	          <div class="col-md-12" data-aos="fade-up" data-aos-delay="400">
	            <div class="row justify-content-center mb-4">
	              <div class="col-md-8 text-center">
	                <h1>국비지원 수강생을 위한 정보공유 커뮤니티<br><span class="typed-words"></span></h1><br>
	                <p class="lead mb-5">Acomm</p>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  	<script>
	      	var typed = new Typed('.typed-words', {
	        	strings: ["Acommunity"],
	        	typeSpeed: 80,
	        	backSpeed: 80,
	        	backDelay: 4000,
	        	startDelay: 1000,
	        	loop: true,
	        	showCursor: true
	      	});
	  	</script>

		<section class="site-section bg-light" id="contact-section">
			<div class="container">
        		<div class="row mb-5">
          			<div class="col-12 text-center">
            			<h2 class="text-black h1 site-section-heading">Contact Us</h2>
          			</div>
        </div>
        <div class="row">
          <div class="col-md-7 mb-5">
          
            <form action="#" class="p-5 bg-white">
              
              <h2 class="h4 text-black mb-5">Contact Form</h2> 

              <div class="row form-group">
                <div class="col-md-6 mb-3 mb-md-0">
                  <label class="text-black" for="fname">First Name</label>
                  <input type="text" id="fname" class="form-control">
                </div>
                <div class="col-md-6">
                  <label class="text-black" for="lname">Last Name</label>
                  <input type="text" id="lname" class="form-control">
                </div>
              </div>

              <div class="row form-group">
                
                <div class="col-md-12">
                  <label class="text-black" for="email">Email</label> 
                  <input type="email" id="email" class="form-control">
                </div>
              </div>

              <div class="row form-group">
                
                <div class="col-md-12">
                  <label class="text-black" for="subject">Subject</label> 
                  <input type="subject" id="subject" class="form-control">
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="message">Message</label> 
                  <textarea name="message" id="message" cols="30" rows="7" class="form-control" placeholder="Write your notes or questions here..."></textarea>
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" value="Send Message" class="btn btn-primary btn-md text-white">
                </div>
              </div>

            </form>
          </div>
          <div class="col-md-5">
            
            <div class="p-4 mb-3 bg-white">
              <p class="mb-0 font-weight-bold">Address</p>
              <p class="mb-4">203 Fake St. Mountain View, San Francisco, California, USA</p>

              <p class="mb-0 font-weight-bold">Phone</p>
              <p class="mb-4"><a href="#">+1 232 3235 324</a></p>

              <p class="mb-0 font-weight-bold">Email Address</p>
              <p class="mb-0"><a href="#">youremail@domain.com</a></p>

            </div>
            
          </div>
        </div>
      </div>
    </section>
    
	<jsp:include page="common/footer.jsp" flush="true"></jsp:include>
	   
	</body>
</html>