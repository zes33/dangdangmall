package com.spring.mall.pay.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.pay.dao.AdminRefundDAO;
import com.spring.mall.pay.service.AdminRefundService;
import com.spring.mall.pay.vo.RefundTotalVO;
import com.spring.mall.user.vo.UserOrderPointVO;

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

	//2. 환불 상태 변경
	@Override
	public void updateStatus(RefundTotalVO vo) {
		 adminRefundDAO.updateStatus(vo);
		
	}

	// 3. 포인트 적립 취소
	@Override
	public void deletePoint(UserOrderPointVO vo) {
		adminRefundDAO.deletePoint(vo);
		
	}
	
}
