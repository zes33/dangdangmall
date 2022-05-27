package com.spring.mall.cart.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class CartDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CartDAO() {
		System.out.println(">> CartDAOMybatis() 객체 생성 ");
	}
	
	
}
