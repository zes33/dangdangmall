package com.spring.mall.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.mall.product.service.ProductQnaService;
import com.spring.mall.product.vo.ProductQnaNickVO;
import com.spring.mall.product.vo.ProductQnaVO;
import com.spring.mall.product.vo.ProductVO;
import com.spring.mall.user.service.UserLoginService;
import com.spring.mall.user.vo.UserVO;

@Controller
@SessionAttributes("tmepUser")
//@RequestMapping("/tempPrd/**")
public class ZZZController {
	
	@Autowired
	private ProductQnaService productQnaService;
	
	// 임시
	@Autowired
	private UserLoginService userLoginService;
	
	public ZZZController() {
		System.out.println("ZZZController() 객체 생성~~");
	}
	
	// 임시로 상세페이지 이동 ++ 바꿀 때 post로~
	//@GetMapping("tempPrd.do")
	@RequestMapping("tempPrd.do")
	public String tempProductDetail(ProductVO vo, ProductQnaNickVO qvo, Model model) {
		System.out.println("상품상세페이지(임시) 이동 - tempProductDetail 실행");
		System.out.println("productvo : " + vo);
		System.out.println("qnavo : " + qvo);
		
		//ProductVO product = productService.getProduct(vo);
		List<ProductQnaVO> productQnaList = productQnaService.getListProductQna(qvo);
		System.out.println(productQnaList.toString());
		
		model.addAttribute("productQnaList",productQnaList );
		
		//임시 개별 상품
		ProductVO product = vo;
		model.addAttribute("tempProduct", product);
		
		//임시  계정
		UserVO user1 = new UserVO("bab","bb");
		UserVO tempUser = userLoginService.getUser(user1);
		
		model.addAttribute("tempUser", tempUser);
		return "store/productDetail";
	}
	
	
	
}
