
$(document).on("click", ".replyAdd", event => {
	
	// 디폴트 댓글 insert 
	const cCode = $("#cCode").val();
	const reWriter = $("#reWriter").val();
	const reContent = $("#reContent").val();
	$.ajax({
		type: "POST",
		url: "CourseReplyAdd",
		dataType: "json",
		data: {
			cCode: cCode,
			reWriter: reWriter,
			reContent: reContent
		},
		success: function(data) {
			let newReply = "";
			newReply += `<div style="margin-top: 5px;" id="reply${data.reNO}" margin-left: "${data.reDepth}*20"px; display: inline-block">`;
			newReply += `<div id="reWriter${data.reNO}"> 작성자: ${reWriter}</div>`;
			newReply += `<div id="reContent${data.reNO}"> 내용: ${reContent}</div>`;
			newReply += `<button type="button" class="replyDelete newBtn btn" id="${data.reNO}">삭제</button> &nbsp;`;
			newReply += `<button type="button" class="replyUpdateForm newBtn btn" id="${data.reNO}">수정</button> &nbsp;`;
			newReply += `<button type="button" class="reReplyAddForm newBtn btn" id=${data.reNO}">댓글</button>`;
			newReply += `</div>`;

			newReply += `<div id="reReply${data.reNO}" style="margin-top: 10px; display: none" class=${data.reNO}>`;
			newReply += `작성자: <input type="text" id="reReWriter${data.reNO}" size="20" maxlength="20" required><br />`;
			newReply += `<textarea id="reReContent${data.reNO}" rows="3" cols="60" maxlength="500" placeholder="내용을 작성해주세요." class="form-control" required></textarea>`;
			newReply += `<button type="button" class="reReplyAdd newBtn btn" id="${data.reNO}">작성</button> &nbsp;`;
			newReply += `<button type="button" class="reReplyHide newBtn btn" id="${data.reNO}">취소</button>`;
			newReply += `</div>`;
			
			// body의 마지막 div에 append
			//$("body").append(newReply);
			$('body').children('div').last().append(newReply);
			// 작성자 정보 디폴트로 설정, 작성 내용 초기화
			$("#reWriter").val(reWriter);
			$("#reContent").val('');
			
			$(".modal-body").html('댓글이 작성되었습니다.');
			$("#myModal").modal("show");
		},
		error: function(xhr, status, responseData) {
			console.log("error");
		}
	});


});

$(document).on("click", ".reReplyHide", event => {
	
	// div 요소 숨기기
	const reNO = event.target.getAttribute("id");
	let replyDia = document.getElementById("reReply" + reNO);
	replyDia.style.display = "none";
});

$(document).on("click", ".replyDelete", event => {
	
	// 댓글 삭제는 우선 display="none"으로 처리하고 db에서 삭제
	let reply = event.target.closest("div");
	const reNO = event.target.getAttribute("id");

	$.ajax({
		type: "POST",
		url: "CourseReplyDelete",
		dataType: "text",
		data: {
			reNO: reNO
		},
		success: function(data) {
			$(".modal-body").html('댓글이 삭제되었습니다.');
			$("#myModal").modal("show");
			
			reply.style.display = "none";
		},
		error: function(xhr, status, responseData) {
			console.log("error");
		}
	});

});

$(document).on("click", ".replyUpdateForm", event => {
		
	// 동적으로 생성된 댓글의 수정 div form 추가하기
	const reNO = event.target.getAttribute("id");

	let replyDiaString = 'reReply' + reNO;
	replyDiaString = replyDiaString.replace("\"", "");
	let reply = event.target.closest("div");
	let replyDia = document.getElementById(replyDiaString);
	
	if (replyDia == null) {
		let newReply = ``;
		newReply += `<div id="reReply${reNO}" margin-left: "25px"; style="margin-top: 25px;" class=${reNO}>`;
		newReply += `작성자: <input type="text" id="reReWriter${reNO}" size="20" maxlength="20" class="form-control" required>`;
		newReply += `<textarea id="reReContent${reNO}" rows="3" cols="60" maxlength="500" placeholder="내용을 작성해주세요." class="form-control" required></textarea>`;
		newReply += `<button type="button" class="reReplyUpdate newBtn btn" id="${reNO}">수정</button> &nbsp;`;
		newReply += `<button type="button" class="reReplyHide newBtn btn" id="${reNO}">취소</button>`;
		newReply += `</div>`;
		$(reply).append(newReply);
	} else {
		$(replyDia).children('.reReplyAdd').removeClass('reReplyAdd').addClass('reReplyUpdate');
		replyDia.style.display = "";
		reply.appendChild(replyDia);
		$(replyDia).children('.reReplyUpdate').text('수정');
	}
});


