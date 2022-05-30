package com.spring.mall.paging.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mall.paging.vo.PagingVO;
import com.spring.mall.product.vo.ProductVO;

@Repository
public class PagingDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public PagingDAO() {
		System.out.println("PagingDAO 객체 생성");
	}
	
	public int cntProduct_c(int category) {
		System.out.println("PagingDAO.cntProduct_c() 실행");
		return mybatis.selectOne("paging.totalProductCnt_c",category);
	}
	
	public List<ProductVO> productList_food(PagingVO vo){
		System.out.println("PagingDAO.productList_c() 실행");
		List<ProductVO> list = mybatis.selectList("paging.getProductPerPage_food", vo);
		return list;
	}
	
}
