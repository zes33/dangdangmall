package com.spring.mall.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mall.product.service.ProductQnaService;
import com.spring.mall.product.service.ProductService;

@Controller
@RequestMapping("/productQna/**")
public class ProductQnaController {
	
	@Autowired
	private ProductQnaService productQnaService;
	@Autowired
	private ProductService productService;
	
	public ProductQnaController() {
		System.out.println("ProductQnaController() 객체 생성");
	}
	
	@RequestMapping("/kakaoQnaGo.do")
	//@GetMapping("/kakaoQnaGo.do")
	public String kakaoQna() {
		System.out.println("ProductQnaController.kakaoQna() 실행");
		
		return "store/kakaoQna";
	}
	

	
	
}