$(document).on('click', ".reReplyAddForm", function(event) {

	// 비동기로 생성된 댓글의 대댓글 insert div form 추가
	const reNO = event.target.getAttribute("id").replace("\"", "");
	let replyDiaString = 'reReply' + reNO;
	replyDiaString = replyDiaString.replace("\"", "");
	let reply = event.target.closest("div");
	let replyDia = document.getElementById(replyDiaString);
	replyDia.style.display = "";
	
	if ($(replyDia).children('.reReplyUpdate')[0] !== undefined) {
		$(replyDia).children('.reReplyUpdate').removeClass('reReplyUpdate').addClass('reReplyAdd');
		$(replyDia).children('.reReplyAdd').text('작성');
	}
	reply.appendChild(replyDia);
});

$(document).on("click", ".reReplyAdd", event => {
	
	// 대댓글 insert 기능
	const reNO = event.target.getAttribute("id");
	const writer = '#reReWriter' + reNO;
	const content = '#reReContent' + reNO;

	const cCode = $("#cCode").val();
	const reWriter = $(writer).val();
	const reContent = $(content).val();

	$.ajax({
		type: "POST",
		url: "CourseReplyAdd",
		dataType: "json",
		data: {
			reNO: reNO,
			cCode: cCode,
			reWriter: reWriter,
			reContent: reContent
		},
		success: function(data) {
			console.log(data);
			const reParent = data.reParent;
			let reDepth = data.reDepth;
			reDepth = reDepth * 25;
			let newReply = "";
			newReply += `<div style="margin-left: ${reDepth}px; margin-top: 25px;" id="reply${data.reNO}" margin-left: "${reDepth}px"; display: inline-block" class=${reParent}>`;
			newReply += `<div id="reWriter${data.reNO}"> 작성자: ${reWriter}</div>`;
			newReply += `<div id="reContent${data.reNO}"> 내용: ${reContent}</div>`;
			newReply += `<button type="button" class="replyDelete newBtn btn" id="${data.reNO}">삭제</button> &nbsp;`;
			newReply += `<button type="button" class="replyUpdateForm newBtn btn" id="${data.reNO}">수정</button> &nbsp;`;
			newReply += `</div>`;
			
			$(".modal-body").html('댓글이 작성되었습니다.');
			$("#myModal").modal("show");
			
			var replyDia = document.getElementById("reReply" + reParent);
			var classreParent = '.' + reParent + ":last";

			replyDia.style.display = "none";
			$(newReply).insertAfter($(classreParent));
			$(content).val('');
		},
		error: function(xhr, status, responseData) {
			console.log("error");
		}
	});

});

$(document).on("click", '.reReplyUpdate', event => {
	
	// 댓글 수정 기능
	const reNO = event.target.getAttribute("id");
	const writer = '#reReWriter' + reNO;
	const content = '#reReContent' + reNO;

	const cCode = $("#cCode").val();
	const reWriter = $(writer).val();
	const reContent = $(content).val();

	const reContentString = '#reContent' + reNO;
	let replyDia = document.getElementById("reReply" + reNO);
	$.ajax({
		type: "POST",
		url: "CourseReplyUpdate",
		dataType: "text",
		data: {
			reNO: reNO,
			cCode: cCode,
			reWriter: reWriter,
			reContent: reContent
		},
		success: function(data) {
			
			$(".modal-body").html('댓글이 수정되었습니다.');
			$("#myModal").modal("show");
			
			$(reContentString).text('내용: ' + reContent);
			replyDia.style.display = "none";
			$(content).val(reContent);
		},
		error: function(xhr, status, responseData) {
			console.log("error");
		}
	});
});