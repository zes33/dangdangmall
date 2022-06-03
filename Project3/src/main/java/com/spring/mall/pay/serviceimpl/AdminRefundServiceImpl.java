package com.spring.mall.pay.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.pay.dao.AdminRefundDAO;
import com.spring.mall.pay.service.AdminRefundService;
import com.spring.mall.pay.vo.RefundTotalVO;

@Service("AdminRefundService")
public class AdminRefundServiceImpl implements AdminRefundService {

	@Autowired
	private AdminRefundDAO adminRefundDAO;
	
	public AdminRefundServiceImpl() {
		System.out.println("AdminRefundServiceImpl() 객체 생성 ");
	}
	
	//1. 관리자 페이지 환불 요청 리스트
	@Override
	public List<RefundTotalVO> refundList(RefundTotalVO vo) {
		return adminRefundDAO.refundList(vo);
	}

	@Override
	public void updateStatus(RefundTotalVO vo) {
		 adminRefundDAO.updateStatus(vo);
		
	}

}
