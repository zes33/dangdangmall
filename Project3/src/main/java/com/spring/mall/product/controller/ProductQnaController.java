package com.spring.mall.product.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mall.product.service.ProductQnaService;
import com.spring.mall.product.service.ProductService;
import com.spring.mall.product.vo.ProductQnaVO;
import com.spring.mall.product.vo.ProductVO;

@Controller
@RequestMapping("/productQna/**")
public class ProductQnaController {
	
	@Autowired
	private ProductQnaService productQnaService;
	@Autowired
	private ProductService productService;
	
	public ProductQnaController() {
		System.out.println("ProductQnaController() 객체 생성");
	}
	
	@RequestMapping("/kakaoQnaGo.do")
	public String kakaoQna() {
		System.out.println("ProductQnaController.kakaoQna() 실행");
		
		return "store/kakaoQna";
	}
	
	@RequestMapping("/insertPrdQna.do")
	public String insertProductQna(ProductQnaVO vo ,ProductVO pvo,HttpSession session,
									RedirectAttributes rdatt) {
		String user_id = (String) session.getAttribute("user_id");
		vo.setUser_id(user_id);
		System.out.println("vo : " + vo);
		
		productQnaService.insertProductQna(vo);
		System.out.println("1-1");
		rdatt.addAttribute("product_id",pvo.getProduct_id());
		
		return "forward:/tempPrd.do";
	}
	

	
	
}
