package com.spring.mall.paging.service;

import java.util.List;
import java.util.Map;

import com.spring.mall.center.vo.CenterQnaVO;


public interface CenterPagingService {
	
	int TotalCenterQnaPerPageSearch(String searchCondition, String searchKeyword);
	List<Map<String, Object>> CenterQnaPerPageSearch(String searchCondition, String searchKeyword,
			int start, int end);
	
}
