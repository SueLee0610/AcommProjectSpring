<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>	

<div class="container">
	<div class="row justify-content-center mb-5">
    	<div class="col-md-7 text-center">
        	<h3 style="margin-top: 20px">게시글 보기</h3>
        </div>
    </div>

	<!-- <form name="myForm"> -->
	<form action="" method="post">
		<input type="hidden" name="num" value="${freeBoardDetail.num}">
		No. ${freeBoardDetail.num}

		<div class="row form-group">
			<div class="col-md-6 mb-3 mb-md-0">
				<label class="text-black" for="author">작성자</label>
				<input type="text" name="author" id="author" class="form-control" value="${freeBoardDetail.userid}" readonly>
			</div>
			<div class="col-md-6">
				<label class="text-black" for="writeday">작성일</label>
				<input type="text" name="writeday" id="writeday" class="form-control" value="${freeBoardDetail.writeday}" readonly>
			</div>
		</div>

		<div class="row form-group">
			<div class="col-md-12">
				<label class="text-black" for="title">제목</label>
				<input type="text" name="title" id="title" class="form-control" value="${freeBoardDetail.title}" readonly>
			</div>
		</div>

		<!-- 저장된 지도 정보가 있을 경우 지도 영역을 표시한다 -->
		<c:if test="${freeBoardDetail.placeName != null}">

		<!-- 이미지 지도를 표시할 div 입니다 -->
		<div id="staticMap" style="width:100%;height:350px;"></div>    
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=64efe24df194e972fb4e28fe4f02b556"></script>
		<script>
		// 이미지 지도에서 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(${freeBoardDetail.placeLa}, ${freeBoardDetail.placeMa}); 
		
		// 이미지 지도에 표시할 마커입니다
		// 이미지 지도에 표시할 마커는 Object 형태입니다
		var marker = {
		    position: markerPosition,
		    text: '${freeBoardDetail.placeName}' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다  
		};
		
		var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
		    staticMapOption = { 
		        center: new kakao.maps.LatLng(${freeBoardDetail.placeLa}, ${freeBoardDetail.placeMa}), // 이미지 지도의 중심좌표
		        level: 3, // 이미지 지도의 확대 레벨
		        marker: marker // 이미지 지도에 표시할 마커 
		    };    
		
		// 이미지 지도를 생성합니다
		var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
		</script>
		<input type="hidden" id="placeName" value="${freeBoardDetail.placeName}">
		<input type="hidden" id="placeLa" value="${freeBoardDetail.placeLa}">
		<input type="hidden" id="placeMa" value="${freeBoardDetail.placeMa}">
		<br>

		</c:if>

		<div class="row form-group">
			<div class="col-md-12">
				<label class="text-black" for="content">내용</label>
				<textarea name="content" id="content" cols="30" rows="7" class="form-control" style="padding:20px" readonly>${freeBoardDetail.content}</textarea>
			</div>
		</div>

		<c:if test="${login.userID eq freeBoardDetail.userid}">
			<!-- 수정 가능하도록 활성화  -->
			<script>
				$(document).ready(function() {
					//attr을 이용하여 속성값 변경하기
					$('#title').attr('readonly', false); //readonly을 비활성화 (읽고 쓰기 가능)
					$('#content').attr('readonly', false);
	  			});
			</script>
			<input type="button" value="수정" class="btn btn-secondary btn-md text-white" onclick="location.href='freeBoardUpdate?num=${freeBoardDetail.num }'">
			<input type="button" value="삭제" class="btn btn-secondary btn-md text-white" onclick="location.href='loginCheck/delete?num=${freeBoardDetail.num }'">
		</c:if>

	</form>
</div>