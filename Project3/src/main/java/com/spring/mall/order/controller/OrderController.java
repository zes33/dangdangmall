package com.spring.mall.order.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mall.cart.vo.CartVO;

@Controller
@RequestMapping("/order/**")
public class OrderController {
	
	public OrderController() {
		System.out.println(">> OrderController() 객체 생성 ");
	}
	
	@GetMapping("orderView.do")
	public String order() {
		System.out.println(">> orderView.do() 생성  -> order.jsp 이동 ");
		return "store/order";

	}
	
	
	
}
