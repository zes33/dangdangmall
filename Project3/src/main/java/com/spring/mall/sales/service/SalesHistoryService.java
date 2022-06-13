package com.spring.mall.sales.service;

import java.util.List;

import com.spring.mall.user.vo.MyInfoVO;

public interface SalesHistoryService {
	//전체 판매리스트 출력 
	public List<MyInfoVO> getHistoryAll(String start, String end);
	
	//전페 판매리스트 수량
	public int cntHistoryAll();
	
	//상세 판매리스트 출력
	public List<MyInfoVO> historyOne(String order_id);
}
