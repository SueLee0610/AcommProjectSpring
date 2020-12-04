<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dto.MemberDTO"%>

<%
	MemberDTO result = (MemberDTO) session.getAttribute("login");
if (result != null) {
	String userName = result.getUserName();
%>
안녕하세요.
<%=userName%>님
<br>
<a href="LogoutServlet">로그아웃</a>
&nbsp;
<a href="MyPageServlet">마이페이지</a>
<%
	} else {
%>
<a href="LoginUIServlet">로그인</a>
&nbsp;
<a href="MemberUIServlet">회원가입</a>
<%
	}
%>

