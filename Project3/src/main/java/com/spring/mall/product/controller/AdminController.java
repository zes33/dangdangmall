package com.spring.mall.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/**")
public class AdminController {
	
	public AdminController() {
		System.out.println(">> AdminController() 객체 생성~~");
	}
	
	@GetMapping("admin.do")
	public String adminView() {
		System.out.println("관리자메인페이지(main.jsp)이동 - adminView()");
		return "admin/main";
	}
}
