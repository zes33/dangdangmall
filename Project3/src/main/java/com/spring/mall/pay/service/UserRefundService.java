package com.spring.mall.pay.service;

import com.spring.mall.pay.vo.RefundTotalVO;
import com.spring.mall.pay.vo.UserOrderRefundVO;
import com.spring.mall.user.vo.MyInfoVO;

public interface UserRefundService {
	
	MyInfoVO getOrderOne(MyInfoVO vo);
	void insertRefund(UserOrderRefundVO vo);

}
