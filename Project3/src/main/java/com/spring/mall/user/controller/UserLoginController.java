package com.spring.mall.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

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

	@GetMapping("/login.do")
	public String loginView() {
		System.out.println(">>로그인 화면 이동 - loginView()");
		
		return "common/login";
	}
	
	@PostMapping("/loginAction.do")
	public String loginAction(UserVO vo, HttpServletRequest request) {
		System.out.println(">>> 로그인 처리 - loginAction()");
		System.out.println("vo : " + vo);
		
		UserVO user = userLoginService.getUser(vo);
		HttpSession session = request.getSession();
		
		if(user == null || user.getUser_state() == 0) {
			System.out.println("존재하지 않는 아이디입니다. 다시 확인해주세요.");
			return "common/login";
		}else if(user.getUser_state() == 2) {
			System.out.println("관리자 로그인 성공~");
			return "admin/main"; 
		}else{
			System.out.println("회원 로그인 성공~");
			session.setAttribute("user", user); //user라는 이름으로 세션에 등록
			session.setAttribute("user_id", user.getUser_id());
			return "store/mainLoginOK"; 
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		
		System.out.println("로그아웃 처리");
		session.invalidate();
		
		return "store/main";
	}
	
	@GetMapping("/findIdView.do")
	public String findIdView() {
		System.out.println(">>아이디찾기 화면 이동 - findIdView()");
		return "common/findIdForm";
	}
	
	@PostMapping("/findId.do")
	public String findIdAction(UserVO vo) {
		
		return "common/findIdOK";
	}
	
//	@PostMapping("/findIdAction.do")
//	public String findId(UserVO vo,Model model) throws Exception{
//				
//		if(memberService.findIdCheck(memberVO.getMemberEmail())==0) {
//		model.addAttribute("msg", "이메일을 확인해주세요");
//		return "/member/findIdView";
//		}else {
//		model.addAttribute("member", memberService.findId(memberVO.getMemberEmail()));
//		return
//				"/member/findId";
//		}
//	}
	
}
