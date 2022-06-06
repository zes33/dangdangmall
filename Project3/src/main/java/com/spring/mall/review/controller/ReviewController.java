package com.spring.mall.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mall.review.service.ReviewService;
import com.spring.mall.review.vo.ReviewVO;
import com.spring.mall.user.vo.MyInfoVO;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	public ReviewController() {
		System.out.println("ReviewController() 객체 생성");
	}

	// 리뷰작성 페이지로 이동
	@RequestMapping("/writeReview.do")
	public String myReview (MyInfoVO myinfo, Model model) {
		System.out.println("myReview() 실행");
		
		//order_detail_id로 주문정보 조회
		MyInfoVO myOrder = reviewService.getMyOrder_odi(myinfo);
		model.addAttribute("myOrder", myOrder);
		return "user/writeReview";
	}
	
	// 리뷰 등록
	@RequestMapping("/insertReview.do")
	public String insertReview(ReviewVO vo) {
		System.out.println("insertReview() 실행");
		System.out.println("review : " + vo);
		reviewService.insertReview(vo);
		
		return "redirect:/myinfo.do";
	}
	
	
	// 마이페이지-후기내역
	@RequestMapping("/goMyReview.do")
	public String goMyReview() {
		System.out.println("goMyReview() 실행");
		
		
		return "user/myReview";
	}
	
}
