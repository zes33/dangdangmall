package com.spring.mall.product.service;

import java.util.List;

import com.spring.mall.product.vo.ProductQnaNickVO;
import com.spring.mall.product.vo.ProductQnaVO;

public interface ProductQnaService {
	
	public List<ProductQnaNickVO> qnaNickList(int product_id);
	public void insertProductQna(ProductQnaVO vo);

}
