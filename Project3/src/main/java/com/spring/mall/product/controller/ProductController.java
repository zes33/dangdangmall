package com.spring.mall.product.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.mall.product.service.ProductQnaService;
import com.spring.mall.product.service.ProductService;
import com.spring.mall.product.vo.ProductQnaNickVO;
import com.spring.mall.product.vo.ProductQnaVO;
import com.spring.mall.product.vo.ProductVO;

@Controller
@SessionAttributes("tmepUser")
//@RequestMapping("/tempPrd/**")
public class ProductController {
	
	@Autowired
	private ProductQnaService productQnaService;
	@Autowired
	private ProductService productService;
	
	public ProductController() {
		System.out.println("ProductController() 객체 생성~~");
	}
	
	// 상품상세페이지 이동 
	@RequestMapping("tempPrd.do")
	public String tempProductDetail(ProductVO vo, ProductQnaNickVO qvo, Model model, HttpSession session) {
		System.out.println("상품상세페이지(임시) 이동 - tempProductDetail 실행");
		System.out.println("productvo : " + vo);
		System.out.println("ProductQnaNickVO : " + qvo);
		
		ProductVO product = productService.getProduct(vo);
		List<ProductQnaVO> productQnaList = productQnaService.getListProductQna(qvo);
		System.out.println(productQnaList.toString());
		
		model.addAttribute("productQnaList",productQnaList );
		model.addAttribute("product", product);
		session.setAttribute("product", product);
		session.setAttribute("product_discount", product.getProduct_discount());
		
		return "store/productDetail";
	}
	
	
	
}
