package com.spring.mall.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mall.product.service.ProductQnaService;
import com.spring.mall.product.service.ProductService;
import com.spring.mall.product.vo.ProductQnaVO;
import com.spring.mall.product.vo.ProductVO;

@Controller
@RequestMapping("/productQna/**")
public class ProductQnaController {
	
	@Autowired
	private ProductQnaService productQnaService;
	
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
	
	@PostMapping("/insertPrdQna.do")
	public String insertProductQna(ProductQnaVO vo,ProductVO pv, RedirectAttributes reatt) {
		System.out.println("ProductQnaController.insertProductQna() 실행");
		System.out.println("vo : " + vo);
		
		productQnaService.insertProductQna(vo);
		reatt.addAttribute("product_id", vo.getProduct_id());
		
		
		return "forward:/tempPrd.do";
	}
	
	
	
}
