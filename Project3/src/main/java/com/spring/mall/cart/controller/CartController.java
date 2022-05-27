package com.spring.mall.cart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/cart/**")
public class CartController {

	public CartController() {
		System.out.println(">> CartController() 객체 생성 ");
	}
	
	@GetMapping("cart.do")
	public String cartView() {
		System.out.println("장바구니 페이지(cart.jsp)이동 - cartView()");
		return "user/cart";
	}

}
