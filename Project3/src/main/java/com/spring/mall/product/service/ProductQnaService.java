package com.spring.mall.product.service;

import java.util.List;

import com.spring.mall.product.vo.ProductQnaVO;

public interface ProductQnaService {

	void insertProductQna(ProductQnaVO vo);
	void updateProductQna(ProductQnaVO vo);
	void deleteProductQna(ProductQnaVO vo);
	ProductQnaVO getProductQna(ProductQnaVO vo);
	List<ProductQnaVO> getListProductQna(ProductQnaVO vo);
}
