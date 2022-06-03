package com.spring.mall.pay.service;

import java.util.List;

import com.spring.mall.pay.vo.RefundTotalVO;

public interface AdminRefundService {
	
	//1. 관리자 페이지 환불 요청 리스트
	public List<RefundTotalVO> refundList(RefundTotalVO vo);
}
