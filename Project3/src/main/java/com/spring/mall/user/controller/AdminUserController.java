package com.spring.mall.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mall.product.service.ProductService;
import com.spring.mall.product.vo.ProductVO;
import com.spring.mall.user.service.AdminUserService;

@Controller
@RequestMapping("/admin/**")
public class AdminUserController {
	
	@Autowired
	private AdminUserService adminUserService;
	
	public AdminUserController() {
		System.out.println(">> AdminController() 객체 생성~~");
	}
	
	@GetMapping("adminUserList.do")
	public String adminUserList() {
		System.out.println("관리자 회원목록(userList.jsp 이동 - adminUserList()");
		return "admin/userList";
	}
	
}
