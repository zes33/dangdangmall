package com.spring.mall.cart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class CartController {

	public CartController() {
		System.out.println(">> CartController() 객체 생성 ");
	}
	
	@GetMapping
	public String cartView() {
		System.out.println("장바구니페이지(cart.jsp)이동 - cartView()");
		
		return "user/cart";
	}

}
