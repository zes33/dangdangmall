package com.spring.mall.order.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.cart.vo.CartVO;
import com.spring.mall.order.dao.OrderDAO;
import com.spring.mall.order.service.OrderService;
import com.spring.mall.order.vo.UserOrderDetailVO;
import com.spring.mall.order.vo.UserOrderVO;
import com.spring.mall.pay.vo.PaymentVO;
import com.spring.mall.user.vo.UserOrderPointVO;
import com.spring.mall.user.vo.UserVO;

@Service("OrderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;

	public OrderServiceImpl() {
		System.out.println(">> OrderServiceImpl 생성 ");
	}

	//1. 주문 정보 입력 
	@Override
	public void insertOrder(UserOrderVO vo) {
		orderDAO.insertOrder(vo);

	}

	//2. 주문 상세 정보 입력
	@Override
	public void insertOrderDetail(UserOrderDetailVO vo) {
		orderDAO.insertOrderDetail(vo);
	}
	
	//3. 카트 비우기 
	@Override
	public void cartAllDelete(String user_id) {
		orderDAO.cartAllDelete(user_id);
	}

	//4. 결제창에서 쓰일 최근 주문 정보 가져오기
	@Override
	public UserOrderVO getOrder(String user_id, String order_id) {
		return orderDAO.getOrder(user_id,order_id);
	}
	
	// 4-1 주문 정보 입력폼, 주문자 주소록 가져오기
//	@Override
//	public UserVO getUserAddr(String user_id) {
//		return orderDAO.getUserAddr(user_id);
//	}


	//5. 결제 완료 후, 결제 테이블로 넘기기
	@Override
	public void insertPayment(PaymentVO vo) {
		orderDAO.insertPayment(vo);
	}

	// 6. 포인트 적립 
	@Override
	public void updatePoint(UserOrderPointVO vo) {
		orderDAO.updatePoint(vo);
		
	}

	
}
