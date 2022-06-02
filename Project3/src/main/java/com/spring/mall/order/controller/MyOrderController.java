package com.spring.mall.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mall.order.service.MyOrderService;
import com.spring.mall.user.vo.MyInfoVO;
import com.spring.mall.user.vo.UserVO;

@Controller
//@SessionAttributes("orderList")
public class MyOrderController {

	@Autowired
	private MyOrderService myOrderService;
	
	public MyOrderController() {
		System.out.println(">>MyOrderController() 객체 생성");
	}
	
	@RequestMapping("/myinfo.do")
	public String myInfoView(MyInfoVO vo, Model model, HttpSession session) {
		System.out.println(">>내 주문 내역 보여주기");
		System.out.println("MyInfoVO vo : " + vo);
		
		String user_id = (String) session.getAttribute("user_id");
		
		System.out.println("user_id : "+user_id);
		vo.setUser_id(user_id);
		List<MyInfoVO> orderList = myOrderService.getMyOrder(user_id);
		model.addAttribute("orderList", orderList);
		System.out.println("orderList : " + orderList.toString());
		return "user/myInfo";
	}
	
	@RequestMapping("/myprivateinfo.do")
	public String myPrivateInfoView(MyInfoVO vo, Model model, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		UserVO user = (UserVO) session.getAttribute("user");
		vo.setUser_id(user_id);
		List<MyInfoVO> orderList = myOrderService.getMyOrder(user_id);
		model.addAttribute("orderList", orderList);
		model.addAttribute("user_id", user_id);
		model.addAttribute("user", user);
		
		return "common/userConfirm";
	}
	
	@RequestMapping("/pwConfirm.do")
	public String myPrivate(UserVO vo, Model model, HttpSession session, String pwCheck) {
		System.out.println(">>내 정보 보기");
		UserVO user = (UserVO) session.getAttribute("user");
		
		model.addAttribute("user", user);
		vo.setUser_pw(pwCheck);
		
		String pw = myOrderService.getPW(vo);
		System.out.println("pw : " + pw);
		return "user/myPrivateInfo";
	}

}
