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
	
//	public List<ProductVO> searchProductList
}
