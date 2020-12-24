<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" href="js/bootstrap.min.js">
<link rel="stylesheet" href="css/freeBoardList.css">
<link rel="stylesheet" href="css/main.css">

<div class="container">

     <div class="row justify-content-center mb-5">
       <div class="col-md-7 text-center">
         <h3 style="margin-top: 20px">자유게시판</h3>
       </div>
     </div>
    
	<table>
		<tr>
			<td class="a2" colspan="6">
				<form action="search">
					<select name="searchName">
		    			<option value="title">제목</option>
		    			<option value="content">내용</option>
		    			<option value="userid">작성자</option>
		   			</select>
		    		<input type="text" name="searchValue">
		    		<input type="submit" value="검색">
		    		<input type="button" value="글쓰기" onClick="location.href='loginCheck/freeBoardWrite'">
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
	
		<c:forEach var="x" items="${selectFreeBoard}">
		<tr>
	 	  	<td><a href="freeBoardRetrieve?num=${x.num}">${x.num}</a></td>
	 	  	<td><a href="freeBoardRetrieve?num=${x.num}">${x.title}</a></td>
	 	  	<td><a href="freeBoardRetrieve?num=${x.num}">${x.content}</a></td>
	 	  	<td style="text-align:center;">${x.userid}</td>
	 	  	<td style="text-align:center;">${x.writeday}</td>
	 	  	<td style="text-align:center;">${x.readCnt}</td>
		</tr>
		</c:forEach>
		
		<tr>
			<td class="a3" colspan="6">      
				<c:set var="searchName" value="${searchName}"/>
				<c:set var="searchValue" value="${searchValue}"/>
				<c:set var="curPage" value="${pDTO.curPage}" />
				<c:set var="perPage" value="${pDTO.perPage}" />
				<c:set var="totalCount" value="${pDTO.totalCount}" />
				<fmt:parseNumber var="totalpage" integerOnly= "true" value="${pDTO.totalCount / pDTO.perPage} " />
		
				<c:if test="${totalCount%perPage ne '0'}">
				    <c:set var="totalpage" value="${totalpage + 1}" />
				</c:if>
				
				<c:forEach var="i" begin="1" end="${totalpage}" step="1">
				    <c:if test="${i == curPage}">
	                   	<c:out value="${i}" />
	                   </c:if>
	                   <c:if test="${i != curPage}">
						<a href="freeBoardList?curPage=${i}&searchName=${searchName}&searchValue=${searchValue}">${i}</a>
	                   </c:if>                    
				</c:forEach>
				
			</td>
		</tr>
		
	</table>
	
	<!-- 모달창 -->
    <div class="modal fade" id="myModal" role="dialog" style="z-index:100000 ">
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
	
	<script type="text/javascript">
	$(() => {
		var result = '<c:out value="${result}" />';
		checkModal(result);
	
		history.replaceState({}, null, null);
		
		function checkModal(result) {
	    if(result === '' || history.state){
				return;
			}else{
				// 모달창에 들어갈 메세지
				$(".modal-body").html(result);
				// 모달창 띄워주기
				$("#myModal").modal("show");
			}
		}
	})
	</script>
	
</div>