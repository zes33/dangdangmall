package com.spring.mall.paging.service;

import java.util.List;

import com.spring.mall.paging.vo.PagingVO;
import com.spring.mall.product.vo.ProductQnaNickVO;
import com.spring.mall.product.vo.ProductVO;

public interface PagingService {
	
	int totalProductCnt_c(int category);
	List<ProductVO> productList_category(int category_code, int start, int end);
	
	int totalPrdQna_prd(int product_id);
	List<ProductQnaNickVO> prdQnaList_prd(int product_id, int start, int end);
}
