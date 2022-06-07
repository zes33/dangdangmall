package com.spring.mall.paging.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.mall.paging.service.PagingService;
import com.spring.mall.paging.vo.PagingVO;
import com.spring.mall.product.service.ProductQnaService;
import com.spring.mall.product.service.ProductService;
import com.spring.mall.product.vo.ProductQnaNickVO;
import com.spring.mall.product.vo.ProductVO;

@Controller
public class PagingController {
	
	@Autowired
	private PagingService pagingService;
	@Autowired
	private ProductQnaService productQnaService;
	@Autowired
	private ProductService productService;
	
	// 카테고리별 목록
	@RequestMapping("paging.do")
	public String boardList(String prd_c, PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int category_code = Integer.parseInt(prd_c);
		int total = pagingService.totalProductCnt_c(category_code);

		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "12";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "12";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("viewProduct", pagingService.productList_category(category_code,vo.getStart(),vo.getEnd()));
		model.addAttribute("prd_c", prd_c);
		return "store/productListCategory";
	}
	

}
