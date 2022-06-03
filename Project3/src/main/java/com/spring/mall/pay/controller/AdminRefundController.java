package com.spring.mall.pay.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mall.pay.service.AdminRefundService;
import com.spring.mall.pay.vo.RefundTotalVO;

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
}
