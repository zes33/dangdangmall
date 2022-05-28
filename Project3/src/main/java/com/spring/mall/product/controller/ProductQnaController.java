package com.spring.mall.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mall.product.service.ProductQnaService;
import com.spring.mall.product.vo.ProductQnaVO;

@Controller
@RequestMapping("/productQna/**")
public class ProductQnaController {
	
	@Autowired
	private ProductQnaService productQnaService;

//	public ProductQnaController() {
//		System.out.println("ProductQnaController() 객체 생성");
//		
//	}
}
