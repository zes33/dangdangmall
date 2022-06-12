package com.spring.mall.sales.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String salesHistoryAll(Model model, MyInfoVO vo) {
		System.out.println(">> salesHistoryAll 시작 ");
		
		List<MyInfoVO> all = salesHistoryService.getHistoryAll(vo);
		model.addAttribute("all", all);
		
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
