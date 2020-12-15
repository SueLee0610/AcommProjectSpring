package com.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class MemberIDSearchHandler {

	@Autowired
	MemberService service;

	@Autowired
	private JavaMailSender mailSender;

	// mailSending 코드
	@RequestMapping(value = "/idSearchMail")
	public String mailSending(@RequestParam String userName, @RequestParam String phoneNum, @RequestParam String email1,
			@RequestParam String email2, HttpServletRequest request) {

		MemberDTO dto = new MemberDTO();
		dto.setUserName(userName);
		dto.setPhoneNum(phoneNum);
		String userID = service.idSearch(dto);
		System.out.println(userID);
		String nextPage = "";
		
		// 입력된 정보가 디비와 일치하지 않을 경우
		if (userID == null) {
			System.out.println("이름 또는 핸드폰이 등록되지 않은 정보입니다.");
			nextPage = "idSearch";
		
		// 입력된 정보가 디비에 있을 경우
		} else {
			System.out.println("메일이 전송되었습니다.");
			
			String fromMail = ""; // 보내는 사람 이메일(필수)
			String toMail = email1 + '@' + email2; // 받는 사람 이메일
			String title = "Acommunity 사이트에 등록된 아이디 정보입니다."; // 제목
			String content = "회원님의 아이디는 " + userID + "입니다"; // 이메일 내용
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,
						true, "UTF-8");

				messageHelper.setFrom(fromMail); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(toMail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략 가능
				messageHelper.setText(content); // 메일 내용
				mailSender.send(message);
				
			} catch (Exception e) {
				System.out.println(e);
			}
			
			nextPage = "main";
		}
		
		return nextPage;
	}
}