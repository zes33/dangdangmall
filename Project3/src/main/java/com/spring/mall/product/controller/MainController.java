package com.spring.mall.product.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

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
	
	// 메인 페이지
	@GetMapping("/main.do")
	public String mainView(Model model, HttpSession session) {
		System.out.println("메인페이지(main.jsp)이동 - mainView()");
		System.out.println(session.getId());
		int food = 1;
		int exercise = 2;
		
		List<ProductVO> foodList = productService.getProductListCategory(food);
		List<ProductVO> exerciseList = productService.getProductListCategory(exercise);
		model.addAttribute("foodList",foodList);
		model.addAttribute("exerciseList",exerciseList);
		session.getAttribute("count");
		
		return "store/main";
	}
	
	@GetMapping("/newPrd.do")
	public String newPrdView(Model model, HttpSession session) {
		System.out.println("메인페이지(main.jsp)이동 - mainView()");
		System.out.println(session.getId());
		int food = 1;
		int exercise = 2;
		
		List<ProductVO> foodList = productService.getProductListCategory(food);
		List<ProductVO> exerciseList = productService.getProductListCategory(exercise);
		model.addAttribute("foodList",foodList);
		model.addAttribute("exerciseList",exerciseList);
		session.getAttribute("count");
		
		return "store/newPrd";
	}
	
	@GetMapping("/newDiscount.do")
	public String newDiscount(Model model, HttpSession session) {
		System.out.println("메인페이지(main.jsp)이동 - mainView()");
		System.out.println(session.getId());
		int food = 1;
		int exercise = 2;
		
		List<ProductVO> foodList = productService.getProductListCategory(food);
		List<ProductVO> exerciseList = productService.getProductListCategory(exercise);
		model.addAttribute("foodList",foodList);
		model.addAttribute("exerciseList",exerciseList);
		session.getAttribute("count");
		
		return "store/newDiscount";
	}
	
	@GetMapping("/morning.do")
	public String morning(Model model, HttpSession session) {
		System.out.println("메인페이지(main.jsp)이동 - mainView()");
		System.out.println(session.getId());
		int food = 1;
		int exercise = 2;
		
		List<ProductVO> foodList = productService.getProductListCategory(food);
		List<ProductVO> exerciseList = productService.getProductListCategory(exercise);
		model.addAttribute("foodList",foodList);
		model.addAttribute("exerciseList",exerciseList);
		session.getAttribute("count");
		
		return "store/morning";
	}
	


}
