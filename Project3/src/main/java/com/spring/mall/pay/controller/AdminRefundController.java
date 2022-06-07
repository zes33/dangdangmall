package com.spring.mall.pay.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.mall.order.vo.UserOrderVO;
import com.spring.mall.pay.service.AdminRefundService;
import com.spring.mall.pay.vo.RefundTotalVO;
import com.spring.mall.user.vo.UserOrderPointVO;

@Controller
@RequestMapping("/adminRefund/**")
public class AdminRefundController {

	@Autowired
	private AdminRefundService adminRefundService;

	public AdminRefundController() {
		System.out.println(">> AdminRefundController 객체 생성 ");
	}
	
	//1. 관리자 페이지 환불 요청 리스트
	@GetMapping("/adminRefundView.do")
	public String refundList(RefundTotalVO vo, Model model, HttpSession session ) {
		List<RefundTotalVO> refundList = adminRefundService.refundList(vo);
		session.setAttribute("refundList", refundList);
		
		return "admin/adminRefund";
	}
	
	//2. 환불 상태 변경
	@RequestMapping("update.do")
	public String updateStatus(@RequestParam int[] refund_id, @RequestParam int[] refund_status, UserOrderPointVO point, Model model, HttpSession session) {
		//session.getAttribute("refundList");
		for (int i = 0; i < refund_id.length; i++) {
			RefundTotalVO vo = new RefundTotalVO();
			vo.setRefund_id(refund_id[i]);
			vo.setRefund_status(refund_status[i]);
			adminRefundService.updateStatus(vo);
		}
		
		
		
		return "redirect:adminRefundView.do";
	}
	
	//3. 포인트 취소 
	@RequestMapping("delete.do")
	public String deletePoint(@RequestParam String user_id, @RequestParam String order_id,@RequestParam int order_total,UserOrderPointVO point, Model model, HttpSession session) {
		
		//1. 포인트 적립 취소 
//				user_id = (String) session.getAttribute("user_id");
//				order_id = (String) session.getAttribute("orderInfo.order_id");
				System.out.println(user_id +" : "+ order_id);
				
				
				point.setUser_id(user_id);
				point.setOrder_id(order_id);
				point.setOrder_total(order_total);
				adminRefundService.deletePoint(point);
		return "redirect:adminRefundView.do";
	}
	
	
}
