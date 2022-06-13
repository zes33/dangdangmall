package com.spring.mall.order.service;

import java.util.List;

import com.spring.mall.order.vo.UserOrderVO;

public interface AdminShippingService {

	// 1. 관리자 상품 주문 테이블 목록 불러오기
	public List<UserOrderVO> getOrderList(String start, String end);

	// 2. 관리자 주문 상태 변경
	public void updateOrderState(String order_id);
}
