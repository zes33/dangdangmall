package com.spring.mall.cart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mall.cart.service.CartService;
import com.spring.mall.cart.vo.CartDetailProductVO;


@Controller
@RequestMapping("/cart/**")
public class CartController {

	@Autowired
	private CartService cartService;
	
	public CartController() {
		System.out.println(">> CartController() 객체 생성 ");
	}
	
	@GetMapping("cart.do")
	public String cartView() {
		System.out.println("장바구니 페이지(cart.jsp)이동 - cartView()");
		return "user/cart";
	}

	@ModelAttribute("getCartList")
	public List<CartDetailProductVO> getCartList(CartDetailProductVO vo, Model model) {
		System.out.println(">> getCartList()");
		List<CartDetailProductVO> getCartList = cartService.getCartList(vo);
		return getCartList;
	}
	
	
	
	
	
}
