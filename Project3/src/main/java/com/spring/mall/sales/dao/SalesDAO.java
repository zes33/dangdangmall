package com.spring.mall.sales.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SalesDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public SalesDAO() {
		System.out.println(">>SalesDAO() 객체 생성");
	}
}
