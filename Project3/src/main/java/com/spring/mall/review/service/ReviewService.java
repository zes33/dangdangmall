package com.spring.mall.review.service;

import java.util.List;
import java.util.Map;

import com.spring.mall.review.vo.ReviewVO;
import com.spring.mall.user.vo.MyInfoVO;

public interface ReviewService {
	
	Map<String, Object> getMyOrder_odi(MyInfoVO myinfo);
	void insertReview(ReviewVO vo);
	int existReview(MyInfoVO myinfo);
	List<Map<String, Object>> getMyReviewList(String user_id, String start, String end);
	Map<String, Object> getReviewOne(int review_id);
	void updateReview(ReviewVO review);
	void deleteReview(ReviewVO review);
	List<Map<String, Object>> reviewPerPrd(int product_id);
	List<Map<String, Object>> adminReviewList(String searchCondition, String searchKeyword,String prd_category, String start, String end);
	int adminTotReviewCnt(String searchCondition,String searchKeyword,String prd_category);
	int totCntMyReview(String user_id);
	public List<Map<String, Object>> reviewPerPrdPaging(String product_id, String start, String end);
}