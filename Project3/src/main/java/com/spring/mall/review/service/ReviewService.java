package com.spring.mall.review.service;

import com.spring.mall.review.vo.ReviewVO;
import com.spring.mall.user.vo.MyInfoVO;

public interface ReviewService {
	
	MyInfoVO getMyOrder_odi(MyInfoVO myinfo);
	void insertReview(ReviewVO vo);
	int existReview(MyInfoVO myinfo);
}
