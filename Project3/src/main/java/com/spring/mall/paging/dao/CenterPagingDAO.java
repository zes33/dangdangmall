package com.spring.mall.paging.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mall.center.vo.CenterQnaVO;

@Repository
public class CenterPagingDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CenterPagingDAO() {
		System.out.println("CenterPagingDAO 객체 생성~");
	}
	
	//고객문의 전체 개수
	public int totalCenterQnaCnt() {
		System.out.println("totalCenterQnaCnt() 실행~");
		return mybatis.selectOne("centerPaging.totalCenterQnaCnt");
	}
	
	//고객문의 목록
	public List<Map<String, Object>> pagingCenterQnaList(int start, int end) {
		System.out.println("===> MyBatis 사용 pagingCenterQnaList() 실행");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return mybatis.selectList("centerPaging.CenterQnaPerPage", map);
	}
}
