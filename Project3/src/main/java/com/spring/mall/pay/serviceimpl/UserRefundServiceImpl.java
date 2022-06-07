package com.spring.mall.pay.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.pay.dao.UserRefundDAO;
import com.spring.mall.pay.service.UserRefundService;
import com.spring.mall.pay.vo.RefundTotalVO;
import com.spring.mall.pay.vo.UserOrderRefundVO;
import com.spring.mall.user.vo.MyInfoVO;

@Service("userRefundServiceImpl")
public class UserRefundServiceImpl implements UserRefundService{
	
	@Autowired
	private UserRefundDAO userRefundDAO;

	public UserRefundServiceImpl() {
		System.out.println("UserRefundServiceImpl() 객체 생성");
	}
	@Override
	public MyInfoVO getOrderOne(MyInfoVO vo) {
		return userRefundDAO.getOrderOne(vo);
	}
	
	@Override
	public void insertRefund(UserOrderRefundVO vo) {
		userRefundDAO.insertRefund(vo);
	}
	
	

}
