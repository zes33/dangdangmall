package com.spring.mall.order.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mall.order.vo.UserOrderDetailVO;
import com.spring.mall.order.vo.UserOrderVO;


@Repository
public class OrderDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public OrderDAO() {
		System.out.println(">> OrderDAO() 객체 생성 ");
	}
	
	//1. 주문 정보 입력 
	public void insertOrder(UserOrderVO vo) {
		mybatis.insert("orderDAO.insertOrder",vo);
	}
	
	//2. 주문 상세 정보 입력
	public void insertOrderDetail(int order_id) {
		mybatis.insert("orderDAO.insertOrderDetail", order_id);
	}
}
