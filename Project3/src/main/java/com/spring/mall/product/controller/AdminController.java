package com.spring.mall.product.controller;

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
public class AdminController {
	
	@Autowired
	private ProductService productService;
	
	public AdminController() {
		System.out.println(">> AdminController() 객체 생성~~");
	}
	
	@GetMapping("admin.do")
	public String adminView() {
		System.out.println("관리자메인페이지(main.jsp)이동 - adminView()");
		return "admin/adminMain";
	}
	
	@GetMapping("/adminGetProductList.do")
	public String adminGetProductList(Model model) {
		ProductVO vo = null;
		List<ProductVO> adminProductList = productService.getProductList(vo);
		model.addAttribute("adminProductList",adminProductList);
		
		System.out.println("상품목록페이지(productList.jsp)이동 - getProductList()");
		return "admin/productList";
	}
	
	
}
