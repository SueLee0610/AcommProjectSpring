<%@ page import="com.dto.MemberDTO"%>
<%@ page import="com.dto.FreeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>	
<script type="text/javascript">
	function updateBoard(e,f){
		e.preventDefault();
		f.action="FreeBoardUpdateServlet";
		f.submit();
	}
	function deleteBoard(e,num){
		e.preventDefault();
		location.href="FreeBoardDeleteServlet?num="+num;
	}
</script>

<div class="container">
	<div class="row justify-content-center mb-5">
    	<div class="col-md-7 text-center">
        	<h3 style="margin-top: 20px">게시글 수정</h3>
        </div>
    </div>

	<%
		//FreeBoardDTO 정보 얻어오기
		FreeBoardDTO fDTO = (FreeBoardDTO)request.getAttribute("fDTO");
	    int num = fDTO.getNum();
	    String title = fDTO.getTitle();
	    String content = fDTO.getContent();
	    String userid = fDTO.getUserid();
	    String writeday = fDTO.getWriteday();
	%>

	<form name="myForm">
		<input type="hidden" name="num" value="<%= num %>">
		No. <%= num %>

		<div class="row form-group">
			<div class="col-md-6 mb-3 mb-md-0">
				<label class="text-black" for="author">작성자</label>
				<input type="text" name="author" id="author" class="form-control" value="<%= userid %>" readonly>
			</div>
			<div class="col-md-6">
				<label class="text-black" for="writeday">작성일</label>
				<input type="text" name="writeday" id="writeday" class="form-control" value="<%= writeday %>" readonly>
			</div>
		</div>

		<div class="row form-group">
			<div class="col-md-12">
				<label class="text-black" for="title">제목</label>
				<input type="text" name="title" id="title" class="form-control" value="<%= title %>" readonly>
			</div>
		</div>

		<div class="row form-group">
			<div class="col-md-12">
				<label class="text-black" for="content">내용</label>
				<textarea name="content" id="content" cols="30" rows="7" class="form-control" style="padding:20px" readonly><%=content %></textarea>
			</div>
		</div>

		<%
			//1. 로그인 여부 확인하여 로그인 되어 있을 경우  삭제,수정버튼 활성화
			//2. 그렇지 않으면 삭제,수정버튼 비활성화
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("login");
			if(memberDTO != null && userid.equals(memberDTO.getUserID())){
		%>

		<!-- 수정 가능하도록 활성화  -->
		<script>
			$(document).ready(function() {
				//attr을 이용하여 속성값 변경하기
				$('#title').attr('readonly', false); //readonly을 비활성화 (읽고 쓰기 가능)
				$('#content').attr('readonly', false);
  			});
		</script>

		<div class="row form-group">
			<div class="col-md-12">
				<input type="submit" value="수정" class="btn btn-secondary btn-md text-white" onclick="updateBoard(event, myForm)">
				<input type="submit" value="삭제" class="btn btn-secondary btn-md text-white" onclick="deleteBoard(event, <%=num %>)">
			</div>
		</div>

		<%
			}
		%>

	</form>
</div>