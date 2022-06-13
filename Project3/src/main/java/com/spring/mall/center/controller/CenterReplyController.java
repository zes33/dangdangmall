package com.spring.mall.center.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.mall.center.service.CenterQnaService;
import com.spring.mall.center.service.CenterReplyService;
import com.spring.mall.center.vo.CenterQnaVO;
import com.spring.mall.center.vo.CenterReplyVO;
import com.spring.mall.paging.service.CenterPagingService;
import com.spring.mall.paging.vo.PagingVO;
import com.spring.mall.user.vo.UserVO;

@Controller
@RequestMapping("/admin/**")
public class CenterReplyController {
	@Autowired
	private CenterQnaService centerQnaService;
	@Autowired
	private CenterReplyService centerReplyService;
	
	@Autowired
	private CenterPagingService centerPagingService;
	
	public CenterReplyController() {
		System.out.println("▶▶▶ AdminCenterController() 객체 생성~~");
	}
	
	@ModelAttribute("conditionMap")
	public Map<String, Object> searchConditionMap() {
		System.out.println("=====> Map searchConditionMap() 실행");
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("제목", "TITLE");
		return conditionMap;
	}
	
	//▶▶관리자 고객문의 상세 페이지로 이동
	@RequestMapping("/adminCenter.do")
	public String adminCenter(CenterQnaVO vo, Model model, HttpSession session) {
		Map<String, Object> getCenter = centerQnaService.getCenterQna(vo);
		model.addAttribute("getCenter", getCenter);
		System.out.println(getCenter);
		
		System.out.println("고객 문의 상세페이지(centerOne.jsp)이동 - adminCenter()");
		return "admin/centerOne";
	}
	
	//▶▶관리자 답글 등록
	@RequestMapping("/adminReplyInsert.do")
	public String adminReplyInsert(CenterQnaVO vo, CenterReplyVO rvo, Model model, int center_qna_id) throws IllegalArgumentException, IOException {
		System.out.println("▶▶ adminReplyInsert(관리자 답글등록) 실행~ ");
		System.out.println("center_qna_id: " + center_qna_id);
		model.addAttribute("center_qna_id", center_qna_id);
		
		System.out.println("insert할  rvo : " + rvo);
		centerReplyService.insertCenterReply(rvo);
		
		Map<String, Object> getCenter = centerQnaService.getCenterQna(vo);
		model.addAttribute("getCenter", getCenter);
		System.out.println(getCenter);
		
		System.out.println("▶▶고객 문의 상세페이지(centerOne.jsp)이동 - adminReplyInsert()");
		return "redirect:adminCenter.do";
	}
	
	//▶▶관리자 고객 문의 삭제
	@RequestMapping("/adminCenterdelete.do")
	public String adminCenterdelete(CenterQnaVO vo, CenterReplyVO rvo) {
		System.out.println("▶▶ delete 할 rvo : " + rvo);
		System.out.println("▶▶ delete 할 vo : " + vo);
		if (centerReplyService.getCenterReply(rvo).getCenter_reply_id() != 0) {
			centerReplyService.deleteCenterReply(rvo);
		}
		centerQnaService.deleteCenterQna(vo);
		System.out.println("▶▶관리자 고객문의 목록 페이징+검색(centerList.jsp)이동 - adminCenterdelete()");
		return "redirect:centerList.do";
	}
	
	//▶▶관리자 답글 삭제
	@RequestMapping("/adminReplyDelete.do")
	public String adminReplyDelete(CenterQnaVO vo, CenterReplyVO rvo, int center_qna_id, Model model) {
		System.out.println("▶▶ delete 할 rvo : " + rvo);
		centerReplyService.deleteCenterReply(rvo);
		
		Map<String, Object> getCenter = centerQnaService.getCenterQna(vo);
		model.addAttribute("getCenter", getCenter);
		System.out.println("getCenter: " + getCenter);
		
		System.out.println("▶▶고객 문의 상세페이지(centerOne.jsp)이동 - adminReplyDelete()");
		return "redirect:adminCenter.do?center_qna_id=" + center_qna_id;
	}
	
	//▶▶관리자 답글 수정 페이지로 이동
	@RequestMapping("/adminReplyUpdateGo.do")
	public String adminReplyUpdateGo(CenterQnaVO vo, Model model, int center_qna_id) {
		System.out.println("▶▶!!!관리자 답글 수정 페이지로 이동하는 쩜두");
		System.out.println("center_qna_id: " + center_qna_id);
		model.addAttribute("center_qna_id", center_qna_id);
		
		Map<String, Object> getCenter = centerQnaService.getCenterQna(vo);
		System.out.println("getCenter: " + getCenter);
		model.addAttribute("getCenter", getCenter);
		
		System.out.println("▶▶관리자 답글 수정 페이지로 이동(centerReplyUpdate.jsp) - adminReplyUpdateGo()");
		return "admin/centerReplyUpdate";
	}
	
	//▶▶관리자 답글 수정
	@RequestMapping("/adminReplyUpdate.do")
	public String adminReplyUpdate(CenterQnaVO vo, CenterReplyVO rvo, Model model, int center_qna_id) throws IllegalArgumentException, IOException {
		System.out.println("▶▶adminReplyUpdate(관리자 답글수정) 쩜두 실행~ ");
		System.out.println("center_qna_id: " + center_qna_id);
		model.addAttribute("center_qna_id", center_qna_id);
		
		System.out.println("update할  rvo : " + rvo);
		centerReplyService.updateCenterReply(rvo);
		
		Map<String, Object> getCenter = centerQnaService.getCenterQna(vo);
		model.addAttribute("getCenter", getCenter);
		System.out.println("getCenter: " + getCenter);
		
		System.out.println("▶▶고객 문의 상세페이지(centerOne.jsp)이동 - adminReplyUpdate()");
		return "redirect:adminCenter.do";
	}
	
	//▶▶관리자 고객문의 목록 페이징+검색
	@RequestMapping("/centerList.do")
	public String adminCenterList(PagingVO paging, Model model
			, String searchCondition, String searchKeyword
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		System.out.println("▶▶adminCenterList() 실행!!");
		
		System.out.println("searchCondition : " + searchCondition);
		System.out.println("searchKeyword : " + searchKeyword);
		
		int total = centerPagingService.TotalCenterQnaPerPageSearch(searchCondition, searchKeyword);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		
		paging = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println("paging.getStart(): " + paging.getStart());
		System.out.println("paging.getEnd() : " +  paging.getEnd());
		List<Map<String, Object>> centerList = centerPagingService.CenterQnaPerPageSearch(searchCondition, searchKeyword, paging.getStart(), paging.getEnd());
		
		System.out.println("total: " + total);
		model.addAttribute("paging", paging);
		model.addAttribute("centerList", centerList);
		System.out.println(centerList);
		System.out.println("▶▶고객 문의 목록 페이징처리(adminCenterList.jsp)이동 - adminCenterList()");
		return "admin/centerList";
	}
}
