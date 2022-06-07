package com.spring.mall.review.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mall.review.vo.ReviewVO;
import com.spring.mall.user.vo.MyInfoVO;

@Repository
public class ReviewDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public ReviewDAO() {
		System.out.println("ReviewDAO() 객체 생성");
	}
	
	// oder_detail_id로 리뷰 존재여부 확인
	public int existReview(MyInfoVO myinfo) {
		System.out.println("ReviewDAO.existReview() 실행");
		return mybatis.selectOne("reviewDAO.existReview",myinfo);
	}
	
	// 주문상세번호로 주문정보 조회
	public MyInfoVO getMyOrder_odi(MyInfoVO myinfo) {
		System.out.println("ReviewDAO.getMyOrder_odi() 실행");
		return mybatis.selectOne("reviewDAO.getMyOrder_odi", myinfo);
	}
	
	// 리뷰 입력
	public void insertReview(ReviewVO vo) {
		System.out.println("ReviewDAO.insertReview() 실행");
		mybatis.insert("reviewDAO.insertReview", vo);
	}
	
	// 회원별 리뷰 목록
	public List<Map<String, Object>> getMyReviewList(String user_id){
		System.out.println("ReviewDAO.getMyReviewList() 실행");
		return mybatis.selectList("reviewDAO.myReviewList",user_id );
	}
	
	// 리뷰아이디로 리뷰 정보 조회
	public Map<String, Object> getReviewOne(int review_id){
		System.out.println("ReviewDAO.getReviewOne() 실행");
		return mybatis.selectOne("reviewDAO.getReviewOne", review_id);
	}
	
	// 리뷰 수정
	public void updateReview(ReviewVO review) {
		System.out.println("ReviewDAO.updateReview() 실행");
		mybatis.update("reviewDAO.updateReview",review);
	}
	
	// 리뷰 삭제
	public void deleteReview(ReviewVO review) {
		System.out.println("ReviewDAO.deleteReview() 실행");
		mybatis.delete("reviewDAO.deleteReview", review);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
