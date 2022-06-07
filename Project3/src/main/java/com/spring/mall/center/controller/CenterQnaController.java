package com.spring.mall.center.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mall.center.service.CenterQnaService;
import com.spring.mall.center.service.CenterReplyService;
import com.spring.mall.center.vo.CenterQnaVO;
import com.spring.mall.center.vo.CenterReplyVO;
import com.spring.mall.user.vo.UserVO;

@Controller
@RequestMapping("/user/**")
public class CenterQnaController {
	@Autowired
	private CenterQnaService centerQnaService;
	@Autowired
	private CenterReplyService centerReplyService;
	
	
	public CenterQnaController() {
		System.out.println("======= CenterQnaController() 객체 생성~~");
	}
	
	@RequestMapping("/getCenterList.do")
	public String getCenterList(Model model) {
		CenterQnaVO vo = null;
		List<Map<String, Object>> getCenterList = centerQnaService.getCenterQnaList(vo);
		model.addAttribute("getCenterList", getCenterList);
		System.out.println(getCenterList);
		System.out.println("고객 문의 목록 페이지(getCenterList.jsp)이동 - getCenterList()");
		return "user/getCenterList";
	}
	
	@RequestMapping("/getCenterQna.do")
	public String getCenterQna(CenterQnaVO vo, Model model, HttpSession session) {
		Map<String, Object> getCenter = centerQnaService.getCenterQna(vo);
		model.addAttribute("getCenter", getCenter);
		System.out.println(getCenter);
		
		UserVO centerUser = (UserVO) session.getAttribute("user");
		model.addAttribute("centerUser", centerUser);
		System.out.println(centerUser);
		
		System.out.println("고객 문의 상세페이지(getCenter.jsp)이동 - getCenterqna()");
		return "user/getCenter";
	}
	
	@RequestMapping("/insertCenterQna.do")
	public String insertCenterQna() {
		System.out.println(">>> 고객 문의 작성 페이지로 이동(insertCenter.jsp) - insertCenterQna()");
		return "user/insertCenter";
	}
	
	@RequestMapping("/insertCenterQnaWrite.do")
	public String insertCenterQnaWrite(CenterQnaVO vo, HttpSession session) throws IllegalArgumentException, IOException {
		System.out.println(">>> 고객문의 입력");
		String user_id = (String) session.getAttribute("user_id");
		System.out.println("user_id : " + user_id);
		vo.setUser_id(user_id);
		System.out.println("insert vo : " + vo);
		centerQnaService.insertCenterQna(vo);
		System.out.println(">>> 고객 문의 목록 페이지로 이동(getCenterList.do)이동 - insertCenterQnaWrite()");
		return "redirect:getCenterList.do";
	}
	
	@RequestMapping("/deleteCenterQna.do")
	public String deleteCenterQna(CenterQnaVO vo, CenterReplyVO rvo) {
		
		System.out.println(">> delete 할 rvo : " + rvo);
		System.out.println(">> delete 할 vo : " + vo);
		if (rvo.getCenter_reply_id() != 0) {
			centerReplyService.deleteCenterReply(rvo);
		}
		centerQnaService.deleteCenterQna(vo);
		System.out.println("고객 문의 목록 페이지(getCenterList.jsp)이동 - getCenterList()");
		return "redirect:getCenterList.do";
	}
	
	@RequestMapping("/updateCenterQna.do")
	public String updateCenterQna(CenterQnaVO vo, Model model) {
		Map<String, Object> getCenter = centerQnaService.getCenterQna(vo);
		model.addAttribute("getCenter", getCenter);
		System.out.println("getCenter: " + getCenter);
		System.out.println(">>> 고객 문의 수정 페이지로 이동(updateCenter.jsp) - updateCenterQna()");
		return "user/updateCenter";
	}
	
	@RequestMapping("/updateCenterQnaWrite.do")
	public String updateCenterQnaWrite(CenterQnaVO vo, Model model) {
		System.out.println("updateCenterQnaWrite 쩜두 실행~ ");
		Map<String, Object> getCenter = centerQnaService.getCenterQna(vo);
		model.addAttribute("getCenter", getCenter);
		System.out.println("getCenter: " + getCenter);
		
		System.out.println(">> update 할 vo : " + vo);
		String center_qna_id = Integer.toString(vo.getCenter_qna_id());
		centerQnaService.updateCenterQna(vo);
		System.out.println("고객 문의 상세페이지(getCenter.jsp)이동 - updateCenterQnaWrite()");
		return "redirect:getCenterQna.do?center_qna_id="+center_qna_id;
	}
	
	
	
	@RequestMapping("/getCenterListPaging.do")
	public String getCenterListPaging(Model model) {
		CenterQnaVO vo = null;
		List<Map<String, Object>> getCenterListPaging = centerQnaService.getCenterQnaList(vo);
		model.addAttribute("getCenterListPaging", getCenterListPaging);
		System.out.println(getCenterListPaging);
		System.out.println("고객 문의 목록 페이지(getCenterListPaging.jsp)이동 - getCenterListPaging()");
		return "user/getCenterListPaging";
	}
	
	
}
