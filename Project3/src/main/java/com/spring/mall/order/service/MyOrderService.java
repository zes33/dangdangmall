package com.spring.mall.order.service;

import java.util.List;

import com.spring.mall.user.vo.MyInfoVO;

public interface MyOrderService {
	List<MyInfoVO> getMyOrder(String user_id);
}
