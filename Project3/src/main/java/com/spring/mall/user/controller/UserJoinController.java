package com.spring.mall.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.mall.user.service.UserJoinService;
import com.spring.mall.user.service.UserLoginService;
import com.spring.mall.user.vo.UserVO;

@Controller
@SessionAttributes("joinUser")
public class UserJoinController {

	@Autowired
	private UserJoinService userJoinService;
	
	@Autowired
	private UserLoginService userLoginService;
	
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
	public String secession(Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.getAttribute("user");
		//model.addAttribute("user_id", user_id);
		return "common/secession";
	}
	
	//회원탈퇴
	@RequestMapping(value="secessionProc.do")
	public String secessionProc(UserVO vo,HttpSession session, Model model, String passwdCheck) {
		String location = "";
		String msg = "";
		//System.out.println("vo : " + vo);
		System.out.println("passwdCheck : " + passwdCheck);
		System.out.println("user_pw : " + vo.getUser_pw());
		
		String correctPW = userJoinService.userPWCheck(vo);
		String user_pw = vo.getUser_pw();
		
		System.out.println("correctPW : " + correctPW);
		
		
		if(user_pw.equals(correctPW) && user_pw.equals(passwdCheck)) {
			userJoinService.secession(vo,session);
			location = "user/secessionOK";
		}else{
			msg = "비밀번호가 틀렸습니다. 다시 확인해 주세요.";
			model.addAttribute("msg", msg);
			location = "common/secession";
		}
		
		return location;
	}
		
	//패스워드 체크
	@RequestMapping(value="passCheck.do", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String passCheck(UserVO vo) {
		
		int result = userJoinService.passCheck(vo);
		return Integer.toString(result);
	}
	
	//회원 정보 수정
	@RequestMapping("/updateAction.do")
	public String updateInfo(HttpServletRequest request, UserVO vo, String user_phone1, String user_phone2, String user_phone3) {
		String user_phone = user_phone1 + user_phone2 + user_phone3;
		vo.setUser_phone(user_phone);
		
		System.out.println("회원정보 수정 vo : " + vo);
		userJoinService.updateInfo(vo);
		
		UserVO user = userLoginService.getUser(vo);
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		
		return "user/updateOK";
	}
}
