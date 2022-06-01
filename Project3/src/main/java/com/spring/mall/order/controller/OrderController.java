package com.spring.mall.order.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

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
import com.spring.mall.pay.vo.PaymentVO;
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
	public String order(HttpSession session, Model model, UserOrderVO order, UserOrderDetailVO orderDetail, PaymentVO pvo)
			throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");
		String user_id = user.getUser_id();
		session.getAttribute("map");

		// 주문 정보 저장
		// 주문 아이디 저장 방식
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}

		String order_id = ymd + "-" + subNum;
		order.setOrder_id(order_id);
		order.setUser_id(user_id);
		orderService.insertOrder(order);

		// 상세정보 바구니로 저장
		orderDetail.setOrder_id(order_id);
		orderService.insertOrderDetail(orderDetail);
		session.setAttribute("user", user);

		// 결제 칸으로 넘어가면 장바구니 정보 삭제
		orderService.cartAllDelete(user_id);
		System.out.println("vo : " + order);

		// 결제창에서 쓰일 최근 주문 정보 가져오기
		Map<String, String> orderMap = new HashMap<String, String>();
		orderMap.put("user_id", user_id);
		orderMap.put("order_id", order_id);
		
		UserOrderVO orderInfo = new UserOrderVO();
		orderInfo =  orderService.getOrder(user_id,order_id);
		session.setAttribute("orderInfo", orderInfo);
		
		// 2. 결제 완료 후, 결제 테이블에 정보 삽입
		pvo.setOrder_id(order_id);
		orderService.insertPayment(pvo);
		session.setAttribute("payment", pvo);
		
		return "store/shipping";
	}

	@RequestMapping("pay.do")
	public String pay(HttpSession session, Model model)
			throws Exception {
		session.getAttribute("payment");
		session.getAttribute("orderInfo");
		return "store/afterPay";
	}


}
