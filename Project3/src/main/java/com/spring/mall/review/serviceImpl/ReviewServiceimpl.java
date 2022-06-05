package com.spring.mall.review.serviceImpl;

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

}
