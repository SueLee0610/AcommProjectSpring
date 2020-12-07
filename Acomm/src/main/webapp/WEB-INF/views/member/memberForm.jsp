<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/memberForm.css">

<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/memberFormJS.js"></script>
<div class="containerMember">
	<div class="innerContainer">
		<div class="row mb-5">
			<div class="col-12 text-center">
				<h2 class="text-black h1 site-section-heading">회원가입</h2>
			</div>
		</div>
		<form action="memberAdd" method="post" class="p-5 bg-light">
			아이디: <input type="text" name="userID" id="userID" class="form-control" required> <span
				id="IDcheck"></span> <br> 비밀번호: <input type="password"
				name="userPW" id="userPW" class="form-control" required>
			<button type="button" id="PWshow" class="btn btn-secondary btn-sm">비밀번호 보기</button><br>
			<span id="PWcheckVal"></span> <br> 비밀번호확인: <input
				type="password" name="userPW2" id="userPW2" class="form-control" required> <span
				id="PWcheck"></span> <br> 이름: <input type="text"
				name="userName" class="form-control" required> <br> 나이: <input type="text"
				name="age" id="age" class="form-control" required> <br> 전화번호: <input
				type="text" name="phoneNum" id="phoneNum" class="form-control" required> <br>
			이메일: <input type="text" name="email1" class="form-control" required> @ <input
				type="text" name="email2" id="email2" placeholder="직접입력" class="form-control" required>
			<select name="emailSelect" id="emailSelect">
			<label class="btn btn-secondary active"></label>
				<option value="직접입력">직접입력</option>
				<option value="daum.net">daum.net</option>
				<option value="naver.com">naver.com</option>
				<option value="gmail.com">gmail.com</option>
			</select> <br><br> 강의 수강 여부: <select name="courseSelect" id="courseSelect" class="form-control"
				required>
				<option value="0">수강 이력 없음</option>
				<option value="1">자바(JAVA) 개발자, 안드로이드 앱 개발자 양성과정</option>
				<option value="2">머신러닝을 활용한 데이터 분석 과정</option>
				<option value="3">React기반의 자바(JAVA)개발자 양성과정</option>
				<option value="4">자바(JAVA)기반의 백엔드(Back-end)개발자 양성과정</option>
			</select> <br>
			<div id="scoreDiv" style="display: none">
				강의 별점: <select name="scoreSelect" id="scoreSelect">
					<option value="0" style="display: none">0</option>
					<option value="5">5</option>
					<option value="4">4</option>
					<option value="3">3</option>
					<option value="2">2</option>
					<option value="1">1</option>
				</select> <br>
			</div>
			<input type="submit" value="회원가입" class="btn btn-primary btn-md text-white"> <br>
		</form>
	</div>
</div>
