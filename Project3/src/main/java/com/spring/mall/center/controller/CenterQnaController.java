package com.spring.mall.center.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mall.center.service.CenterQnaService;
import com.spring.mall.center.vo.CenterQnaVO;

@Controller
@RequestMapping("/admin/**")
public class CenterQnaController {
	@Autowired
	private CenterQnaService centerQnaService;
	
	public CenterQnaController() {
		System.out.println("======= CenterQnaController() 객체 생성~~");
	}
	
	@GetMapping("/adminGetCenterList.do")
	public String adminGetCenterList(Model model) {
		CenterQnaVO vo = null;
		List<CenterQnaVO> adminGetCenterList = centerQnaService.getCenterQnaList(vo);
		model.addAttribute("adminGetCenterList", adminGetCenterList);
		
		System.out.println("관리자 고객 문의 목록 페이지(getCenterList.jsp)이동 - adminGetCenterList()");
		
		return "admin/getCenterList";
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
