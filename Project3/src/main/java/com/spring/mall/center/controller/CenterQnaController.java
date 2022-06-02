package com.spring.mall.center.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mall.center.service.CenterQnaService;
import com.spring.mall.center.vo.CenterQnaVO;

@Controller
@RequestMapping("/user/**")
public class CenterQnaController {
	@Autowired
	private CenterQnaService centerQnaService;
	
	public CenterQnaController() {
		System.out.println("======= CenterQnaController() 객체 생성~~");
	}
	
//	@GetMapping("/adminGetCenterList.do")
//	public String adminGetCenterList(Model model) {
//		CenterQnaVO vo = null;
//		List<CenterQnaVO> adminGetCenterList = centerQnaService.getCenterQnaList(vo);
//		model.addAttribute("adminGetCenterList", adminGetCenterList);
//		
//		System.out.println("관리자 고객 문의 목록 페이지(getCenterList.jsp)이동 - adminGetCenterList()");
//		
//		return "admin/getCenterList";
//	}
	
	@GetMapping("/getCenterList.do")
	public String getCenterList(Model model) {
		CenterQnaVO vo = null;
		List<Map<String, Object>> getCenterList = centerQnaService.getCenterQnaList(vo);
		model.addAttribute("getCenterList", getCenterList);
		System.out.println(getCenterList);
		System.out.println("고객 문의 목록 페이지(getCenterList.jsp)이동 - getCenterList()");
		
		return "user/getCenterList";
	}
	
	@RequestMapping("/insertCenterQna.do")
	public String insertCenterQna(CenterQnaVO vo) throws IllegalArgumentException, IOException{
		System.out.println(">>> 고객문의 입력");
		System.out.println("insert vo : " + vo);
		
		centerQnaService.insertCenterQna(vo);
		
		System.out.println(">>> 고객 문의 목록 페이지로 이동(getCenterList.jsp)이동 - insertCenterQna()");
		return "getCenterList.do";
	}
	
//	
//	@GetMapping("/adminGetProductList.do")
//	public String adminGetProductList(Model model) {
//		ProductVO vo = null;
//		List<ProductVO> adminProductList = productService.getProductList(vo);
//		model.addAttribute("adminProductList",adminProductList);
//		
//		System.out.println("상품목록페이지(productList.jsp)이동 - getProductList()");
//		return "admin/productList";
//	}
	
	
}
