package com.spring.mall.order.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.order.dao.AdminShippingDAO;
import com.spring.mall.order.service.AdminShippingService;
import com.spring.mall.order.vo.UserOrderVO;

@Service("AdminShippingService")
public class AdminShippingServiceImpl implements AdminShippingService {

	@Autowired
	private AdminShippingDAO adminShippingDAO;
	
	public AdminShippingServiceImpl() {
		System.out.println(">> AdminShippingServiceImpl 생성");
	}
	
	//1. 관리자 상품 주문 테이블 목록 불러오기
	@Override
	public List<UserOrderVO> getOrderList(String start, String end) {
		return adminShippingDAO.getOrderList(start,end);
	}

	//2. 관리자 주문 상태 변경
	@Override
	public void updateOrderState(String order_id) {
		adminShippingDAO.updateOrderState(order_id);
		
	}

}
