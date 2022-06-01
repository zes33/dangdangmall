package com.spring.mall.order.service;

import com.spring.mall.order.vo.UserOrderDetailVO;
import com.spring.mall.order.vo.UserOrderVO;
import com.spring.mall.pay.vo.PaymentVO;

public interface OrderService {
	
	//1. 주문 정보 입력 
	public void insertOrder(UserOrderVO vo);
	
	//2. 주문 상세 정보 입력
	public void insertOrderDetail(UserOrderDetailVO vo);
	
	//3. 카트 비우기 
	public void cartAllDelete(String user_id);
	
	//4. 결제창에서 쓰일 최근 주문 정보 가져오기
	public UserOrderVO getOrder(String user_id, String order_id);
	
	//5. 주문 완료 후, 결제 테이블로 넘기기 
	public void insertPayment(PaymentVO vo);

//	void insertPayment(PaymentVO vo, String order_id);
}
