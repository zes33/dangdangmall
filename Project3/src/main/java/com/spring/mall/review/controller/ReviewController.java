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
		System.out.println("nowPage : " + nowPage);
		System.out.println("startPage : " + paging.getStartPage());
		System.out.println("endPage : " + paging.getEndPage());
		
		String start = Integer.toString(paging.getStart());
		String end = Integer.toString(paging.getEnd());
		List<Map<String, Object>> reviewList = reviewService.adminReviewList(searchCondition, searchKeyword,prd_category, start, end);
		
		model.addAttribute("paging",paging);
		model.addAttribute("reviewList",reviewList);
		model.addAttribute("searchCondition",searchCondition);
		model.addAttribute("searchKeyword",searchKeyword);
		model.addAttribute("prd_category",prd_category);
		
		System.out.println("searchCondition : " + searchCondition);
		System.out.println("searchKeyword : " + searchKeyword);
		System.out.println("prd_category : " + prd_category);
		System.out.println("total : " + total);
		return "admin/reviewList";
	}
	
	// 관리자 리뷰 페이지 검색 조건
	@ModelAttribute("reviewConditionMap")
	public Map<String, String> searchConditionMap(){
		System.out.println("====> Map searchConditionMap() 실행");
		Map<String, String> reviewConditionMap = new HashMap<String, String>();
		reviewConditionMap.put("내용", "REVIEW_CONTENT");
		//reviewConditionMap.put("분류", "CATEGORY_CODE");
		reviewConditionMap.put("상품명", "PRODUCT_NAME");
		reviewConditionMap.put("상픔ID", "PRODUCT_ID");
		return reviewConditionMap;
	}

	// 상품리뷰 더보기
	@RequestMapping("/moreReview.do")
	public String moreReview(ProductVO pvo, Model model,PagingVO paging ,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		System.out.println("moreReview() 실행");
		int product_id = pvo.getProduct_id();
		List<Map<String, Object>> reviewList = reviewService.reviewPerPrd(product_id);
		int total = reviewList.size();
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		
		paging = new PagingVO(total, Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("paging",paging);
		
		return "store/productReview";
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
