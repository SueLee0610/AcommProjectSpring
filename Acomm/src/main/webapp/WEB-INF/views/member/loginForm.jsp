<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/login.css">

<!-- id, 패스워드 입력 검사 후 진행하도록  작성  -->
<div class="containerMember">
	<div class="innerContainer" >

		<div class="row mb-5">
			<div class="col-12 text-center">
				<h2 class="text-black h1 site-section-heading">Login</h2>
			</div>
		</div>

		<form action="login" method="post" class="p-5 bg-light">
			아이디:<input type="text" name="userID" id="userID" class="form-control"><br>
			비밀번호:<input type="password" name="userPW" id="userPW"
				class="form-control"><br> <input type="submit"
				value="로그인" class="btn btn-primary btn-md text-white"> <br>
			<a href="MemberIdSearchUIServlet">아이디찾기</a> / <a
				href="MemberPwSearchUIServlet">비밀번호찾기</a>
		</form>
	</div>
</div>