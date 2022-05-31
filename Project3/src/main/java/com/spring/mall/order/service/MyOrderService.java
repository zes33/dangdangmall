package com.spring.mall.order.service;

import java.util.List;

import com.spring.mall.order.vo.UserOrderVO;
import com.spring.mall.user.vo.UserVO;

public interface MyOrderService {
	List<UserOrderVO> getMyOrder(String user_id);
}
