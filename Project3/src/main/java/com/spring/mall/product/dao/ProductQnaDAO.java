package com.spring.mall.product.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mall.product.vo.ProductQnaNickVO;
import com.spring.mall.product.vo.ProductQnaVO;

@Repository
public class ProductQnaDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ProductQnaNickVO> qnaListByProduct(int product_id) {
		System.out.println("ProductQnaDAO.qnaListByProduct() 실행");
		return mybatis.selectList("productQnaDAO.qnaNickByProduct",product_id);
	}
	
	public void insertProductQna(ProductQnaVO vo) {
		System.out.println("ProductQnaDAO.insertProductQna() 실행");
		mybatis.insert("productQnaDAO.insertProductQna", vo);
	}
	
}
