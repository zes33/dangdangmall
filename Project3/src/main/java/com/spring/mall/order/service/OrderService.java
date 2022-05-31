package com.spring.mall.order.service;

import com.spring.mall.order.vo.UserOrderDetailVO;
import com.spring.mall.order.vo.UserOrderVO;

public interface OrderService {
	
	//1. 주문 정보 입력 
	public void insertOrder(UserOrderVO vo);
	
	//2. 주문 상세 정보 입력
	public void insertOrderDetail(int order_id);
}
