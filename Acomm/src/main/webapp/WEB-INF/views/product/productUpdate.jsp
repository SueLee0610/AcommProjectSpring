<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

<form action="loginCheck/productUpdate" method="post" class="p-5 bg-white">
	<input type="hidden" name="pCode" value="${productRetrieve.pCode }">
	<input type="hidden" name="userID" value="${productRetrieve.userid}">
			<div class="row form-group">
				<div class="col-md-12 mb-3 mb-5">
					<img src="img/ ${productRetrieve.pImage}" width="400px">
				</div>
				<div class="col-md-12 mb-3 mb-md-0">
					<label class="text-black" for="fname">판매자 ID</label>
					<input type="text" id="fname" class="form-control" name="userID" value="${productRetrieve.userid}" readonly>
				</div>
				
			</div>
			<div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="pName">상품명</label> 
                  <input type="text" id="pName" class="form-control" name="pName" value="${productRetrieve.pName }" required>
                </div>
              </div>
			<div class="row form-group">
                <div class="col-md-12">
					<label class="text-black" for="pPrice">가격(원)</label>
					<input type="text" id="pPrice" class="form-control" name="pPrice" maxlength="8" value="${productRetrieve.pPrice }" required>
				</div>
			</div>
              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="pContent">상품설명</label> 
                  <textarea id="pContent" name="pContent" cols="30" rows="7" class="form-control" required>${productRetrieve.pContent}</textarea>
                </div>
              </div>
              <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" value="수정하기" class="btn btn-primary btn-md text-white">
                  <button value="등록하기" class="btn btn-secondary btn-md text-white" onclick="location.href='productBoard'">상품목록</button>
                </div>
              </div>
</form>
</div>
</div>