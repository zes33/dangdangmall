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
	public int totalCenterQnaCnt() {
		return centerPagingDAO.totalCenterQnaCnt();
	}

	@Override
	public List<Map<String, Object>> pagingCenterQnaList(int start, int end) {
		return centerPagingDAO.pagingCenterQnaList(start, end);
	}

	@Override
	public List<Map<String, Object>> pagingCenterQnaListSearch(CenterQnaVO vo, int start, int end) {
		return centerPagingDAO.pagingCenterQnaListSearch(vo, start, end);
	}
	
	
}
