package com.spring.mall.paging.service;

import java.util.List;

import com.spring.mall.paging.vo.PagingVO;
import com.spring.mall.product.vo.ProductVO;

public interface PagingService {
	
	int totalProductCnt_c(int category);
	List<ProductVO> productList_food(PagingVO vo);
}
