package com.spring.mall.paging.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.paging.dao.PagingDAO;
import com.spring.mall.paging.service.PagingService;
import com.spring.mall.paging.vo.PagingVO;
import com.spring.mall.product.vo.ProductQnaNickVO;
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
	public List<ProductVO> productList_category(int category_code, int start, int end) {
		return pagingDAO.productList_category(category_code,start,end);
	}

	@Override
	public int totalPrdQna_prd(int product_id) {
		return pagingDAO.cntQnaPerPrd(product_id);
	}

	@Override
	public List<ProductQnaNickVO> prdQnaList_prd(int product_id, int start, int end) {
		return pagingDAO.prdQnaList_prd(product_id, start, end);
	}



}
