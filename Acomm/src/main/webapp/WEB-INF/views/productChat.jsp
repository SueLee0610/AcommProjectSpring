<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/product.css">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="pContainer">
		<div class="chatContainer jumbotron bg-white">
			<h2>중고게시판 채팅방</h2>
			<fieldset>
				<textarea id="messageWindow" rows="20" cols="50"
					class="form-control" readonly></textarea>
				<br /> <input id="inputMessage" type="text" size="60" onKeypress="javascript:if(event.keyCode==13) {send()}"/> <input
					class="btn btn-dark" type="submit" value="전송" onclick="send()" />
				<button class="btn btn-danger"
					onclick="location.href='productBoard'">나가기</button>
			</fieldset>
		</div>
	</div>
</body>
<script type="text/javascript">
	let textarea = document.getElementById("messageWindow");
	let webSocket = new WebSocket('ws://localhost:8095/Acomm/broadcasting');
	let inputMessage = document.getElementById('inputMessage');
	
	webSocket.onerror = function(event) {
		onError(event)
	};
	webSocket.onopen = function(event) {
		onOpen(event)
	};
	webSocket.onmessage = function(event) {
		onMessage(event)
	};
	
	function onMessage(event) {
		textarea.value += event.data + "\n";
	}
	
	function onError(event) {
		alert(event.data);
	}

	// 웹소켓 연결시 호출되는 함수
	function onOpen(event) {
		textarea.value += "연결 성공\n";
		textarea.value += "${param.userID}님 입장\n";
	}
	
	// 메시지 전송 버튼을 눌렀을 경우
	function send() {
		textarea.value += `${param.userID}` + " : " + inputMessage.value + "\n";
		inputMessageString = `${param.userID}` + " : " + inputMessage.value;
		webSocket.send(inputMessageString);
		inputMessage.value = "";
	}
</script>
</html>