package com.spring.mall.product.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mall.product.vo.ProductVO;

@Repository
public class SearchProductDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public SearchProductDAO() {
		System.out.println("SearchProductDAO() 생성");
	}
	
	//1. 상품 리스트 
	public List<ProductVO> getProductList(ProductVO vo){
		System.out.println(">> getProductList() 시작 ");
		return mybatis.selectList("searchProductDAO.getProductList",vo);
	}
	
	//2. 상품이름/설명으로 검색 
	public List<ProductVO> searchProductList(ProductVO vo){
		return mybatis.selectList("searchProductDAO.searchProductList",vo);

	}
}
