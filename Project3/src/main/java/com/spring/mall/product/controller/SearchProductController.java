package com.spring.mall.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/searchProduct/**")
public class SearchProductController {

	public SearchProductController() {
		System.out.println("SearchProductController() 객체 생성!");
	}
	
	@GetMapping("/searchProductView.do")
	public String searchProduct() {
		System.out.println("searchProduct() searchProduct.jsp로 이동 ");
		
		return "store/searchProduct";
	}
	
	
	
}
