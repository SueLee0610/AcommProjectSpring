<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dto.MemberDTO"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900" rel="stylesheet">
	    <link rel="stylesheet" href="fonts/icomoon/style.css">
	    <link rel="stylesheet" href="css/bootstrap.min.css">
	    <link rel="stylesheet" href="css/main.css">
	</head>
	
	<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	
	    <div class="site-mobile-menu site-navbar-target">
	      <div class="site-mobile-menu-header">
	        <div class="site-mobile-menu-close mt-3">
	          <span class="icon-close2 js-menu-toggle"></span>
	        </div>
	      </div>
	      <div class="site-mobile-menu-body"></div>
	    </div>
	   
	    <div class="border-bottom top-bar py-2 bg-dark" id="home-section">
	      <div class="container">
	      	<div class="login">
				<%
					MemberDTO result = (MemberDTO) session.getAttribute("login");
				if (result != null) {
					String userName = result.getUserName();
				%>
					안녕하세요.
				<%=userName%>님 &nbsp; / &nbsp;
		        <span class="mr-3"><strong class="text-white"><a href="loginCheck/logout">로그아웃</a></strong></span>
		        <span><strong class="text-white"><a href="loginCheck/myPage">마이페이지</a></strong></span>
				<%
					} else {
				%>	      
		        <span class="mr-3"><strong class="text-white"><a href="loginForm">로그인</a></strong></span>
		        <span><strong class="text-white"><a href="memberForm">회원가입</a></strong></span>
				<%
					}
				%>
			</div>
	      </div> 
	    </div>
	
	    <header class="site-navbar py-3 bg-white js-sticky-header site-navbar-target" role="banner">
	      <div class="container">
	        <div class="row align-items-center">
	          <div class="col-11 col-xl-2">
	            <h1 class="mb-0 site-logo"><a href="main" class="text-black h2 mb-0"><img src="img/logo.png"></a></h1>
	          </div>
	          <div class="col-12 col-md-10 d-none d-xl-block">
	            <nav class="site-navigation position-relative text-right" role="navigation">
	              <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
	                <li><a href="main" class="nav-link">Home</a></li>
	                <li><a href="courseBoard" class="nav-link">강의게시판</a></li>
	                <li>
	                  <a href="productBoard" class="nav-link">중고게시판</a>
	                </li>
	                <li>
	                  <a href="FreeBoardListServlet" class="nav-link">자유게시판</a>
	                </li>
	                <li><a href="#blog-section" class="nav-link">Blog</a></li>
	                <li><a href="#contact-section" class="nav-link">Contact</a></li>
	              </ul>
	            </nav>
	          </div>
	          <div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>
	        </div>
	      </div>
	    </header>
		
		<script src="js/jquery-3.5.1.min.js"></script>
  		<script src="js/bootstrap.min.js"></script>
  		<script src="js/aos.js"></script>
  		<script src="js/jquery.fancybox.min.js"></script>
  		<script src="js/main.js"></script>
  		<script src="js/typed.js"></script>
	
	</body>
	
</html>