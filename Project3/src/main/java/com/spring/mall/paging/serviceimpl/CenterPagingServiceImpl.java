package com.spring.mall.paging.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.center.vo.CenterQnaVO;
import com.spring.mall.paging.dao.CenterPagingDAO;
import com.spring.mall.paging.service.CenterPagingService;

@Service
public class CenterPagingServiceImpl implements CenterPagingService {

	@Autowired
	private CenterPagingDAO centerPagingDAO;

	@Override
	public int TotalCenterQnaPerPageSearch(String searchCondition, String searchKeyword) {
		return centerPagingDAO.TotalCenterQnaPerPageSearch(searchCondition, searchKeyword);
	}

	@Override
	public List<Map<String, Object>> CenterQnaPerPageSearch(String searchCondition, String searchKeyword
			, int start, int end) {
		return centerPagingDAO.CenterQnaPerPageSearch(searchCondition, searchKeyword, start, end);
	}

	
}
