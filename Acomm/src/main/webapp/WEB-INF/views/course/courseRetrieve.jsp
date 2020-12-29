<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript" src="js/courseReplyJS.js"></script>

<link rel="stylesheet" href="css/courseRetrieve.css">

<div class="cRetrieveContainer">
	<form action="loginCheck/CourseOrder" method="post">
		<div class="jumbotron bg-white mb-0">
			<span id="cImage"><img src="img/${courseDTO.cImage}"></span> <br>
			<br>
			<h1 id="cName" class="display-5">${courseDTO.cName}</h1>
			<p id="cContent" class="lead ">${courseDTO.cContent}</p>
			<div class="card text-left mb-5">
				<ul class="list-group list-group-flush">
					<li class="list-group-item">교육 일정 : <span id="cStartDate">${courseDTO.cStartDate}</span>
						~ <span id="cEndDate">${courseDTO.cEndDate}</span></li>
					<li class="list-group-item">총 강의 일수 : <span id="cTotalDate">${courseDTO.cTotalDate}일</span></li>
					<li class="list-group-item">강사 : <span id="cInstructor">${courseDTO.cInstructor}</span></li>
					<li class="list-group-item">비용 : <span id="cPrice">${courseDTO.cPrice}원</span></li>
					<li class="list-group-item">평점: <span id="scoreAvg">${scoreAvg}점</span></li>
					<li class="list-group-item">연령대: <br>21~25:
						${ageListCount.age21_25} 명<br> 26~30:
						${ageListCount.age26_30} 명<br> 31~35:
						${ageListCount.age31_35} 명<br> 36~40:
						${ageListCount.age36_40} 명<br>
					</li>
				</ul>
				<!--
		주문조건: [진행예정] 상태의 강의, [정원]이 남아있을 것
		코스의 정원과 회원가입시 진행예정 강의를 선택한 인원수를 비교 -> 정원이 남아있다면 신청하기 버튼 보여주기
		회원의 cCode가 0번(수강중인강의 없음)인 경우에만 신청가능
		-->
				<c:if test="${5 eq courseDTO.cCode || 6 eq  courseDTO.cCode}">
					<c:if test="${courseDTO.cStudNum > currentStudNum}">
						<c:if test="${0 eq login.cCode }">

							<input type="submit" class="newBtn btn btn-info" value="신청하기">

						</c:if>
					</c:if>
				</c:if>
			</div>
		</div>
	</form>
</div>
<br>

<!-- 모달창 -->
	<div class="modal fade" id="myModal" role="dialog" style="z-index:100000">
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
	
<div class="cReplyContainer">
	<div class="row">
		<div class="col-md-12 blog-content">
			<h3 class="mb-3 text-primary">Comments</h3>
			<input type="hidden" id="cCode" value="${courseDTO.cCode}">
			작성자:
			<c:choose>
				<c:when test="${!empty login }">
					<input type="text" id="reWriter" size="20" maxlength="20"
						value="${login.userID}" class="form-control">
				</c:when>
				<c:otherwise>
					<input type="text" id="reWriter" size="20" maxlength="20"
						class="form-control" required>
					<br />
				</c:otherwise>
			</c:choose>
			<textarea id="reContent" rows="3" cols="60" maxlength="500"
				placeholder="댓글을 달아주세요." class="form-control" required></textarea>
			<button type="button"
				class="replyAdd newBtn btn btn-primary float-right mt-2 text-white"
				id="replyAdd">작성</button>
			<br>
			<c:forEach var="reply" items="${replyList }">
				<!-- 댓글 하나마다 대댓글 div를 display="none"으로 배치 -->
				<div style="margin-left: ${reply.reDepth*25}px; margin-top: 5px;"
					id="reply${reply.reNO}"
					margin-left: "${reply.reDepth*25}px"; display:inline-block;" class=${reply.reParent}>
					<div id="reWriter${reply.reNO}">작성자: ${reply.reWriter}</div>
					<div id="reContent${reply.reNO}">내용:${reply.reContent}</div>
					<c:if test="${reply.reWriter eq  login.userID}">
						<c:if test="${'Y' eq  reply.reDeleteFlag}">
							<button type="button" class="replyDelete newBtn btn" id="${reply.reNO}">삭제</button>
	&nbsp;
	</c:if>
						<button type="button" class="replyUpdateForm newBtn btn"
							id="${reply.reNO}">수정</button>
	&nbsp;

	</c:if>
					<c:if test="${ 0 eq reply.reDepth }">
						<button type="button" class="reReplyAddForm newBtn btn"
							id="${reply.reNO}">댓글</button>
					</c:if>
				</div>
				<br>
				<div id="reReply${reply.reNO}"
					style="margin-top: 10px; display: none" class=${reply.reParent}>
					<input type="hidden" id="cCode" value="${courseDTO.cCode}"
						class="form-control"> 작성자:
					<c:choose>
						<c:when test="${!empty login }">
							<input type="text" id="reReWriter${reply.reNO}" size="20"
								maxlength="20" value="${login.userID}" class="form-control">
						</c:when>
						<c:otherwise>
							<input type="text" id="reReWriter${reply.reNO}" size="20"
								maxlength="20" class="form-control" required>
							<br />
						</c:otherwise>
					</c:choose>
					<textarea id="reReContent${reply.reNO}" rows="3" cols="60"
						maxlength="500" placeholder="내용을 작성해주세요." class="form-control"
						required></textarea>
					<button type="button" class="reReplyAdd newBtn btn" id="${reply.reNO}">작성</button>
					<button type="button" class="reReplyHide newBtn btn" id="${reply.reNO}">취소</button>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

