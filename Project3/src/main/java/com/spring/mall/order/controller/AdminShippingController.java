package com.spring.mall.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.mall.order.service.AdminShippingService;
import com.spring.mall.order.vo.UserOrderVO;
import com.spring.mall.pay.vo.RefundTotalVO;

@Controller
@RequestMapping("/adminShipping/**")
public class AdminShippingController {

	@Autowired
	private AdminShippingService adminShippingService;

	public AdminShippingController() {
		System.out.println(">> AdminShippingController 생성");
	}

	// 1. 관리자 상품 주문 테이블 목록 불러오기
	@RequestMapping("adminShippingView.do")
	public String order(UserOrderVO uov, HttpSession session) {
		System.out.println(">> adminShippingView.do() 생성  -> adminShipping.jsp 이동 ");
		List<UserOrderVO> getOrderList = adminShippingService.getOrderList(uov);
		session.setAttribute("getOrderList", getOrderList);
		return "admin/adminShipping";
	}

	//2. 관리자 주문 상태 변경
	@RequestMapping("adminShippingUpdate.do")
	public String updateOrderState(@RequestParam String order_id, HttpSession session) {
		System.out.println(order_id);
		adminShippingService.updateOrderState(order_id);
		
		return "redirect:adminShippingView.do";
	}
}
