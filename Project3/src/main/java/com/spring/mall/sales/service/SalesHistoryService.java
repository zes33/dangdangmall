package com.spring.mall.sales.service;

import java.util.List;

import com.spring.mall.user.vo.MyInfoVO;

public interface SalesHistoryService {
	//전체 판매리스트 출력 
	public List<MyInfoVO> getHistoryAll(MyInfoVO vo);
	
	//상세 판매리스트 출력
	public List<MyInfoVO> historyOne(String order_id);
}
