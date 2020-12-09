<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/courseBoardJS.js"></script>

<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/courseBoard.css">

<div class="centralize">
	<input type="button" id="12" class="courseInfo btn btn-dark" value="진행 종료 강의">  &nbsp;
	<input type="button" id="34" class="courseInfo btn btn-dark" value="진행 중인 강의">  &nbsp;
	<input type="button" id="56" class="courseInfo btn btn-dark" value="진행 예정 강의">  &nbsp;
</div>
<br>
<br>
<div class="cBoardContainer">
	<table id="courseTable" class="table">
		<thead>
			<tr>
				<th scope="col">훈련과정명</th>
				<th scope="col">날짜</th>
				<th scope="col">교육비</th>
				<th scope="col">정원</th>
				<th scope="col">이미지</th>
				<th scope="col">자세히 보기</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>
