package com.spring.mall.sales.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mall.sales.service.SalesService;
import com.spring.mall.sales.vo.SalesVO;

@Controller
@RequestMapping("/admin/**")
public class SalesController {
	
	@Autowired
	private SalesService salesService;
	
	public SalesController() {
		System.out.println(">>SalesController() 객체 생성");
	}
	
	@RequestMapping("/salesView.do")
	public String salesMain(String year, Model model) {
		System.out.println("매출관리 페이지 이동");
		
		List<SalesVO> monthList = salesService.getMonthList(year);
		model.addAttribute("monthList", monthList);
		
		return "admin/salesMain";
	}
}
