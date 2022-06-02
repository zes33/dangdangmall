package com.spring.mall.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String joinAction(UserVO vo, HttpServletRequest request, String user_phone1, String user_phone2, String user_phone3) {
		System.out.println(">>회원가입 - joinAction()");
		
		String user_phone = user_phone1 + user_phone2 + user_phone3;
		vo.setUser_phone(user_phone);
		System.out.println("user_phone : " + user_phone);
		userJoinService.insertUser(vo);
		
		HttpSession session = request.getSession();
		session.setAttribute("joinUser", vo);
		return "common/joinOK";
	}
	
	@RequestMapping(value = "/idCheck.do",method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		
		String user_id = request.getParameter("user_id");
		int result=userJoinService.idCheck(user_id);
		return Integer.toString(result);
	}
	
	//회원탈퇴 페이지
	@RequestMapping(value="secession.do")
	public String secession() {
		return "common/secession";
	}
	
	//회원탈퇴
	@RequestMapping(value="secessionProc.do")
	public String secessionProc(UserVO vo,HttpSession session) {
		
		userJoinService.secession(vo,session);
		
		return "common/login";
	}
		
	//패스워드 체크
	@RequestMapping(value="passCheck.do", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String passCheck(UserVO vo) {
		
		int result = userJoinService.passCheck(vo);
		return Integer.toString(result);
	}
}
