<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/login.css">

<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/memberFormJS.js"></script>

<div class="containerMember">
	<div class="innerContainer">

		<div class="row mb-5">
			<div class="col-12 text-center">
				<h2 class="text-black h1 site-section-heading">아이디 찾기</h2>
			</div>
		</div>
		
		<form action="MemberIdSearchServlet" method="get" class="p-5 bg-light">
			이름 : <input type="text" name="userName" class="form-control"><br> 전화번호 : <input
				type="text" name="phoneNum" class="form-control"><br> 이메일: <input
				type="text" name="email1" class="form-control" required> @ <input type="text"
				name="email2" id="email2" placeholder="직접입력" class="form-control" required> <select
				name="emailSelect" id="emailSelect">
				<option value="직접입력">직접입력</option>
				<option value="daum.net">daum.net</option>
				<option value="naver.com">naver.com</option>
				<option value="gmail.com">gmail.com</option>
			</select><br><br><br> <input type="submit" value="Send Mail" class="btn btn-primary btn-md text-white">
		</form>
	</div>
</div>