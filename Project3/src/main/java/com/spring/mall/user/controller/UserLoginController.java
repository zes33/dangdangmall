package com.spring.mall.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.w3c.dom.ls.LSOutput;

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
	public String loginView(Model model, HttpServletRequest request, HttpSession session) {
		System.out.println(">>로그인 화면 이동 - loginView()");
		String referer = request.getHeader("Referer");
		System.out.println(referer);
		request.getSession().setAttribute("redirectURI", referer);
		session.setAttribute("referer", referer);

//		System.out.println(product_id);

		return "common/login";
	}

//	@RequestMapping("/loginbefore.do")
//	public String loginGET(HttpServletRequest request,HttpSession session) {
//		String referer = request.getHeader("Referer");
//		request.getSession().setAttribute("redirectURI", referer);
//		session.setAttribute("referer", referer);

//		
//		return "loginAction.do";
//	}

	@PostMapping("/loginAction.do")
	public String loginAction(UserVO vo, HttpSession session, HttpServletRequest request, Model model, String user_id,
			String user_pw) {
		System.out.println(">>> 로그인 처리 - loginAction()");
		System.out.println("vo : " + vo);

		// 0. 로그인 후 이전페이지로 돌아가기위한 설정
		// 이전 페이지 정보 가져오기
		String refer = (String) session.getAttribute("referer");

		System.out.println(refer);
		String before = refer.substring(27);
		System.out.println(before);

		UserVO user = userLoginService.getUser(vo);
		session = request.getSession();
		System.out.println(session.getId());
		String location = "";
		String msg = "";
		System.out.println("user_id : " + user_id);
		System.out.println("user_pw : " + user_pw);

		if (user == null || user.getUser_state() == 0) {
			model.addAttribute("msg", "존재하지 않는 아이디입니다. 다시 확인해주세요.");
			location = "common/login";
		} else if (user.getUser_state() == 2) {
			session.setAttribute("user", user); // user라는 이름으로 세션에 등록
			session.setAttribute("user_id", user.getUser_id());
			location = "redirect:/admin/adminMain.do";
		} else {
			System.out.println("회원 로그인 성공~");
			session.setAttribute("user", user); // user라는 이름으로 세션에 등록
			session.setAttribute("user_id", user.getUser_id());
			System.out.println(session.getId());

			if (before.equals("joinAction.do")) {
				location = "redirect:/main.do";
			} else if (before.equals("findIdView.do")) {
				location = "redirect:/main.do";
			} else {
//		location = "redirect:/main.do";
				location = "redirect:/" + before;
			}
//			location = before;
			// location = "common/back";
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

	@RequestMapping("/findIdAction.do")
	public String findIdAction(UserVO vo, HttpSession session, Model model, String user_email, String user_phone1,
			String user_phone2, String user_phone3) {
		System.out.println(">>아이디찾기  - findIdView()");
		String msg = "";
		String user_phone = user_phone1 + user_phone2 + user_phone3;

		vo.setUser_email(user_email);
		vo.setUser_phone(user_phone);
		UserVO getUser = userLoginService.gerId(vo);
		System.out.println("getUser : " + getUser);
		model.addAttribute("getUser", getUser);
		// 이전 페이지 정보 가져오기
		String refer = (String) session.getAttribute("referer");

		System.out.println(refer);
		String before = refer.substring(27);
		System.out.println(before);
		if (getUser == null) {
			if (before.equals("findIdAction.do")) {
				return "redirect:/main.do";
			} else {
				model.addAttribute("msg", "가입된 정보가 없습니다. 다시 확인해 주세요.");
				return "common/findIdFail";
			}
		} else {
			return "common/findIdOK";
		}
	}

	@GetMapping("/findPwdView.do")
	public String findPwdView() {

		return "common/findPwdForm";
	}

	@RequestMapping("/findPwdAction.do")
	public String findPwdAction(UserVO vo, HttpSession session, Model model, String user_id, String user_email) {
		System.out.println(">>비밀번호 찾기  - findPwdAction()");
		vo.setUser_id(user_id);
		vo.setUser_email(user_email);
		UserVO getUser = userLoginService.getPwd(vo);
		System.out.println("getUser : " + getUser);
		model.addAttribute("getUser", getUser);
		// 이전 페이지 정보 가져오기
		String refer = (String) session.getAttribute("referer");

		System.out.println(refer);
		String before = refer.substring(27);
		System.out.println(before);
		if (getUser == null) {
			if (before.equals("findPwdAction.do")) {
				return "redirect:/main.do";
			} else {
				model.addAttribute("msg", "가입된 정보가 없습니다. 다시 확인해 주세요.");
				return "common/findPwdFail";
			}
		} else {

			return "common/findPwdOK";
		}
	}

}
