<%@ page import="com.dto.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//로그인 정보 얻어오기
	MemberDTO dto = (MemberDTO)session.getAttribute("login");
	String userid = dto.getUserID();
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div class="container">
		
	        <div class="row justify-content-center mb-5">
	          <div class="col-md-7 text-center">
	            <h3 style="margin-top: 20px">게시글 작성</h3>
	          </div>
	        </div>
	        
	        <form action="FreeBoardWriteServlet" method="post">
				<div class="row form-group">
					<div class="col-md-12">
						<label class="text-black" for="title">제목</label>
						<input type="text" name="title" id="title" class="form-control">
					</div>
				</div>     
				<div class="row form-group">
					<div class="col-md-12">
						<label class="text-black" for="userid">작성자</label>
						<input type="text" name="userid" id="userid" class="form-control" value="<%= userid %>" readonly>
					</div>
				</div>         
				<div class="row form-group">
					<div class="col-md-12">
						<label class="text-black" for="content">내용</label>
						<textarea name="content" id="content" cols="30" rows="7" class="form-control" style="padding:20px"></textarea>
					</div>
				</div>
	            <div class="row form-group">
	            	<div class="col-md-12">
	                	<input type="submit" value="저장" class="btn btn-secondary btn-md text-white">
	                </div>
	            </div>
			</form>

		</div>
	</body>
</html>




