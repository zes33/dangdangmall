package com.spring.mall.order.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.order.dao.UserOrderDAO;
import com.spring.mall.order.service.MyOrderService;
import com.spring.mall.order.vo.UserOrderVO;
import com.spring.mall.user.vo.UserVO;

@Service("myOrderService")
public class MyOrderServiceImpl implements MyOrderService {

	@Autowired
	private UserOrderDAO userOrderDAO;
	
	public MyOrderServiceImpl() {
		System.out.println("MyOrderServiceImpl() 객체 생성");
	}
	
	@Override
	public List<UserOrderVO> getMyOrder(String user_id) {
		return userOrderDAO.getMyOrder(user_id);
	}

}
