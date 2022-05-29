package com.spring.mall.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.mall.user.service.UserJoinService;
import com.spring.mall.user.vo.UserVO;

@Controller
@SessionAttributes("joinUser")
public class UserJoinController {

	@Autowired
	private UserJoinService userJoinService;
	
	public UserJoinController() {
		System.out.println(">>UserJoinController() 객체 생성~");
	}
	
	@GetMapping("/join.do")
	public String joinView() {
		System.out.println(">>회원가입 페이지로 이동 -> joinView()");
		
		return "common/joinForm";
	}
	
	@RequestMapping("/joinAction.do")
	public String joinAction(UserVO vo, HttpServletRequest request) {
		System.out.println(">>회원가입 - joinAction()");
		
		userJoinService.insertUser(vo);
		
		HttpSession session = request.getSession();
		session.setAttribute("joinUser", vo);
		return "common/joinOK";
	}
}
