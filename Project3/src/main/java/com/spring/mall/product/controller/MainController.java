package com.spring.mall.product.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController{
	
	public MainController() {
		System.out.println("MainController() 객체 생성");
	}
	
	@GetMapping("/main.do")
	public String mainView() {
		System.out.println("메인페이지(main.jsp)이동 - mainView()");
		return "store/main";
	}
	
	
	


}
