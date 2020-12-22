<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/login.css">

<!-- Modal script -->
<script type="text/javascript">
		// 모달창 표시
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

<!-- id, 패스워드 입력 검사 후 진행하도록  작성  -->
<div class="containerMember">
	<div class="innerContainer" >

		<div class="row mb-5">
			<div class="col-12 text-center">
				<h2 class="text-black h1 site-section-heading">Login</h2>
			</div>
		</div>

		<form action="login" method="post" class="p-5 bg-light">
			아이디:<input type="text" name="userID" id="userID" class="form-control"><br>
			비밀번호:<input type="password" name="userPW" id="userPW"
				class="form-control"><br> <input type="submit"
				value="로그인" class="btn btn-primary btn-md text-white"> <br>
			<a href="idSearch">아이디찾기</a> 
			<!-- <a href="MemberPwSearchUIServlet">비밀번호찾기</a>-->
		</form>
	</div>
</div>

<!--  로그인 실패시 모달창 -->
	<div class="modal fade" id="myModal" role="dialog"
		style="z-index: 100000">
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