package com.spring.mall.review.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String goMyReview(HttpServletRequest request, Model model) {
		System.out.println("goMyReview() 실행");
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		List<Map<String, Object>> myReviewList = reviewService.getMyReviewList(user_id);
		model.addAttribute("myReviewList",myReviewList);
		
		return "user/myReview";
	}
	
	// 리뷰수정 페이지로 이동
	@RequestMapping("/editReview.do")
	public String editReview(int review_id, Model model) {
		System.out.println("editReview() 실행");
		Map<String, Object> myReview = reviewService.getReviewOne(review_id);
		model.addAttribute("myReview",myReview);
		
		return "user/updateReview";
	}
	
	// 리뷰 수정 처리
	@RequestMapping("/updateReview.do")
	public String updateReview(ReviewVO review) {
		System.out.println("updateReview() 실행");
		reviewService.updateReview(review);
		System.out.println("review : " + review);
		
		return "redirect:/goMyReview.do";
	}
	
	// 리뷰 삭제
	@RequestMapping("/deleteReview.do")
	public String deleteReview(ReviewVO review) {
		System.out.println("deleteReview() 실행");
		reviewService.deleteReview(review);
		
		return "redirect:/goMyReview.do";
	}
}
