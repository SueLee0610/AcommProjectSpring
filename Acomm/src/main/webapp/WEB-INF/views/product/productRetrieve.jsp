<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$( () => {
	// submit 버튼의 글자가 [판매완료]라면 폼은 isSold 상태를 업뎃하는 서블릿으로 이동 
	if($(".submit").val() == "판매완료"){
		$("form").attr("action", "loginCheck/productIsSoldUpdate");
	}else{
		$("form").attr("action", "");
	}
});
</script>

<div class="pContainer" >
<div class="productContainer" >
<form  action="" method="post">
	<!-- pCode 파싱을 위한 hidden값 지정 -->
	<input type="hidden" name="pCode" value="${productRetrieve.pCode }">
	<div class="jumbotron bg-white">
		<p><img src="img/${productRetrieve.pImage }" width="500px"></p>
		<p class="lead font-weight-bold">상품명: ${productRetrieve.pName }</p>
		<hr class="my-4">
		<div class="description text-left ml-5 mb-5">
			<p>판매자: ${productRetrieve.userid}님</p>
			<p>가격: ${productRetrieve.pPrice }</p>
			<p>설명: ${productRetrieve.pContent }</p>
		</div>
			
	<!-- 사용자가 로그인된 상태일 경우 -->
	<c:if test="${!empty loginedId }">

		<!-- 작성자와 로그인된 아이디가 같을 경우 [삭제하기] 버튼 보여주기 -->
		<c:choose>
		<c:when test="${loginedId eq productRetrieve.userid}">
			<input type="button" value="수정하기" class="btn btn-info btn-lg mt-2" onclick="location.href='productUpdateUIServlet'">
			<input type="button" value="삭제하기" class="btn btn-danger btn-lg mt-2" onclick="location.href='productDelete?pCode=${productRetrieve.pCode }'">
			
			<!-- 해당 상품이 판매중인 상품일 경우 [판매완료] 버튼 보여주기 -->
			<c:if test="${productRetrieve.isSold eq 'n'}">
				<input class="submit btn btn-secondary btn-lg mt-2" type="submit" value="판매완료">
			</c:if>
			
		</c:when>
		<%-- 작성자와 로그인된 아이디가 같지 않을 경우 [쪽지보내기] 버튼 보여주기 --%>
		<c:otherwise>
			<input class="submit btn btn-warning btn-lg mt-2" type="submit" value="쪽지 보내기">
		</c:otherwise>
		</c:choose>
	</c:if>
	</div>
</form>
</div>
</div>