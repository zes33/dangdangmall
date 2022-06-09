package com.spring.mall.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.mall.product.service.ProductService;
import com.spring.mall.product.vo.ProductVO;
import com.spring.mall.user.service.AdminUserService;
import com.spring.mall.user.vo.UserVO;

@Controller
@RequestMapping("/admin/**")
public class AdminUserController {

	@Autowired
	private AdminUserService adminUserService;

	public AdminUserController() {
		System.out.println(">> AdminController() 객체 생성~~");
	}

	// 관리자 메인 홈페이지 연결
	@GetMapping("adminMain.do")
	public String adminMain() {
		return "admin/adminMain";
	}

	// 1.관리자 회원목록 출력
	@GetMapping("/adminUserList.do")
	public String adminUserList(UserVO vo, HttpSession session) {
		System.out.println("관리자 회원목록(userList.jsp 이동 - adminUserList()");
		List<UserVO> AdminusersList = adminUserService.AdminUserList(vo);
		session.setAttribute("AdminusersList", AdminusersList);

		return "admin/userList";
	}

	// 2. 관리자 회원 상세목록 출력
	@GetMapping("adminUser.do")
	public String adminUser(UserVO vo, HttpSession session, Model model) {
		UserVO userA =  adminUserService.selectUser(vo);
		model.addAttribute("userA",userA);
//		session.setAttribute("userA", userA);
		 System.out.println(vo);
		System.out.println("관리자 회원상세페이지(user.jsp 이동 - adminUser()");
		return "admin/user";
	}

	// 3. 관리자 회원상태 휴먼회원으로 변경(0)
	@GetMapping("deleteUser.do")
	public String deleteUser(@RequestParam String user_id, UserVO vo) {
		vo.setUser_id(user_id);
		adminUserService.deleteUser(vo);
		System.out.println(vo);
		return "redirect:adminUserList.do";
	}

}
