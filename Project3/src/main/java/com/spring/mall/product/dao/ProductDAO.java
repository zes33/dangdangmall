package com.spring.mall.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mall.product.vo.ProductVO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public ProductDAO() {
		System.out.println(">> ProductDAOMybatis() 객체 생성");
	}
	
	public List<ProductVO> getProductList_c(int category){
		System.out.println("===> MyBatis 사용 getFoodList() 실행");
		List<ProductVO> list = mybatis.selectList("productDAO.getProductLists_c",category);
		return list;
	}
	
	public List<ProductVO> getProductList_admin(ProductVO vo){
		System.out.println("===> MyBatis 사용 getProductList_admin() 실행");
		List<ProductVO> list = mybatis.selectList("productDAO.getProductList");
		return list;
	}
	
	public ProductVO getProduct(ProductVO vo) {
		System.out.println(">> Mybatis 사용 getProduct() 실행");
		return mybatis.selectOne("productDAO.getProduct", vo);
	}
	
	
	public void insertProduct(ProductVO vo) {
		System.out.println("===> MyBatis 사용 insertProduct() 실행");
		mybatis.insert("productDAO.insertProduct", vo);
	}
	
	// 관리자 상품목록 게시글 수
	public int adminProductTotCnt(String searchCondition, String searchKeyword, 
								String prd_category, String prd_state) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", searchKeyword);
		map.put("prd_category", prd_category);
		map.put("prd_state", prd_state);
		System.out.println("===> MyBatis 사용 adminProductTotCnt() 실행");
		return mybatis.selectOne("productDAO.adminProductTotCnt",map);
	}
	
	// 관리자 상품목록
	public List<Map<String, Object>> adminProductList(String searchCondition, String searchKeyword, 
								String prd_category, String prd_state, String start, String end){
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", searchKeyword);
		map.put("prd_category", prd_category);
		map.put("prd_state", prd_state);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("productDAO.adminProductList",map);
	}
	
	public void updateProduct(ProductVO vo) {
		System.out.println("===> MyBatis 사용 updateProduct() 실행");
		mybatis.update("productDAO.updateProduct", vo);
	}
	
}
