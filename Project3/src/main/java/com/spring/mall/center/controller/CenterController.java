package com.spring.mall.center.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mall.product.service.ProductService;
import com.spring.mall.product.vo.ProductVO;

@Controller
@RequestMapping("/admin/**")
public class CenterController {
	
	@Autowired
	private ProductService productService;
	
	public CenterController() {
		System.out.println(">> CenterController() 객체 생성~~");
	}
	
	@GetMapping("adminGetCenterList.do")
	public String adminGetCenterList() {
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
