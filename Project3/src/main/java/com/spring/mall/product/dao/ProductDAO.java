package com.spring.mall.product.dao;

import java.util.List;

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
	

	
	
//	public void insertProduct(ProductVO vo) {
//		System.out.println("===> MyBatis 사용 insertProduct() 실행");
//		mybatis.insert("productDAO.insertProduct", vo);
//	}
//	
//	public void updateProduct(ProductVO vo) {
//		System.out.println("===> MyBatis 사용 updateProduct() 실행");
//		mybatis.update("productDAO.updateProduct", vo);
//	}
//	
//	public void deleteProduct(ProductVO vo) {
//		System.out.println("===> MyBatis 사용 deleteProduct() 실행");
//		mybatis.delete("productDAO.deleteProduct", vo);
//	}
//	
//	public ProductVO getProduct(ProductVO vo) {
//		System.out.println(">> Mybatis 사용 getProduct() 실행");
//		return mybatis.selectOne("productDAO.getProduct", vo);
//	}
//	
//	public List<ProductVO> getProductList(ProductVO vo) {
//		System.out.println(">> Mybatis 사용 getProductList() 실행");
//		List<ProductVO> list = null;
//		return mybatis.selectList("productDAO.getProductList_N", vo);
//	}
//	
//	public List<ProductVO> getProductList2(ProductVO vo) {
//		System.out.println("===> Mybatis 사용 getProductList() 실행");
//		List<ProductVO> list = null;
//		
//		if (vo.getSearchCondition() == null) {
//			vo.setSearchCondition("PRODUCT_NAME");
//		}
//		if (vo.getSearchKeyword() == null) {
//			vo.setSearchKeyword("");
//		}
//		if ("PRODUCT_NAME".equals(vo.getSearchCondition())) {
//			list = mybatis.selectList("productDAO.getProductList_N", vo.getSearchKeyword());
//		} else if ("PRODUCT_ID".equals(vo.getSearchCondition())) {
//			list = mybatis.selectList("productDAO.getProductList_I", vo.getSearchKeyword());
//		}
//		
//		return list;
//	}
//	
	
	
}
