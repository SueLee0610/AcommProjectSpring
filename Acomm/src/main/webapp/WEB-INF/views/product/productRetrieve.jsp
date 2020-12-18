<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
$( () => {
	// submit 버튼의 글자가 [판매완료]라면 폼은 isSold 상태를 업뎃하는 서블릿으로 이동 
	if($(".submit").val() == "판매완료"){
		$("form").attr("action", "loginCheck/productIsSoldUpdate");
	}else{
		$("form").attr("action", "");
	}
	
	// 상품게시물 수정 후 모달창 띄워주기
	var result = '<c:out value="${result}" />';
	checkModal(result);
	
	function checkModal (result) {
		if(result == ''){
			return;
		}else{
			$(".modal-body").html(result);
			$("#myModal").modal("show");
		}
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
		<c:if test="${loginedId eq productRetrieve.userid}">
			<input type="button" value="수정하기" class="btn btn-info btn-lg mt-2" onclick="location.href='productUpdate'">
			<input type="button" value="삭제하기" class="btn btn-danger btn-lg mt-2" onclick="location.href='loginCheck/productDelete?pCode=${productRetrieve.pCode }'">
			
			<!-- 해당 상품이 판매중인 상품일 경우 [판매완료] 버튼 보여주기 -->
			<c:if test="${productRetrieve.isSold eq 'n'}">
				<input class="submit btn btn-secondary btn-lg mt-2" type="submit" value="판매완료">
			</c:if>
			
		</c:if>
	</c:if>
	</div>
</form>
</div>
</div>

<!-- 모달창 -->
<div class="modal fade" id="myModal" role="dialog"
	style="z-index: 100000">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body">
				<p>message</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>