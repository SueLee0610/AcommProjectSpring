<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.dto.MemberDTO"%>
	
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(() => {
		
		$("#pPrice").on("keyup", () => {
			const regNum = /^[0-9]*$/;
			const pPrice = $("#pPrice").val();
			if(!regNum.test(pPrice)){
				$("#pPrice").val(pPrice.replace(/[^0-9]/g,""));
			}
		})
	
	})
</script>


<div class="pContainer" >
<div class="productAddContainer" >
<%
	MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
	String userID = memberDTO.getUserID();
%>

<form action="loginCheck/productAdd" method="post" enctype="multipart/form-data"  class="p-5 bg-white">
	<div class="row mb-5">
            <div class="col-12 text-center">
                <h2 class="text-black h1 site-section-heading">상품등록</h2>
            </div>
        </div>
			<div class="row form-group">
				<div class="col-md-12 mb-3 mb-md-0">
					<label class="text-black" for="fname">판매자 ID</label>
					<input type="text" id="fname" class="form-control" name="userID" value="<%=userID%>" readonly>
				</div>
				
			</div>
			<div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="pName">상품명</label> 
                  <input type="text" id="pName" class="form-control" name="pName" required>
                </div>
              </div>
			<div class="row form-group">
                <div class="col-md-12">
					<label class="text-black" for="pPrice">가격(원)</label>
					<input type="text" id="pPrice" class="form-control" name="pPrice" maxlength="8" required>
				</div>
			</div>
              
              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="pContent">상품설명</label> 
                  <textarea id="pContent" name="pContent" cols="30" rows="7" class="form-control" required></textarea>
                </div>
              </div>
			<div class="row form-group">
				<div class="col-md-12">
					<div class="custom-file">
						<input type="file" name="pImage" class="custom-file-input" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" accept="image/png, image/jpeg, image/jpg" required>
						<label class="custom-file-label" for="inputGroupFile04">파일선택 *(50MB 제한)</label>
					</div>
				</div>
			</div>
              
              <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" value="등록하기" class="btn btn-primary btn-md text-white">
                  <button value="등록하기" class="btn btn-secondary btn-md text-white" onclick="location.href='ProductBoardServlet'">상품목록</button>
                </div>
              </div>
</form>
</div>
</div>
