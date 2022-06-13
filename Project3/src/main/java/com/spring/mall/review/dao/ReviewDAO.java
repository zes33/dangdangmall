package com.spring.mall.review.dao;

import java.util.HashMap;
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
	
	// 관리자 리뷰 검색결과 총수량 구하기
	public int adminTotReviewCnt(String searchCondition, String searchKeyword, String prd_category) {
		System.out.println("ReviewDAO.adminTotReviewCnt() 실행");
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", searchKeyword);
		map.put("prd_category", prd_category);
		return mybatis.selectOne("reviewDAO.adminTotReviewCnt", map);
	}
	
	// 관리자 리뷰 목록 불러오기(페이징+검색결과)
	public List<Map<String, Object>> adminReviewList(String searchCondition, String searchKeyword, String prd_category, String start, String end){
		System.out.println("ReviewDAO.adminReviewList() 실행");
		Map<String, String> map =  new HashMap<String, String>();
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", searchKeyword);
		map.put("prd_category", prd_category);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("reviewDAO.adminReviewList", map);
	}
	
	// oder_detail_id로 리뷰 존재여부 확인
	public int existReview(MyInfoVO myinfo) {
		System.out.println("ReviewDAO.existReview() 실행");
		return mybatis.selectOne("reviewDAO.existReview",myinfo);
	}
	
	// 주문상세번호로 주문정보 조회
	public Map<String, Object> getMyOrder_odi(MyInfoVO myinfo) {
		System.out.println("ReviewDAO.getMyOrder_odi() 실행");
		return mybatis.selectOne("reviewDAO.getMyOrder_odi", myinfo);
	}
	
	// 리뷰 입력
	public void insertReview(ReviewVO vo) {
		System.out.println("ReviewDAO.insertReview() 실행");
		mybatis.insert("reviewDAO.insertReview", vo);
	}
	
	// 회원별 리뷰 목록
	public List<Map<String, Object>> getMyReviewList(String user_id,String start, String end){
		System.out.println("ReviewDAO.getMyReviewList() 실행");
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("reviewDAO.myReviewList",map );
	}
	
	// 회원의 리뷰 개수
	public int totCntMyReview(String user_id) {
		System.out.println("ReviewDAO.totCntMyReview() 실행");
		return mybatis.selectOne("reviewDAO.totCntMyReview", user_id);
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
	
	// 한 상품의 모든 리뷰 목록(페이징x)
	public List<Map<String, Object>> reviewPerPrd(int product_id){
		System.out.println("ReviewDAO.reviewPerPrd() 실행");
		return mybatis.selectList("reviewDAO.reviewPerPrd", product_id);
	}
	
	// 리뷰 더보기 페이징
	public List<Map<String, Object>> reviewPerPrdPaging(String product_id, String start, String end){
		Map<String, String> map = new HashMap<String, String>();
		map.put("product_id", product_id);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("reviewDAO.reviewPerPrdPaging", map);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
