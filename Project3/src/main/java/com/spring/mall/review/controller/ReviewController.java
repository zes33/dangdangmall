package com.spring.mall.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.mall.paging.service.PagingService;
import com.spring.mall.paging.vo.PagingVO;
import com.spring.mall.product.vo.ProductVO;
import com.spring.mall.review.service.ReviewService;
import com.spring.mall.review.vo.ReviewVO;
import com.spring.mall.user.vo.MyInfoVO;
import com.spring.mall.user.vo.UserVO;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	@Autowired
	PagingService pagingService;
	
	public ReviewController() {
		System.out.println("ReviewController() 객체 생성");
	}
	
	// 관리자 리뷰목록 페이지 이동
	@RequestMapping("/adminReviewList.do")
	public String adminReviewList(String searchCondition, String prd_category,
			String searchKeyword, PagingVO paging, Model model,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		System.out.println("관리자 리뷰목록 이동");
		System.out.println("searchCondition : " + searchCondition);
		System.out.println("searchKeyword : " + searchKeyword);
		int total = reviewService.adminTotReviewCnt(searchCondition, searchKeyword,prd_category);
		System.out.println("total : " + total);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		paging = new PagingVO(total, Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
		String start = Integer.toString(paging.getStart());
		String end = Integer.toString(paging.getEnd());
		List<Map<String, Object>> reviewList = reviewService.adminReviewList(searchCondition, searchKeyword,prd_category, start, end);
		
		model.addAttribute("paging",paging);
		model.addAttribute("reviewList",reviewList);
		model.addAttribute("searchCondition",searchCondition);
		model.addAttribute("searchKeyword",searchKeyword);
		model.addAttribute("prd_category",prd_category);
		return "admin/reviewList";
	}
	
	// (관리자) 리뷰 페이지 검색 조건
	@ModelAttribute("reviewConditionMap")
	public Map<String, String> searchConditionMap(){
		System.out.println("====> Map searchConditionMap() 실행");
		Map<String, String> reviewConditionMap = new HashMap<String, String>();
		reviewConditionMap.put("내용", "REVIEW_CONTENT");
		reviewConditionMap.put("상품명", "PRODUCT_NAME");
		reviewConditionMap.put("상픔번호", "PRODUCT_ID");
		return reviewConditionMap;
	}

	// 상품리뷰 더보기
	@RequestMapping("/moreReview.do")
	public String moreReview(ProductVO pvo, Model model,PagingVO paging ,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		System.out.println("moreReview() 실행");
		int p_id = pvo.getProduct_id();
		
		// 리뷰 목록
		List<Map<String, Object>> reviewList = reviewService.reviewPerPrd(p_id);
		int total = reviewList.size();
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "7";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "7";
		}
		
		paging = new PagingVO(total, Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
		String start = Integer.toString(paging.getStart());
		String end = Integer.toString(paging.getEnd());
		String product_id = Integer.toString(p_id);
		List<Map<String, Object>> reviewListPaging = reviewService.reviewPerPrdPaging(product_id, start, end);
		
		model.addAttribute("reviewListPaging", reviewListPaging);
		model.addAttribute("paging",paging);
		model.addAttribute("product_id",product_id);
		
		return "store/productReview";
	}
	
	// 리뷰작성 페이지로 이동
	@RequestMapping("/writeReview.do")
	public String myReview (MyInfoVO myinfo, Model model) {
		System.out.println("myReview() 실행");
		
		//order_detail_id로 주문정보 조회
		Map<String, Object> myOrder = reviewService.getMyOrder_odi(myinfo);
		model.addAttribute("myOrder", myOrder);
		return "user/writeReview";
	}
	
	// 리뷰 등록
	@RequestMapping("/insertReview.do")
	public String insertReview(ReviewVO vo) {
		reviewService.insertReview(vo);
		return "redirect:/myinfo.do";
	}
	
	
	// 마이페이지-후기내역
	@RequestMapping("/goMyReview.do")
	public String goMyReview(HttpServletRequest request, Model model, PagingVO paging,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		System.out.println("goMyReview() 실행");
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {
			cntPerPage = "5";
		}
		
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		int total = reviewService.totCntMyReview(user_id);
		paging = new PagingVO(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
		String start = Integer.toString(paging.getStart());
		String end = Integer.toString(paging.getEnd());
		List<Map<String, Object>> myReviewList = reviewService.getMyReviewList(user_id, start, end);
		model.addAttribute("myReviewList",myReviewList);
		model.addAttribute("paging",paging);
		
		System.out.println("total : " +total);
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
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
		reviewService.updateReview(review);
		return "redirect:/goMyReview.do";
	}
	
	// 리뷰 삭제
	@RequestMapping("/deleteReview.do")
	public String deleteReview(ReviewVO review, HttpSession session) {
		System.out.println("deleteReview() 실행");
		reviewService.deleteReview(review);
		
		String result = "";
		UserVO user = (UserVO) session.getAttribute("user");
		if(user.getUser_state() == 2) {
			result = "redirect:/adminReviewList.do";
		} else {
			result = "redirect:/goMyReview.do";
		}
		
		return result;
	}
}
