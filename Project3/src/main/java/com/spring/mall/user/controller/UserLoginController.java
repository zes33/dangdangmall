package com.spring.mall.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mall.product.vo.ProductVO;
import com.spring.mall.user.service.UserLoginService;
import com.spring.mall.user.vo.UserVO;

@Controller
@SessionAttributes("user")
public class UserLoginController {
	@Autowired
	private UserLoginService userLoginService;
	
	public UserLoginController() {
		System.out.println(":::: UserLoginController() 객체 생성");
	}

	@RequestMapping("/login.do")
	public String loginView(Model model) {
		System.out.println(">>로그인 화면 이동 - loginView()");
	
		return "common/login";
	}
	
	@PostMapping("/loginAction.do")
	public String loginAction(UserVO vo,HttpServletRequest request) {
		System.out.println(">>> 로그인 처리 - loginAction()");
		System.out.println("vo : " + vo);
		
		UserVO user = userLoginService.getUser(vo);
		HttpSession session = request.getSession();
		System.out.println(session.getId());
		String location = "";
		if(user == null || user.getUser_state() == 0) {
			System.out.println("존재하지 않는 아이디입니다. 다시 확인해주세요.");
			location = "common/login";
		}else if(user.getUser_state() == 2) {
			System.out.println("관리자 로그인 성공~");
			session.setAttribute("user", user); //user라는 이름으로 세션에 등록
			session.setAttribute("user_id", user.getUser_id());
			location = "admin/adminMain"; 
		}else{
			System.out.println("회원 로그인 성공~");
			session.setAttribute("user", user); //user라는 이름으로 세션에 등록
			session.setAttribute("user_id", user.getUser_id());
			System.out.println(session.getId());
			
			location = "redirect:/main.do";
		}
		return location;
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session, SessionStatus status) {
		
		System.out.println("로그아웃 처리");
		System.out.println(session.getId());
		status.setComplete();
		session.invalidate();
		
		return "redirect:/main.do";
	}
	
	@GetMapping("/findIdView.do")
	public String findIdView() {
		System.out.println(">>아이디찾기 화면 이동 - findIdView()");
		return "common/findIdForm";
	}
	
	@PostMapping("/findIdAction.do")
	public String findIdAction(UserVO vo, Model model) {
		System.out.println(">>아이디찾기  - findIdView()");
		UserVO getUser = userLoginService.gerId(vo);
		model.addAttribute("getUser", getUser);
		
		return "common/findIdOK";
	}
	
}
