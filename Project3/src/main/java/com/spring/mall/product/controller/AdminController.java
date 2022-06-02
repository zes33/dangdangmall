package com.spring.mall.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mall.product.service.ProductQnaService;
import com.spring.mall.product.service.ProductService;
import com.spring.mall.product.vo.ProductQnaNickVO;
import com.spring.mall.product.vo.ProductQnaVO;
import com.spring.mall.product.vo.ProductVO;

@Controller
@RequestMapping("/admin/**")
public class AdminController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductQnaService productQnaService;
	
	public AdminController() {
		System.out.println(">> AdminController() 객체 생성~~");
	}
	
	@GetMapping("admin.do")
	public String adminView() {
		System.out.println("관리자메인페이지(main.jsp)이동 - adminView()");
		return "admin/adminMain";
	}
	
	@GetMapping("/adminGetProductList.do")
	public String adminGetProductList(Model model) {
		ProductVO vo = null;
		List<ProductVO> adminProductList = productService.getProductList(vo);
		model.addAttribute("adminProductList",adminProductList);
		
		System.out.println("상품목록페이지(productList.jsp)이동 - getProductList()");
		return "admin/productList";
	}
	
	
	// 상품문의 답변 작성 페이지 이동(qna컨트롤러에서 됐었는데 왜 다시)------------------------
	@RequestMapping("/adminInsertProductQna.do")
	public String adminInsertProductQna(ProductQnaNickVO vo, Model model) {
		System.out.println("adminInsertProductQna() 실행");
		
		ProductQnaNickVO productQna = productQnaService.getProductQnaNick(vo);
		model.addAttribute("productQna",productQna);
		return "admin/insertProductQna";
	}

	
	//----상품문의목록 불러오기(왜 여기서만 될까)
	@RequestMapping("/adminProductQnaList.do")
	public String adminGetProductQnaList(Model model) {
		System.out.println("adminProductQnaList() 실행");
		
		List<ProductQnaVO> list = productQnaService.productQnaListAdmin();
		model.addAttribute("productQnaList",list);
		return "admin/getProductQnaList";
	}
}
