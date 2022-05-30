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
		return "admin/main";
	}
	
	@GetMapping("/getProductList.do")
	public String getProductList(Model model) {
		int food = 1;
		int exercise = 2;
		
		List<ProductVO> foodList = productService.getProductListCategory(food);
		List<ProductVO> exerciseList = productService.getProductListCategory(exercise);
		model.addAttribute("foodList",foodList);
		model.addAttribute("exerciseList",exerciseList);
		
		System.out.println("상품목록페이지(productList.jsp)이동 - getProductList()");
		return "admin/productList";
	}
	
	
}
