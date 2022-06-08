package com.spring.mall.paging.service;

import java.util.List;
import java.util.Map;

import com.spring.mall.center.vo.CenterQnaVO;


public interface CenterPagingService {
	
	int totalCenterQnaCnt();
	List<Map<String, Object>> pagingCenterQnaList(int start, int end);
	List<Map<String, Object>> pagingCenterQnaListSearch(CenterQnaVO vo, int startInt, int endInt);
	
}
