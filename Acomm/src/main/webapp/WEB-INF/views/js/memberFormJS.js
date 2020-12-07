$( () => {

	// 아이디 중복, 유효성 검사 ajax		
	$("#userID").on("keyup", event => {
		$.ajax({
			type : "GET",
			url : "idDuplicateCheck",
			dataType : "text",
			data : {
				userID : $("#userID").val()
			},
			success : function(responseData, status, xhr) {
				$("#IDcheck").text(responseData);
			},
			error : function(xhr, status, responseData) {
				console.log("error");
			}
		});
	});
	
	// 비밀번호 유효성 검사: 영문 + 숫자 조합, 8자리 이상
	$("#userPW").on("keyup", () => {
		const userPW = $("#userPW").val();
		const regNum = userPW.search(/[0-9]/g);
		const regEng = userPW.search(/[a-z]/ig);
		let mesg = "";
		
		if (regNum < 0 || regEng < 0) {
			mesg = "영문과 숫자를 조합하여 입력해 주세요."
		}
		if (userPW.length < 8) {
			mesg = "영문과 숫자를 조합하여 8자리 이상 입력해 주세요."
		}
		$("#PWcheckVal").text(mesg);

	});

	// 비밀번호 확인 동일 여부 검사
	$("#userPW2").on("keyup", () => {
		const userPW = $("#userPW").val();
		let mesg = "비밀번호 불일치";
		if ($("#userPW2").val() == userPW) {
			mesg = "비밀번호 일치";
		}
		$("#PWcheck").text(mesg);
	});

	// 비밀번호 원시값 보이기
	$("#PWshow").on("mousedown", () => {
		$('#userPW').attr('type', "text");
	}).on('mouseup mouseleave', function() {
		$('#userPW').attr('type', "password");
	});

	// 전화번호에 숫자만 입력 가능, 그 외의 값이 입력되면 대체
	$("#phoneNum").on("keyup", () => {
		const regNum = /^[0-9]*$/;
		const phoneNum = $("#phoneNum").val();
		if(!regNum.test(phoneNum)){
			$("#phoneNum").val(phoneNum.replace(/[^0-9]/g,""));
		}
	});
		
	// email select된 값으로 email2 파라미터 설정
	$("#emailSelect").on("change", () => {
		const email2 = $("#emailSelect").val();
		$("#email2").val(email2);
	});
	
	// 강의 수강 이력이 있으면 강의 별점 태그 보여주기
	$("#courseSelect").on("change", () => {
		const course = $("#courseSelect").val();
		if(course != "0"){
			$("#scoreDiv").show();
		}else{
			$("scoreSelect").val(0);
			$("#scoreDiv").hide();
		}
	});
	
})