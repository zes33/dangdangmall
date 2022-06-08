package com.spring.mall.paging.service;

import java.util.List;
import java.util.Map;


public interface CenterPagingService {
	
	int totalCenterQnaCnt();
	List<Map<String, Object>> pagingCenterQnaList(int start, int end);
	
}
