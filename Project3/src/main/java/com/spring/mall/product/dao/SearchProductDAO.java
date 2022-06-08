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
//		List<ProductVO> pList = null;
		return mybatis.selectList("searchProductDAO.searchProductList",vo);
//		//1)검색 단어가 없을 때 기본 값 설정
//		if (vo.getSearchCondition() == null) {
//			vo.setSearchCondition("PRODUCT_NAME");
//		}
//		if (vo.getSearchKeyword() == null) {
//			vo.setSearchKeyword("");
//		}
//		if ("PRODUCT_NAME".equals(vo.getSearchCondition())) {
//			pList = mybatis.selectList("searchProductDAO.searchProductList_N", vo.getSearchKeyword());
//			
//		} else if ("PRODUCT_INFO".equals(vo.getSearchCondition())) {
//			pList = mybatis.selectList("searchProductDAO.searchProductList_I",vo.getSearchKeyword());
//		}
//		return pList;
	}
}
