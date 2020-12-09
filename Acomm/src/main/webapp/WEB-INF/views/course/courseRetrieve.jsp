<%@page import="com.dto.MemberDTO"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dto.CourseDTO"%>
<%@page import="com.dto.ReplyDTO"%>
<%@page import="java.util.List"%>

<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/courseReplyJS.js"></script>

<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/courseRetrieve.css">

<%
	// 클릭한 버튼의 id값을 request parameter로 넘겨받기
int cCode = Integer.parseInt((String) request.getParameter("cCode"));

// session에서 CourseDTO 2개가 담긴 리스트 받아오기
List<CourseDTO> dtoList = (List<CourseDTO>) session.getAttribute("courseDetail");

// 리스트에서 클릭한 cCode에 해당하는 CourseDTO 선택
CourseDTO courseDTO = null;
for (CourseDTO dto : dtoList) {
	if (cCode == dto.getcCode()) {
		courseDTO = dto;
		break;
	}
}

// CourseDTO 데이터 파싱
String cName = courseDTO.getcName();
String cImage = courseDTO.getcImage();
String cStartDate = courseDTO.getcStartDate();
String cEndDate = courseDTO.getcEndDate();
int cTotalDate = courseDTO.getcTotalDate();
String cInstructor = courseDTO.getcInstructor();
int cPrice = courseDTO.getcPrice();
String cContent = courseDTO.getcContent();
int cStudNum = courseDTO.getcStudNum();

// 코스 dto 정보 세션 저장
session.setAttribute("courseDTO", courseDTO);

// request에서 cCode에 따른 평점, 나이대 리스트 받아오기
List<Integer> scoreList = (List<Integer>) request.getAttribute("scoreList");
List<Integer> ageList = (List<Integer>) request.getAttribute("ageList");

// 현재 로그인된 회원의 cCode 가져오기
MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
int memberCcode = 1;
if (memberDTO != null) {
	memberCcode = memberDTO.getcCode();
}

// member 테이블에서 진행예정 강의 선택자 수 가져오기
int currentStudNum = (int) request.getAttribute("currentStudNum");

float scoreAvg = 0;
if (scoreList.size() != 0) {
	for (Integer x : scoreList) {
		scoreAvg += x;
	}
	scoreAvg /= scoreList.size();
} else {
	scoreAvg = 0;
}

// 나이대 구간별 인원 count하기
int age21_25 = 0;
int age26_30 = 0;
int age31_35 = 0;
int age36_40 = 0;

for (int age : ageList) {
	if (age >= 20 && age <= 24) {
		age21_25++;
	} else if (age <= 29) {
		age26_30++;
	} else if (age <= 34) {
		age31_35++;
	} else if (age <= 39) {
		age36_40++;
	}
}

// session에 담긴 정보 삭제
session.removeAttribute("courseDetail");
%>
<div class="cRetrieveContainer">
	<form action="loginCheck/CourseOrder" method="post">
		<div class="jumbotron bg-white mb-0">
			<span id="cImage"><img src="img/<%=cImage%>"></span> <br><br>
			<h1 id="cName" class="display-5"><%=cName%></h1>
			<p id="cContent" class="lead "><%=cContent%></p>
			<div class="card text-left mb-5">
				 <ul class="list-group list-group-flush">
				    <li class="list-group-item">교육 일정 : <span id="cStartDate"><%=cStartDate%></span> ~ <span id="cEndDate"><%=cEndDate%></span></li>
				    <li class="list-group-item">	총 강의 일수 : <span id="cTotalDate"><%=cTotalDate%>일</span></li>
				    <li class="list-group-item">강사 : <span id="cInstructor"><%=cInstructor%></span></li>
				    <li class="list-group-item">비용 : <span id="cPrice"><%=cPrice%>원</span></li>
				    <li class="list-group-item">평점: <span id="scoreAvg"><%=scoreAvg%>점</span></li>
				    <li class="list-group-item">
				    	연령대: <br>20~25:
					<%=age21_25%>명<br> 25~20:
					<%=age26_30%>명<br> 30~35:
					<%=age31_35%>명<br> 35~40:
					<%=age36_40%>명<br>
				    </li>
				  </ul>
		<%
			// 주문조건: [진행예정] 상태의 강의, [정원]이 남아있을 것
		// 코스의 정원과 회원가입시 진행예정 강의를 선택한 인원수를 비교 -> 정원이 남아있다면 신청하기 버튼 보여주기
		// 회원의 cCode가 0번(수강중인강의 없음)인 경우에만 신청가능
		if (cCode == 5 || cCode == 6) {
			if (cStudNum > currentStudNum) {
				if (memberCcode == 0) {
		%>
		<input type="submit" class="btn btn-info" value="신청하기">
		<%
			}
		}
		}
		%>
			</div>
		</div>
	</form>
