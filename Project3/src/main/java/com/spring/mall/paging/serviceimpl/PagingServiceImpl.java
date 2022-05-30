package com.spring.mall.paging.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.paging.dao.PagingDAO;
import com.spring.mall.paging.service.PagingService;
import com.spring.mall.paging.vo.PagingVO;
import com.spring.mall.product.vo.ProductVO;

@Service
public class PagingServiceImpl implements PagingService {
	
	@Autowired
	private PagingDAO pagingDAO;

	@Override
	public int totalProductCnt_c(int category) {
		return pagingDAO.cntProduct_c(category);
	}

	@Override
	public List<ProductVO> productList_food(PagingVO vo) {
		return pagingDAO.productList_food(vo);
	}



}
