package com.spring.mall.order.service;

import java.util.List;

import com.spring.mall.user.vo.MyInfoVO;
import com.spring.mall.user.vo.UserVO;

public interface MyOrderService {
	List<MyInfoVO> getMyOrder(String user_id);
	String getPW(UserVO vo);
}
