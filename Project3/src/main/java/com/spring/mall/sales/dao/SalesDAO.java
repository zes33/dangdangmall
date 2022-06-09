package com.spring.mall.sales.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mall.sales.vo.SalesVO;

@Repository
public class SalesDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public SalesDAO() {
		System.out.println(">>SalesDAO() 객체 생성");
	}
	
	//월 매출
	public List<SalesVO> getMonthList(String year){
		return mybatis.selectList("salesDAO.salesMonth", year);
	}
}
