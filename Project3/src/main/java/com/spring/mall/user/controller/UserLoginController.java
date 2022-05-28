package com.spring.mall.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.mall.user.service.UserLoginService;
import com.spring.mall.user.vo.UserVO;

@Controller
public class UserLoginController {
	@Autowired
	private UserLoginService userLoginService;
	
	public UserLoginController() {
		System.out.println(":::: UserLoginController() 객체 생성");
	}

	@GetMapping("/login.do")
	public String loginView() {
		System.out.println(">>로그인 화면 이동 - loginView()");
		
		return "common/login";
	}
	
	@PostMapping("/loginAction.do")
	public String loginAction(UserVO vo) {
		System.out.println(">>> 로그인 처리 - loginAction()");
		System.out.println("vo : " + vo);
		
		UserVO user = userLoginService.getUser(vo);
		System.out.println("user : " + user);
		
		return "store/main";
	}
}
