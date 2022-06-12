package com.spring.mall.sales.service;

import java.util.List;

import com.spring.mall.user.vo.MyInfoVO;

public interface SalesHistoryService {
	public List<MyInfoVO> getHistoryAll(MyInfoVO vo);
}
