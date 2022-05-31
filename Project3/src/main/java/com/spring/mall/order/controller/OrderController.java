package com.spring.mall.order.controller;

import java.text.DecimalFormat;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.mall.cart.service.CartService;
import com.spring.mall.order.service.OrderService;
import com.spring.mall.order.vo.UserOrderDetailVO;
import com.spring.mall.order.vo.UserOrderVO;
import com.spring.mall.user.vo.UserVO;

@Controller
@RequestMapping("/order/**")
public class OrderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private CartService cartService;

	public OrderController() {
		System.out.println(">> OrderController() 객체 생성 ");
	}

	@GetMapping("orderView.do")
	public String order() {
		System.out.println(">> orderView.do() 생성  -> order.jsp 이동 ");
		return "store/order";

	}

	// 1. 주문 정보 입력
	@RequestMapping("order.do")
	public String order(HttpSession session, UserOrderVO order, UserOrderDetailVO orderDetail) throws Exception {
		// logger.info("order");

		
		String user_id = (String) session.getAttribute("user_id");

		//주문 정보 저장 
		// 주문 아이디 저장 방식 
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}

		String order_id = ymd + "_" + subNum;
		order.setOrder_id(order_id);
		order.setUser_id(user_id);
		orderService.insertOrder(order);

		// 상세정보 바구니로 저장
		orderDetail.setOrder_id(order_id);
		orderService.insertOrderDetail(orderDetail);

		// 결제 칸으로 넘어가면 장바구니 정보 삭제
		orderService.cartAllDelete(user_id);

		return "redirect:/main.do";
	}
}
