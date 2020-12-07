<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dto.MemberDTO"%>
<%@ page import="com.dto.ProductDTO"%>
<%@ page import="java.util.List"%>

<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/myPage.css">

<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/memberFormJS.js"></script>

<%
	MemberDTO dto = (MemberDTO) session.getAttribute("login");
String cName = (String) request.getAttribute("cName");

String userID = dto.getUserID();
String userPW = dto.getUserPW();
String userName = dto.getUserName();
String phoneNum = dto.getPhoneNum();
String email1 = dto.getEmail1();
String email2 = dto.getEmail2();
int age = dto.getAge();
int cCode = dto.getcCode();
int cScore = dto.getcScore();
%>


<div class="containerMember">
	<div class="innerContainer">
		<div class="row mb-5">
			<div class="col-12 text-center">
				<h2 class="text-black h1 site-section-heading">My Page</h2>
			</div>
		</div>

		<form action="loginCheck/memberUpdate" method="POST" class="p-5 bg-light">
			이름:<input type="text" id="userName" name="userName" value="<%=userName%>" class="form-control">
			<br> 아이디:
			<%=userID%><br> <input type="hidden" value="<%=userID%>"
				name="userID" class="form-control"><br> 비밀번호: <input id="userPW" name="userPW"
				type="password" value="<%=userPW%>" class="form-control">
			<button type="button" id="PWshow">비밀번호 보기</button><br>
			<span id="PWcheckVal"></span><br> 비밀번호 확인: <input id="userPW2"
				name="userPW2" type="password" class="form-control" required> <span id="PWcheck"></span><br>
			나이: <input type="text" id="age" name="age" value="<%=age%>" class="form-control"><br>
			연락처: <input id="phoneNum" name="phoneNum" type="text" maxlength="11"
				value="<%=phoneNum%>" class="form-control"> * ( - ) 없이 입력하세요. <br><br> 이메일: <input
				id="email1" name="email1" type="text" value="<%=email1%>" class="form-control">@
			<input id="email2" name="email2" type="text" placeholder="직접입력"
				value="<%=email2%>" class="form-control"> <select id="emailSelect"
				name="emailSelect">
				<option value="naver.com">naver.com</option>
				<option value="daum.com">daum.com</option>
				<option value="gmail.com">gmail.com</option>
			</select><br><br> 수강과목:
			<%=cName%><br><br> 강의 별점:
			<%=cScore%>
			<%
			// 회원이 판매중인 상품 list 가져오기
			List<ProductDTO> myProduct = (List<ProductDTO>) request.getAttribute("myProduct");
			if(myProduct != null){
			%>
			<br><br> <input type="hidden" value="<%=cCode%>" name="cCode" class="form-control">
			<input type="hidden" value="<%=cScore%>" name="cScore" class="form-control"> 판매중인
			상품
			<table class="table table-striped">
				<thead>
					<tr>
						<td>상품명</td>
						<td>가격</td>
						<td>판매여부</td>
					</tr>
				</thead>
				<tbody>
					
					<% 
					for (ProductDTO pdto : myProduct) {
						String pName = pdto.getpName();
						String isSold = pdto.getIsSold();
						int pPrice = pdto.getpPrice();
						int pCode = pdto.getpCode();
					%>
					<tr>
						<td><a href="ProductRetrieveServlet?pCode=<%=pCode%>"><%=pName%></a></td>
						<td><%=pPrice%>원</td>
						<td><%=isSold%></td>
					<tr>
						<%
							}
						%>

				</tbody>
			</table>
			<%	
				}
			%>
			<br> <input type="submit" value="수정" class="btn btn-primary btn-md text-white"> <input
				type="button" value="Home" onClick="location.href='main'" class="btn btn-primary btn-md text-white">
		
		</form>
		
	</div>
</div>