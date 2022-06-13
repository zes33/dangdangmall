package com.spring.mall.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.mall.order.service.AdminShippingService;
import com.spring.mall.order.vo.UserOrderVO;
import com.spring.mall.paging.vo.PagingVO;
import com.spring.mall.pay.vo.RefundTotalVO;
import com.spring.mall.sales.service.SalesHistoryService;

@Controller
@RequestMapping("/adminShipping/**")
public class AdminShippingController {

	@Autowired
	private AdminShippingService adminShippingService;
	@Autowired
	private SalesHistoryService salesHistoryService;

	public AdminShippingController() {
		System.out.println(">> AdminShippingController 생성");
	}

	// 1. 관리자 상품 주문 테이블 목록 불러오기
	@RequestMapping("adminShippingView.do")
	public String order(UserOrderVO uov, HttpSession session, PagingVO paging,Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		System.out.println(">> adminShippingView.do() 생성  -> adminShipping.jsp 이동 ");
		int total = salesHistoryService.cntHistoryAll();
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "20";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "20";
		}
		
		paging = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		String start = Integer.toString(paging.getStart());
		String end = Integer.toString(paging.getEnd());
		
		
		List<UserOrderVO> getOrderList = adminShippingService.getOrderList(start,end);
		session.setAttribute("getOrderList", getOrderList);
		model.addAttribute("paging",paging);
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
