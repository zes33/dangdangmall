package com.spring.mall.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tempPrd/**")
public class ZZZController {
	public ZZZController() {
		System.out.println("ZZZController() 객체 생성~~");
	}
	
	@GetMapping("tempPrd.do")
	public String tempProductDetail() {
		System.out.println("상품상세페이지(임시) 이동 - tempProductDetail 실행");
		return "store/productDetail";
	}
}
