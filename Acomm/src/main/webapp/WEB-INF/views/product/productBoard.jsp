<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="js/productSearchJS.js"></script>
<script type="text/javascript">
$(() => {
	// 모달창 띄워주기
	var result = '<c:out value="${result}" />';
	checkModal(result);
	
	history.replaceState({}, null, null);
	
	function checkModal (result) {
		if(result == '' || history.state){
			return;
		}else{
			/* $(".modal-body").html("[" + result + "] 상품이 등록되었습니다."); */
			$(".modal-body").html(result);
			$("#myModal").modal("show");
		}
	}
})
</script>

<div class="pContainer">
	<!-- 타이틀 -->
	<div class="row mb-5">
         <div class="col-12 text-center">
             <h1 class="text-black site-section-heading display-4">중고게시판</h1>
         </div>
     </div>
   	<!-- 상품 검색 -->
	<div class="input-group mb-3 col-6 float-right">
		<select id="searchName">
			<option value="pName">상품명</option>
			<option value="userID">판매자</option>
			<option value="pContent">상품설명</option>
		</select> <input type="text" id="searchTerm"
			class="form-control border-secondary text-white bg-transparent text-black"
			placeholder="상품검색" aria-describedby="button-addon2">
		<div class="input-group-append">
			<button class="btn btn-secondary text-white" type="button"
				id="search">검색</button>
		</div>
 		<!-- 상품등록 버튼 -->
		<c:if test="${!empty memberDTO }">
			<div class="input-group-append">
				<button value="등록하기" class="btn btn-primary text-white"
					onclick="location.href='productAdd'">상품등록</button>
			</div>
			<div class="input-group-append">
				<button value="채팅하기" class="btn btn-primary text-white"
					onclick="location.href='productChat?userID=${memberDTO.userID}'">채팅하기</button>
			</div>
		</c:if>
	</div>
	<!-- 상품 목록 -->
	<section class="site-section" id="blog-section">
	<div class="container">
		<div class="row row-cols-3 newProduct">
		<c:forEach var="productList" items="${productList}" varStatus="status">
			<div class="col-md-3 col-lg-4 mb-4 mb-lg-4 ">
				<div class="card h-100" >
					<a href="productRetrieve?pCode=${productList.pCode}">
					<img src="img/${productList.pImage}" alt="Image" width="400px" class="img-fluid"></a>
					<div class="card-body">
					<h5 class="card-title font-size-regular pName">
						<a href="productRetrieve?pCode=${productList.pCode}" class="text-dark">${productList.pName}</a>
					</h5>
					<p class="card-text text-body">
					가격: ${productList.pPrice}원<br>
					판매자: ${productList.userid}<br>
					<c:out value="${fn:substring(productList.pContent, 0, 18)}" />...<br>
					<c:if test="${productList.isSold=='y'}"><span class="card-text text-danger"><b>Sold Out</b></span></c:if>
					</p>
					<p class="card-text "><a href="productRetrieve?pCode=${productList.pCode}" class="text-info">상세보기</a></p>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
	</section>
</div>

<!-- 모달창 -->
<div class="modal fade" id="myModal" role="dialog" style="z-index: 100000">
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