</div>
<br>
<div class="cReplyContainer">
	<div class="row">
    	<div class="col-md-12 blog-content">
        	<h3 class="mb-3 text-primary">Comments</h3>
	<input type="hidden" id="cCode" value="<%=cCode%>"> 작성자:
	<%
		List<ReplyDTO> replyList = (List<ReplyDTO>) request.getAttribute("replyList");
	String userID = "";
	if (memberDTO != null) {
		userID = memberDTO.getUserID();
	%>
	<input type="text" id="reWriter" size="20" maxlength="20"
		value="<%=userID%>" class="form-control">
	<%
		} else {
	%>
	<input type="text" id="reWriter" size="20" maxlength="20" class="form-control" required>
	<br />
	<%
}
%>
	<textarea id="reContent" rows="3" cols="60" maxlength="500"
		placeholder="댓글을 달아주세요." class="form-control" required></textarea>
	<button type="button" class="replyAdd btn btn-primary float-right mt-2 text-white" id="replyAdd">작성</button>
<br>
<%
	// 댓글 리스트 불러오기
for (ReplyDTO replyDTO : replyList) {
	int reNO = replyDTO.getReNO();
	String reWriter = replyDTO.getReWriter();
	String reContent = replyDTO.getReContent();
	int reDepth = replyDTO.getReDepth();
	int reDepthVar = reDepth * 25;
	int reParent = replyDTO.getReParent();
	String reDeleteFlag = replyDTO.getReDeleteFlag();
%>
<!-- 댓글 하나마다 대댓글 div를 display="none"으로 배치 -->
<div style="margin-left: <%=reDepthVar%>px; margin-top: 5px;"
	id="reply<%=reNO%>" margin-left: "<%=reDepthVar%>px"; display:inline-block;" class=<%=reParent%>>
	<div id="reWriter<%=reNO%>">
		작성자:
		<%=reWriter%></div>
	<div id="reContent<%=reNO%>">
		내용:
		<%=reContent%></div>
	<%
		if (reWriter.equals(userID)) {
		if (reDeleteFlag.equals("Y")) {
	%>
	<button type="button" class="replyDelete btn" id="<%=reNO%>">삭제</button>
	&nbsp;
	<%
		}
	%>
	<button type="button" class="replyUpdateForm btn" id="<%=reNO%>">수정</button>
	&nbsp;

	<%
		}
	if (reDepth == 0) {
	%>
	<button type="button" class="reReplyAddForm btn" id="<%=reNO%>">댓글</button>
	<%
		}
	%>
</div>
<br>
<div id="reReply<%=reNO%>"
	style="margin-top: 10px; display: none" class=<%=reParent%>>
	<input type="hidden" id="cCode" value="<%=cCode%>" class="form-control"> 작성자:
	<%
		if (memberDTO != null) {
	%>
	<input type="text" id="reReWriter<%=reNO%>" size="20" maxlength="20"
		value="<%=userID%>" class="form-control">
	<%
		} else {
	%>
	<input type="text" id="reReWriter<%=reNO%>" size="20" maxlength="20"
		class="form-control" required><br />
	<%
		}
	%>
	<textarea id="reReContent<%=reNO%>" rows="3" cols="60" maxlength="500"
		placeholder="내용을 작성해주세요." class="form-control" required></textarea>
	<button type="button" class="reReplyAdd btn" id="<%=reNO%>">작성</button>
	<button type="button" class="reReplyHide btn" id="<%=reNO%>">취소</button>
</div>
<%
}
%>
</div>
</div>
</div>
