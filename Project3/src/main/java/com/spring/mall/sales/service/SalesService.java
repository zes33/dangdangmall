package com.spring.mall.sales.service;

import java.util.HashMap;
import java.util.List;

import com.spring.mall.sales.vo.SalesVO;

public interface SalesService {
	List<SalesVO> getMonthList(String year);
}
