<%@ page import="java.util.List" %>
<%@ page import="com.dto.FreeBoardDTO"%>
<%@ page import="com.dto.MemberDTO"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dto.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/main.css">
		<link rel="stylesheet" href="css/freeBoardList.css">
	</head>
	<body>
	
		<%
			//request에 저장된 게시판 리스트 불러오기
			PageDTO pDTO = (PageDTO) request.getAttribute("pDTO");
			List<FreeBoardDTO> list = pDTO.getList();
		%>	
	
		<div class="container">
		
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center">
            <h3 style="margin-top: 20px">자유게시판</h3>
          </div>
        </div>
		<table>
			<tr>
				<td class="a2" colspan="6">
					<form action="FreeBoardSearchServlet">
						<select name="searchName">
			    			<option value="title">제목</option>
			    			<option value="content">내용</option>
			    			<option value="userid">작성자</option>
			   			</select>
			    		<input type="text" name="searchValue">
			    		<input type="submit" value="검색">
			    		<input type="button" value="글쓰기" onClick="location.href='FreeBoardWriteUIServlet'">
			 		</form>
			 	</td> 
			</tr>
			<tr>
				<th width="10%">No</th>
				<th width="20%">제목</th>
				<th width="40%">내용</th>
				<th width="10%" style="text-align:center;">작성자</th>
				<th width="10%" style="text-align:center;">작성일</th>
				<th width="10%" style="text-align:center;">조회수</th>
			</tr>
			
			<%
				for (int i = 0; i < list.size(); i++) {
					FreeBoardDTO dto = list.get(i);
					int num = dto.getNum();
					String title = dto.getTitle();
					String userid = dto.getUserid();
					String content = dto.getContent();
					String writeday = dto.getWriteday();
					int readCnt = dto.getReadCnt();
			%>
			
			<tr>
				<td><a href="FreeBoardRetrieveServlet?num=<%= num %>"><%= num %></a></td>
		 	  	<td><%= title %></td>
			  	<td><%= content %></td>
			  	<td style="text-align:center;"><%= userid %></td>
			  	<td style="text-align:center;"><%= writeday %></td>
			  	<td style="text-align:center;"><%= readCnt %></td>
			</tr>
			
			<%
				} //end for
			%>
	
		<tr>
		 <td class="a3" colspan="6"> 
		   <%
		        int curPage = pDTO.getCurPage();
		        int perPage = pDTO.getPerPage();
				int totalCount = pDTO.getTotalCount();
				int totalPage = totalCount/perPage;
				if(totalCount%perPage!=0) totalPage++;
		        for(int i=1; i<= totalPage; i++){
		          	if(i== curPage){
		          		out.print(i+"&nbsp;");
		          	}else{
		          		out.print("<a href='FreeBoardListServlet?curPage="+i+"'>"+i+"</a>&nbsp;");
		          	}
		        }//end for  
		   %>
		
		  </td>
		</tr>	
	
		</table>
		</div>
	</body>
</html>




