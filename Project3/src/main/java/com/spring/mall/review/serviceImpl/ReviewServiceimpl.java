package com.spring.mall.review.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.review.dao.ReviewDAO;
import com.spring.mall.review.service.ReviewService;
import com.spring.mall.review.vo.ReviewVO;
import com.spring.mall.user.vo.MyInfoVO;

@Service
public class ReviewServiceimpl implements ReviewService{
	
	@Autowired
	ReviewDAO reviewDAO;

	@Override
	public MyInfoVO getMyOrder_odi(MyInfoVO myinfo) {
		return reviewDAO.getMyOrder_odi(myinfo);
	}

	@Override
	public void insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
	}

	@Override
	public int existReview(MyInfoVO myinfo) {
		return reviewDAO.existReview(myinfo);
	}

	@Override
	public List<Map<String, Object>> getMyReviewList(String user_id) {
		return reviewDAO.getMyReviewList(user_id);
	}

	@Override
	public Map<String, Object> getReviewOne(int review_id) {
		return reviewDAO.getReviewOne(review_id);
	}

	@Override
	public void updateReview(ReviewVO review) {
		reviewDAO.updateReview(review);
	}

	@Override
	public void deleteReview(ReviewVO review) {
		reviewDAO.deleteReview(review);
	}

	@Override
	public List<Map<String, Object>> reviewPerPrd(int product_id) {
		return reviewDAO.reviewPerPrd(product_id);
	}

}
