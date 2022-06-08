package com.spring.mall.pay.service;

import java.util.List;

import com.spring.mall.pay.vo.RefundTotalVO;
import com.spring.mall.user.vo.UserOrderPointVO;

public interface AdminRefundService {

	// 1. 관리자 페이지 환불 요청 리스트
	public List<RefundTotalVO> refundList(RefundTotalVO vo);

	// 2.환불 상태 변경
	public void updateStatus(RefundTotalVO vo);

	// 3. 포인트 적립 취소
	public void deletePoint(RefundTotalVO refundTotalVO);
	
	//4. 환불 상태 체크 
	public int checkRefund(int refund_id);
}
