package com.spring.mall.pay.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mall.pay.vo.UserOrderRefundVO;
import com.spring.mall.user.vo.MyInfoVO;

@Repository
public class UserRefundDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserRefundDAO() {
		System.out.println("UserRefundDAO() 객체 생성");
	}

	//환불 신청 시 하나의 상품에 대한 myinfoVO 생성
	public MyInfoVO getOrderOne(MyInfoVO vo) {
		return mybatis.selectOne("userRefund.getOrderOne", vo);
	}

	//환불 신청 시 refund 테이블에 insert
	public int insertRefund(UserOrderRefundVO vo) {
		return mybatis.insert("userRefund.insertRefund", vo);
	}

}
