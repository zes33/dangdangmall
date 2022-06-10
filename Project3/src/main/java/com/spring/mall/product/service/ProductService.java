package com.spring.mall.product.service;

import java.util.List;
import java.util.Map;

import com.spring.mall.product.vo.ProductVO;

public interface ProductService {
	
	List<ProductVO> getProductListCategory(int category);

	void insertProduct(ProductVO vo);
	void updateProduct(ProductVO vo);
//	void deleteProduct(ProductVO vo);
	ProductVO getProduct(ProductVO vo);
	List<ProductVO> getProductList(ProductVO vo);
	int adminProductTotCnt(String searchCondition, String searchKeyword, 
								String prd_category, String prd_state);
	List<Map<String, Object>> adminProductList (String searchCondition, String searchKeyword, 
			String prd_category, String prd_state, String start, String end);
}
