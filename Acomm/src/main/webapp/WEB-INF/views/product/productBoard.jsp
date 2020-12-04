<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.dto.ProductDTO"%>
<%@ page import="com.dto.MemberDTO"%>


<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/productSearchJS.js"></script>

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
		<%
			// 로그인된 사용자에게만 [상품등록] 버튼 보여주기
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		if (memberDTO != null) {
		%>
		<div class="input-group-append">
			<button value="등록하기" class="btn btn-primary text-white"
				onclick="location.href='ProductAddUIServlet'">상품등록</button>
		</div>
		<%
			}
		%>
	</div>

	<!-- 상품 목록 -->
	<section class="site-section" id="blog-section">

	<div class="container">
		<div class="row row-cols-3 newProduct">
		<%
	// request에서 productList 가져오기
List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");
for (ProductDTO dto : productList) {
	String isSold = dto.getIsSold();
	int pPrice = dto.getpPrice();
	String pName = dto.getpName();
	String pImage = dto.getpImage();
	int pCode = dto.getpCode();
%>
			<div class="col-md-3 col-lg-4 mb-4 mb-lg-4 ">
				<div class="card h-100" >
					<a href="ProductRetrieveServlet?pCode=<%=pCode%>"><img src="img/<%=pImage%>"  alt="Image" width="400px"
						class="img-fluid"></a>
					<div class="card-body">
					<h5 class="card-title font-size-regular pName">
						<a href="ProductRetrieveServlet?pCode=<%=pCode%>" class="text-dark"><%=pName%></a>
					</h5>
					<p class="card-text text-body">가격: <%=pPrice%>원<br>팔렸습니까: <%=isSold%><br></p>
					<p class="card-text "><a href="ProductRetrieveServlet?pCode=<%=pCode%>" class="text-info">상세보기</a></p>
					</div>
				</div>
			</div>
			<%
	}
%>
		</div>
</div>
</section>
</div>
