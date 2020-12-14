<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>	
<script type="text/javascript">
	function updateBoard(e,f){
		e.preventDefault();
		f.action="loginCheck/update";
		f.submit();
	}
	function deleteBoard(e,num){
		e.preventDefault();
		location.href="loginCheck/delete?num="+num;
	}
</script>

<div class="container">
	<div class="row justify-content-center mb-5">
    	<div class="col-md-7 text-center">
        	<h3 style="margin-top: 20px">게시글 수정</h3>
        </div>
    </div>

	<form name="myForm">
		<input type="hidden" name="num" value="${freeBoardRetrieve.num}">
		No. ${freeBoardRetrieve.num}

		<div class="row form-group">
			<div class="col-md-6 mb-3 mb-md-0">
				<label class="text-black" for="author">작성자</label>
				<input type="text" name="author" id="author" class="form-control" value="${freeBoardRetrieve.userid}" readonly>
			</div>
			<div class="col-md-6">
				<label class="text-black" for="writeday">작성일</label>
				<input type="text" name="writeday" id="writeday" class="form-control" value="${freeBoardRetrieve.writeday}" readonly>
			</div>
		</div>

		<div class="row form-group">
			<div class="col-md-12">
				<label class="text-black" for="title">제목</label>
				<input type="text" name="title" id="title" class="form-control" value="${freeBoardRetrieve.title}" readonly>
			</div>
		</div>

		<!-- 이미지 지도를 표시할 div 입니다 -->
		<div id="staticMap" style="width:100%;height:350px;"></div>    
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=64efe24df194e972fb4e28fe4f02b556"></script>
		<script>
		// 이미지 지도에서 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(${freeBoardRetrieve.placeLa}, ${freeBoardRetrieve.placeMa}); 
		
		// 이미지 지도에 표시할 마커입니다
		// 이미지 지도에 표시할 마커는 Object 형태입니다
		var marker = {
		    position: markerPosition,
		    text: '${freeBoardRetrieve.placeName}' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다  
		};
		
		var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
		    staticMapOption = { 
		        center: new kakao.maps.LatLng(${freeBoardRetrieve.placeLa}, ${freeBoardRetrieve.placeMa}), // 이미지 지도의 중심좌표
		        level: 3, // 이미지 지도의 확대 레벨
		        marker: marker // 이미지 지도에 표시할 마커 
		    };    
		
		// 이미지 지도를 생성합니다
		var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
		</script>
		<br>

		<div class="row form-group">
			<div class="col-md-12">
				<label class="text-black" for="content">내용</label>
				<textarea name="content" id="content" cols="30" rows="7" class="form-control" style="padding:20px" readonly>${freeBoardRetrieve.content}</textarea>
			</div>
		</div>

		<c:if test="${login.userID eq freeBoardRetrieve.userid}">
			<!-- 수정 가능하도록 활성화  -->
			<script>
				$(document).ready(function() {
					//attr을 이용하여 속성값 변경하기
					$('#title').attr('readonly', false); //readonly을 비활성화 (읽고 쓰기 가능)
					$('#content').attr('readonly', false);
	  			});
			</script>

			<input type="submit" value="수정" class="btn btn-secondary btn-md text-white" onclick="updateBoard(event, myForm)">
			<input type="submit" value="삭제" class="btn btn-secondary btn-md text-white" onclick="deleteBoard(event, ${freeBoardRetrieve.num})">
		</c:if>

	</form>
</div>