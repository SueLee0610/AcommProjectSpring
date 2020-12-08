<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.CourseDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/courseOrder.css">

<%
	// 코스 dto 정보 파싱
CourseDTO courseDTO = (CourseDTO) session.getAttribute("courseDTO");
String cImage = courseDTO.getcImage();
String cName = courseDTO.getcName();
String cStartDate = courseDTO.getcStartDate();
String cEndDate = courseDTO.getcEndDate();
int cTotalDate = courseDTO.getcTotalDate();
int cPrice = courseDTO.getcPrice();

// 로그인된 member 정보 파싱
MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
String userName = memberDTO.getUserName();
String phoneNum = memberDTO.getPhoneNum();
String email = memberDTO.getEmail1() + "@" + memberDTO.getEmail2();
%>

<div class="containerMember p-5 bg-light">
	<div class="innerContainer" >
		<div class="row mb-5">
			<div class="col-12 text-center">
				<h3 class="text-black h1 site-section-heading">강의정보 확인</h3>
			</div>
		</div>
		<table border="1" id="courseTable" class="table">
			<thead>
				<tr>
					<th scope="col">사진</th>
					<th scope="col">강의명</th>
					<th scope="col">기간</th>
					<th scope="col">가격</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="col"><img src="./img/<%=cImage%>" width="200px"></th>
					<th scope="col"><%=cName%></th>
					<th scope="col"><%=cTotalDate%>일</th>
					<th scope="col"><%=cPrice%>원</th>
				</tr>
			</tbody>
		</table>
		<br><br><br><br>
		<div class="row mb-5">
			<div class="col-12 text-center">
				<h3 class="text-black h1 site-section-heading">고객정보 확인</h3>
			</div>
		</div>
		<br> 
		<div class="p-4 mb-3 bg-white">
		 <p class="mb-0 font-weight-bold">이름</p>
              <p class="mb-4"><%=userName%></p>
              <p class="mb-0 font-weight-bold">연락처</p>
              <p class="mb-4"><%=phoneNum%></p>
              <p class="mb-0 font-weight-bold">이메일</p>
              <p class="mb-0"><%=email%></p>
		</div>
		<br>
		<div class="row mb-5">
			<div class="col-12 text-center">
				<h3 class="text-black h1 site-section-heading">결제수단</h3>
			</div>
		</div>
		<form action="CourseOrderDoneServlet" method="post" class="p-5 bg-white">
			<div class="">
				<input type="radio" id="creditCard" name="payMethod" checked>신용카드<br>
				<input type="radio" id="toss" name="payMethod">계좌이체<br>
				<input type="radio" id="bank" name="payMethod">무통장입금<br>
			</div>
			<br>
			<br>
			<div class="orderSubmit">
			<input type="submit" value="결제하기" class="btn btn-primary btn-md text-white"> <input type="button"
				value="취소" class="btn btn-primary btn-md text-white" onClick="location.href='main'">
			</div>
		</form>
	</div>
</div>