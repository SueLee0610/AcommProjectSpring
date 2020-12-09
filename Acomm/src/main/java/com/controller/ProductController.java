package com.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dto.MemberDTO;
import com.dto.ProductDTO;
import com.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService service;
	
	@RequestMapping(value = "/productBoard")
	public ModelAndView productBoard(HttpSession session) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		List<ProductDTO> productList = service.selectProduct();
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberDTO", memberDTO);
		mav.addObject("productList", productList);
		mav.setViewName("productBoard");
		return mav;
	}

	@RequestMapping(value = "/productRetrieve")
	public String productRetrieve(@RequestParam("pCode") int pCode, HttpSession session, Model model) {
		String loginedId = null;
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
		if (memberDTO != null) {
			loginedId = memberDTO.getUserID();
		}
		model.addAttribute("loginedId", loginedId);
		ProductDTO productRetrieve = service.selectProductRetrieve(pCode);
		session.setAttribute("productRetrieve", productRetrieve);
		return "productRetrieve";
	}
	
	@RequestMapping(value = "/loginCheck/productIsSoldUpdate")
	public String productIsSoldUpdate(@RequestParam("pCode") int pCode) {
		service.isSoldUpdate(pCode);
		return "redirect:../productBoard";
	}
	
	@RequestMapping(value = "/loginCheck/productAdd", method = RequestMethod.POST, headers = ("content-type=multipart/*"))
	public String productAdd(HttpServletRequest request, @RequestParam("pImage") MultipartFile file,
			@RequestParam("userID")String userID, @RequestParam("pName")String pName, 
			@RequestParam("pPrice")int pPrice, @RequestParam("pContent")String pContent) throws Exception {
		String imageName = Paths.get(file.getOriginalFilename()).getFileName().toString();
		InputStream imageStream = file.getInputStream();

		// 상대경로 지정
		String relativeWebPath = "/WEB-INF/views/img";
		String absoluteFilePath = request.getSession().getServletContext().getRealPath(relativeWebPath);

		// 파일 제어 위한 파일객체 생성
		File imgfile = new File(absoluteFilePath, imageName);

		// 이미지 담을 임시공간 생성
		BufferedImage imgBuff = ImageIO.read(imageStream);

		// 지정된 형식으로 이미지 파일 출력
		ImageIO.write(imgBuff, "jpg", imgfile);
		ImageIO.write(imgBuff, "png", imgfile);
		
		// Product DB에 insert
		String pImage = imageName;
		ProductDTO pdto = new ProductDTO(0, null, userID, pPrice, pName, pContent, pImage);
		service.addProduct(pdto);
		
		// 스트림 닫기
		imageStream.close();
		return "redirect:../productBoard";
	}

}