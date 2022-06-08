package com.spring.mall.product.service;

import java.util.List;

import com.spring.mall.product.vo.ProductVO;

public interface SearchProductService {

	// 상품 목록 불러오기 
	public List<ProductVO> getProductList(ProductVO vo);
	
	//상품 검색하기 
	public List<ProductVO> searchProductList(ProductVO vo);
}
