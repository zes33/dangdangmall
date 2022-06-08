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
		//model.addAttribute("productList", productList);
		session.setAttribute("productList", productList);
		return "store/searchProduct";
	}
	
	
	//2. 상품 검색 
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		System.out.println("=====> Map searchConditionMap() 실행");
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("상품명", "PRODUCT_NAME");
		conditionMap.put("상품설명", "PRODUCT_INFO");
		return conditionMap;
	}
	
	@RequestMapping("searchProductList.do")
	public String searchProductList(ProductVO vo,Model model) {
		System.out.println("vo" + vo);
		
		List<ProductVO> productList = searchProductService.searchProductList(vo);
		model.addAttribute("productListS", productList);
		
		return "store/searchProduct";
		
	}
	
}
