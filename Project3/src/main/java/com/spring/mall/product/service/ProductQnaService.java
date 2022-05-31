package com.spring.mall.product.service;

import java.util.List;

import com.spring.mall.product.vo.ProductQnaNickVO;

public interface ProductQnaService {
	
	public List<ProductQnaNickVO> qnaNickList(int product_id);

}
