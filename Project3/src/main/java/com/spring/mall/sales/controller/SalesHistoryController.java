package com.spring.mall.sales.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.mall.paging.vo.PagingVO;
import com.spring.mall.sales.service.SalesHistoryService;
import com.spring.mall.user.vo.MyInfoVO;

@Controller
@RequestMapping("/salesHistory/**")
public class SalesHistoryController {
	
	@Autowired
	private SalesHistoryService salesHistoryService;
	
	public SalesHistoryController() {
		System.out.println(">> SalesHistoryController() 객체 생성");
	}
	
	@RequestMapping("/salesHistoryView.do")
	public String salesHistoryAll(Model model, MyInfoVO vo, PagingVO paging,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		System.out.println(">> salesHistoryAll 시작 ");
		int total = salesHistoryService.cntHistoryAll();
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "6";
		}
		
		paging = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		String start = Integer.toString(paging.getStart());
		String end = Integer.toString(paging.getEnd());
		
		List<MyInfoVO> all = salesHistoryService.getHistoryAll(start, end);
		model.addAttribute("all", all);
		model.addAttribute("paging", paging);
		
		return "admin/salesHistory";
	}
	
	@RequestMapping("/salesHistoryOne.do")
	public String salesHistoryOne(Model model, MyInfoVO vo,@RequestParam String order_id) {
		System.out.println(">> salesHistoryAll 시작 ");
		
		List<MyInfoVO> one = salesHistoryService.historyOne(order_id);
		model.addAttribute("one", one);
		
		return "admin/salesHistoryOne";
	}
	
}
