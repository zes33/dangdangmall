package com.spring.mall.paging.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.mall.paging.service.CenterPagingService;
import com.spring.mall.paging.vo.PagingVO;

@Controller
//@RequestMapping("/user/**")
public class CenterPagingController {
	
	@Autowired
	private CenterPagingService centerPagingService;
	
//	@RequestMapping("/user/getCenterListPaging.do")
//	public String getCenterListPaging(PagingVO vo, Model model
//			, @RequestParam(value="nowPage", required=false)String nowPage
//			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
//		System.out.println("!!!!getCenterListPaging() 실행!!");
//		
//		int total = centerPagingService.totalCenterQnaCnt();
//		
//		if (nowPage == null && cntPerPage == null) {
//			nowPage = "1";
//			cntPerPage = "10";
//		} else if (nowPage == null) {
//			nowPage = "1";
//		} else if (cntPerPage == null) { 
//			cntPerPage = "10";
//		}
//		
//		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
//		List<Map<String, Object>> getCenterListPaging = centerPagingService.pagingCenterQnaList(vo.getStart(),vo.getEnd());
//		System.out.println();
//		
//		model.addAttribute("getCenterListPaging", getCenterListPaging);
//		System.out.println(getCenterListPaging);
//		System.out.println("!!!!!고객 문의 목록 페이징처리(getCenterListPaging.jsp)이동 - getCenterListPaging()");
//		return "user/getCenterListPaging";
//	}
}
