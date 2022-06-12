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
public class AdminCenterController {
	@Autowired
	private CenterQnaService centerQnaService;
	@Autowired
	private CenterReplyService centerReplyService;
	
	@Autowired
	private CenterPagingService centerPagingService;
	
	public AdminCenterController() {
		System.out.println("▶▶▶ AdminCenterController() 객체 생성~~");
	}
	
	// 메소드에 선언된 @ModelAttribute 는 리턴된 데이터를 View 에 전달
	// @ModelAttribute 선언된 메소드는 @RequestMapping 메소드보다 먼저 실행
	// 뷰에 전달될 때 설정된 명칭(예: conditionMap)
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
		
//		UserVO centerUser = (UserVO) session.getAttribute("user");
//		model.addAttribute("centerUser", centerUser);
//		System.out.println(centerUser);
		
		System.out.println("고객 문의 상세페이지(centerOne.jsp)이동 - adminCenter()");
		return "admin/centerOne";
	}
	
//	//▶▶관리자 답글 등록 페이지로 이동
//	@RequestMapping("/adminReplyInsertGo.do")
//	public String adminReplyInsertGo(int center_qna_id, Model model) {
//		System.out.println("center_qna_id: " + center_qna_id);
//		model.addAttribute("center_qna_id", center_qna_id);
//		System.out.println("▶▶ 관리자 답글 등록 페이지로 이동(adminReplyInsert.jsp) - adminReplyInsertGo()");
//		return "redirect:adminReplyInsert.do";
//	}
	
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
	
	//고객문의 삭제
	@RequestMapping("/deleteCenterQna.do")
	public String deleteCenterQna(CenterQnaVO vo, CenterReplyVO rvo) {
		
		System.out.println(">> delete 할 rvo : " + rvo);
		System.out.println(">> delete 할 vo : " + vo);
		if (rvo.getCenter_reply_id() != 0) {
			centerReplyService.deleteCenterReply(rvo);
		}
		centerQnaService.deleteCenterQna(vo);
		System.out.println("고객 문의 목록 페이지(getCenterListPaging.jsp)이동 - getCenterList()");
		return "redirect:getCenterListPaging.do";
	}
	
	//고객문의 수정 페이지로 이동
	@RequestMapping("/updateCenterQna.do")
	public String updateCenterQna(CenterQnaVO vo, Model model) {
		Map<String, Object> getCenter = centerQnaService.getCenterQna(vo);
		model.addAttribute("getCenter", getCenter);
		System.out.println("getCenter: " + getCenter);
		System.out.println(">>> 고객 문의 수정 페이지로 이동(updateCenter.jsp) - updateCenterQna()");
		return "user/updateCenter";
	}
	
	//고객문의 수정 페이지
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
	
//	//마이페이지에서 나의 문의목록 조회
//	@RequestMapping("/myCenterQna.do")
//	public String myCenterQna(CenterQnaVO cvo, Model model, HttpServletRequest request) {
//		System.out.println("== myCenterQna() 실행!!");
//		
//		HttpSession session = request.getSession();
//		String user_id = (String) session.getAttribute("user_id");
//		System.out.println("user_id : " + user_id);
//		
//		cvo.setUser_id(user_id);
//		System.out.println("cvo: " + cvo);
//		
//		List<Map<String, Object>> myCenterQna = centerQnaService.myCenterQna(cvo);
//		model.addAttribute("myCenterQna", myCenterQna);
//		System.out.println("myCenterQna: " + myCenterQna);
//		System.out.println("== 나의 문의목록(myCenterQna.jsp)이동 - myCenterQna()");
//		return "user/myCenterQna";
//	}
//	
//	//마이페이지 문의목록 1개 조회
//	@RequestMapping("/myCenter.do")
//	public String myCenter(CenterQnaVO vo, Model model, HttpSession session) {
//		System.out.println("== myCenter() 실행!!");
//		
//		String user_id = (String) session.getAttribute("user_id");
//		vo.setUser_id(user_id);
//		System.out.println("vo: " + vo);
//		
//		Map<String, Object> myCenter = centerQnaService.myCenter(vo);
//		System.out.println(myCenter);
//		model.addAttribute("myCenter", myCenter);
//		
//		
//		UserVO centerUser = (UserVO) session.getAttribute("user");
//		model.addAttribute("centerUser", centerUser);
//		System.out.println(centerUser);
//		
//		System.out.println("== 나의 문의 1개 조회하는 페이지로(myCenter.jsp)이동 - myCenter()");
//		return "user/myCenter";
//	}
//	
//	
	
//	   //페이징 처리가 되지 않은 고객문의 목록
//	  @RequestMapping("/getCenterList.do")
//	  public String getCenterList(Model model) {
//	     CenterQnaVO vo = null;
//	     List<Map<String, Object>> getCenterList = centerQnaService.getCenterQnaList(vo);
//	     model.addAttribute("getCenterList", getCenterList);
//	     System.out.println(getCenterList);
//	     System.out.println("고객 문의 목록 페이지(getCenterList.jsp)이동 - getCenterList()");
//	     return "user/getCenterList";
//	  }
	
}
