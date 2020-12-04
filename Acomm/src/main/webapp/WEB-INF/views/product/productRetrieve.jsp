<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dto.ProductDTO" %>
<%@ page import="com.dto.MemberDTO" %>
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$( () => {
	// submit 버튼의 글자가 [판매완료]라면 폼은 isSold 상태를 업뎃하는 서블릿으로 이동 
	if($(".submit").val() == "판매완료"){
		$("form").attr("action", "ProductIsSoldUpdateServlet");
	}else{
		$("form").attr("action", "");
	}
});
</script>

<div class="pContainer" >
<div class="productContainer" >
<%
	// request에서 productRetrieve 가져오기
//HttpSession session = request.getSession();
ProductDTO productRetrieve = (ProductDTO) session.getAttribute("productRetrieve");

String isSold = productRetrieve.getIsSold();
String userid = productRetrieve.getUserid();
int pPrice = productRetrieve.getpPrice();
String pName = productRetrieve.getpName();
String pImage = productRetrieve.getpImage();
int pCode = productRetrieve.getpCode();
String pContent = productRetrieve.getpContent();

// 현재 로그인된 회원의 userid가져오기 
MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
%>

<form  action="" method="post">
	<!-- pCode 파싱을 위한 hidden값 지정 -->
	<input type="hidden" name="pCode" value="<%= pCode %>">
	<div class="jumbotron bg-white">
		<p><img src="img/<%=pImage %>" width="500px"></p>
		<p class="lead font-weight-bold">상품명: <%=pName %></p>
		<hr class="my-4">
		<div class="description text-left ml-5 mb-5">
			<p>판매자: <%=userid %> 님</p>
			<p>가격: <%=pPrice %></p>
			<p>설명: <%=pContent %></p>
		</div>
			
	<%
	// 사용자가 로그인된 상태일 경우
	if(memberDTO != null){ 
		String loginedId = memberDTO.getUserID();

		// 작성자와 로그인된 아이디가 같을 경우 [삭제하기] 버튼 보여주기
		if(loginedId.equals(userid)){
	%>
			<input type="button" value="수정하기" class="btn btn-info btn-lg mt-2" onclick="location.href='ProductUpdateUIServlet'">
			<input type="button" value="삭제하기" class="btn btn-danger btn-lg mt-2" onclick="location.href='ProductDeleteServlet?pCode=<%=pCode%>'">
			
	<% 
			// 해당 상품이 판매중인 상품일 경우 [판매완료] 버튼 보여주기
			if(isSold.equals("n")){
	%>	
			
				<input class="submit btn btn-secondary btn-lg mt-2" type="submit" value="판매완료">
	
	<% 
			}
	
		// 작성자와 로그인된 아이디가 같지 않을 경우 [쪽지보내기] 버튼 보여주기
		} else{
	%>			
	
			<input class="submit btn btn-warning btn-lg mt-2" type="submit" value="쪽지 보내기">
	
	<%
		}
	}
	%>
	</div>
</form>
</div>
</div>