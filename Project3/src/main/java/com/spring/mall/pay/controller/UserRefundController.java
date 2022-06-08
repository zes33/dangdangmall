package com.spring.mall.pay.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mall.order.service.MyOrderService;
import com.spring.mall.pay.service.UserRefundService;
import com.spring.mall.pay.vo.UserOrderRefundVO;
import com.spring.mall.user.vo.MyInfoVO;
import com.spring.mall.user.vo.UserVO;

@Controller
public class UserRefundController {

	@Autowired
	private UserRefundService userRefundService;
	
	@Autowired
	private MyOrderService myOrderService;
	
	
	public UserRefundController() {
		System.out.println("UserRefundController() 객체 생성");
	}
	
	@GetMapping("/refundForm.do")
	public String refundView(MyInfoVO vo, HttpSession session, Model model) {
		System.out.println("refundView() 실행~");
		UserVO user = (UserVO) session.getAttribute("user");
		String user_id = (String) session.getAttribute("user_id");
		
		System.out.println("MyInfoVO vo : " + vo);
		
		System.out.println("user : " + user);
		System.out.println("user_id : " + user_id);
		vo.setUser_id(user_id);
		MyInfoVO oneOrder = userRefundService.getOrderOne(vo);
		model.addAttribute("oneOrder", oneOrder);
		return "user/refundForm";
	}
	
	
	@RequestMapping("/refundAction.do")
	public String refundAction(UserOrderRefundVO vo, String refund_reason, int order_detail_id, double refund_total) {
		System.out.println("refund_reason : " + refund_reason);
		System.out.println("order_detail_id : " + order_detail_id);
		System.out.println("refund_total : " + refund_total);
		
		vo.setRefund_reason(refund_reason);
		vo.setOrder_detail_id(order_detail_id);
		vo.setRefund_total(refund_total);
		
		userRefundService.insertRefund(vo);
		
		return "user/receiptOK";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
