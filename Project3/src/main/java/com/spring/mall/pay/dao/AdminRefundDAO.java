package com.spring.mall.pay.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mall.pay.vo.RefundTotalVO;
import com.spring.mall.user.vo.UserOrderPointVO;

@Repository
public class AdminRefundDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public AdminRefundDAO() {
		System.out.println("AdminRefundDAO() 객체 생성");
	}
	
	//1. 관리자 페이지 환불 요청 리스트
	public List<RefundTotalVO> refundList(RefundTotalVO vo) {
		return mybatis.selectList("adminRefundDAO.refundList");
	}
	
	//2. 환불 상태 변경 
	public void updateStatus(RefundTotalVO vo) {
		mybatis.update("adminRefundDAO.updateStatus", vo);
	}

	//3. 포인트 적립 취소 
	public void deletePoint(UserOrderPointVO vo) {
		mybatis.update("adminRefundDAO.deletePoint",vo);
	}
}
