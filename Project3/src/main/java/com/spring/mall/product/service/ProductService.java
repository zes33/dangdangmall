package com.spring.mall.product.service;

import java.util.List;

import com.spring.mall.product.vo.ProductVO;

public interface ProductService {

	void insertProduct(ProductVO vo);
	void updateProduct(ProductVO vo);
	void deleteProduct(ProductVO vo);
	ProductVO getProduct(ProductVO vo);
	List<ProductVO> getProductList(ProductVO vo);
}
