package com.spring.mall.paging.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mall.paging.vo.PagingVO;
import com.spring.mall.product.vo.ProductQnaNickVO;
import com.spring.mall.product.vo.ProductVO;

@Repository
public class PagingDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public PagingDAO() {
		System.out.println("PagingDAO 객체 생성");
	}
	
	//상품별 문의 개수
	public int cntQnaPerPrd(int product_id) {
		System.out.println("PagingDAO.cntQnaPerPrd() 실행");
		return mybatis.selectOne("paging.totalReplCnt_prd", product_id);
	}
	
	//상품별 문의 목록
	public List<ProductQnaNickVO> prdQnaList_prd(int product_id, int start, int end){
		System.out.println("PagingDAO.prdQnaList_prd() 실행");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("product_id", product_id);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("paging.prdQnaListWithPaging", map);
	}
	
	//카테고리별 상품 개수
	public int cntProduct_c(int category) {
		System.out.println("PagingDAO.cntProduct_c() 실행");
		return mybatis.selectOne("paging.totalProductCnt_c",category);
	}
	
	//카테고리별 상품 목록
	public List<ProductVO> productList_category(int category_code, int start, int end){
		System.out.println("PagingDAO.productList_c() 실행");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("category_code", category_code);
		map.put("start", start);
		map.put("end", end);
		List<ProductVO> list = mybatis.selectList("paging.getProductPerPage_c", map);
		return list;
	}
	
}
