package com.spring.mall.product.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.mall.product.service.ProductService;
import com.spring.mall.product.vo.ProductVO;

@Controller
public class MainController{
	
	@Autowired
	private ProductService productService;
	
	public MainController() {
		System.out.println("MainController() 객체 생성");
	}
	
	@GetMapping("/main.do")
	public String mainView(Model model) {
		System.out.println("메인페이지(main.jsp)이동 - mainView()");
		int food = 1;
		int exercise = 2;
		
		List<ProductVO> foodList = productService.getFoodList(food);
		List<ProductVO> exerciseList = productService.getExerciseList(exercise);
		model.addAttribute("foodList",foodList);
		model.addAttribute("exerciseList",exerciseList);
		
		return "store/main";
	}
	
	
	


}
