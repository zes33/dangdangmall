package com.spring.mall.order.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.order.dao.OrderDAO;
import com.spring.mall.order.service.OrderService;
import com.spring.mall.order.vo.UserOrderDetailVO;
import com.spring.mall.order.vo.UserOrderVO;

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
	public void insertOrderDetail(int order_id) {
		orderDAO.insertOrderDetail(order_id);
	}

}
