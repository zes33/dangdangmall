package com.spring.mall.order.service;

import com.spring.mall.cart.vo.CartVO;
import com.spring.mall.order.vo.UserOrderDetailVO;
import com.spring.mall.order.vo.UserOrderVO;

public interface OrderService {
	
	//1. 주문 정보 입력 
	public void insertOrder(UserOrderVO vo);
	
	//2. 주문 상세 정보 입력
	public void insertOrderDetail(UserOrderDetailVO vo);
	
	//3. 카트 비우기 
	public void cartAllDelete(String user_id);
}
