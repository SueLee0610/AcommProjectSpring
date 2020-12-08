$( () => {
	
	// ajax로 테이블 데이터 동적 생성
	$(".courseInfo").on("click", event => {
		$.ajax({
			type : "GET",
			url : "CourseInfo",
			dataType : "json",
			data : {
				courseInfo : event.target.getAttribute("id")
			},
			success : function(value){
				$("#courseTable > tbody").empty();
					for(let i = 0; i < value.length; i++){
						let str = '<tr><td>';
							str += value[i].cName + '</td><td>';
							str += value[i].cTotalDate + '</td><td>';
							str += value[i].cPrice + '</td><td>';
							str += value[i].cStudNum + '</td><td>';
							str += `<img src=img/${value[i].cImage} width=150 height=100></td><td>`;
							str += `<input type=button class="courseRetrieve btn" id=${value[i].cCode} value='자세히 보기'></td>`;
							str += '</tr>';
						$("#courseTable > tbody").append(str);
					};
			},
			error : function(xhr, status, responseData) {
				console.log("error");
			}
		});
	});
	
	// ajax 디폴트: 진행 중인 강의
	$("#34").click();	
})

// 버튼 클릭 시 해당 CourseDTO에 대한 cCode 넘겨주기
$(document).on("click",".courseRetrieve", event => {
	let cCode = event.target.id;
	$(location).attr('href', 'CourseRetrieve?cCode='+cCode);
});	