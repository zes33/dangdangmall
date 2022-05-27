package com.spring.mall.cart.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mall.cart.vo.CartDetailProductVO;

@Repository
public class CartDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CartDAO() {
		System.out.println(">> CartDAOMybatis() 객체 생성 ");
	}
	
	//장바구니 세부 목록 다 가져오기 
	public List<CartDetailProductVO> getCartList(CartDetailProductVO vo){
		System.out.println(">> getCartList");
		return mybatis.selectList("cartDAO.getCartList",vo);
	}
	
	
}
