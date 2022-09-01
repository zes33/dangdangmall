package com.spring.mall.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.mall.product.service.SearchProductService;
import com.spring.mall.product.vo.ProductVO;

@Controller
@RequestMapping("/searchProduct/**")
public class SearchProductController {

	@Autowired
	private SearchProductService searchProductService;
	
	public SearchProductController() {
		System.out.println("SearchProductController() 객체 생성!");
	}
	
	//페이지 이동 ->  1. 상품 목록 불러오기  
	@GetMapping("/searchProductView.do")
	public String searchProduct(ProductVO vo, Model model, HttpSession session) {
		System.out.println("searchProduct() searchProduct.jsp로 이동 ");
		
		List<ProductVO> productList = searchProductService.getProductList(vo);
		System.out.println(productList + " : productList");
		session.setAttribute("productList", productList);
		return "store/searchProduct";
	}
	
	@RequestMapping("searchProductList.do")
	public String searchProductList(@RequestParam String searchKeyword, ProductVO vo,Model model) {
		System.out.println("vo" + vo);
		
		List<ProductVO> productList = searchProductService.searchProductList(vo);
		model.addAttribute("productListS", productList);
		model.addAttribute("searchKeyword", searchKeyword);
		
		return "store/searchProduct";
		
	}
	
}
