package com.spring.mall.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.mall.order.service.MyOrderService;
import com.spring.mall.order.vo.UserOrderVO;
import com.spring.mall.user.vo.UserVO;

@Controller
@SessionAttributes("orderList")
public class MyOrderController {

	@Autowired
	private MyOrderService myOrderService;
	
	public MyOrderController() {
		System.out.println(">>MyOrderController() 객체 생성");
	}
	
	@RequestMapping("/myinfo.do")
	public String myInfoView(UserOrderVO vo, UserVO userVO, Model model) {
		System.out.println(">>내 주문 내역 보여주기");
		System.out.println("UserOrderVO vo : " + vo);
		
		vo.setUser_id(userVO.getUser_id()); 
		
		System.out.println("UserOrderVO vo id 세팅 후 : " + vo);
		List<UserOrderVO> orderList = myOrderService.getMyOrder(vo);
		System.out.println("orderList.toString() : " +orderList.toString());
		model.addAttribute("orderList", orderList);
		
		return "user/myInfo";
	}
	
//	public String getOrderList(UserOrderVO vo) {
//		
//		
//		return "user/myInfo";
//	}
}
