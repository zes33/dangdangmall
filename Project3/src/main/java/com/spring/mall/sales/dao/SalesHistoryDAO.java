package com.spring.mall.sales.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mall.sales.vo.SalesVO;
import com.spring.mall.user.vo.MyInfoVO;

@Repository
public class SalesHistoryDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public SalesHistoryDAO() {
		System.out.println(">> SalesHistoryDAO() 객체 생성");
	}
	
	//판매리스트 
	public List<MyInfoVO> getHistoryAll(MyInfoVO vo){
		return mybatis.selectList("salesHistoryDAO.getHistoryAll", vo);
	}
	
	//상세 주문 리스트 
	public List<MyInfoVO> historyOne(String order_id){
		return mybatis.selectList("salesHistoryDAO.historyOne", order_id);
	}
	
}
