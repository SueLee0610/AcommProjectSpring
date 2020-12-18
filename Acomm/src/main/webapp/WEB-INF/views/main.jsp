<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="common/header.jsp" flush="true"></jsp:include>
	<div class="site-blocks-cover overlay"
		style="background-image: url(img/banner.jpg);" data-aos="fade"
		data-stellar-background-ratio="0.5">
		<div class="container">
			<div
				class="row align-items-center justify-content-center text-center">
				<div class="col-md-12" data-aos="fade-up" data-aos-delay="400">
					<div class="row justify-content-center mb-4">
						<div class="col-md-8 text-center">
							<h1>
								국비지원 수강생을 위한 정보공유 커뮤니티<br> <span class="typed-words"></span>
							</h1>
							<br>
							<p class="lead mb-5">Acomm</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
		var typed = new Typed('.typed-words', {
			strings : [ "Acommunity" ],
			typeSpeed : 80,
			backSpeed : 80,
			backDelay : 4000,
			startDelay : 1000,
			loop : true,
			showCursor : true
		});
		
		// 모달창 
		$(() => {
			// 모달창 띄워주기
			var result = '<c:out value="${result}" />';
			checkModal(result);
			history.replaceState({}, null, null);
			
			function checkModal (result) {
				if(result == '' || history.state){
					return;
				}else{
					$(".modal-body").html(result);
					$("#myModal").modal("show");
				}
			}
		})
	</script>

	<!-- 모달창 -->
	<div class="modal fade" id="myModal" role="dialog"
		style="z-index: 100000">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body">
					<p>${result}</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>