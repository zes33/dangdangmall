package com.spring.mall.sales.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mall.sales.service.SalesService;

@Controller
@RequestMapping("/admin/**")
public class SalesController {
	
	@Autowired
	private SalesService salesService;
	
	public SalesController() {
		System.out.println(">>SalesController() 객체 생성");
	}
	
	@RequestMapping("/salesView.do")
	public String salesMain() {
		System.out.println("매출관리 페이지 이동");
		
		
		return "admin/salesMain";
	}
}
