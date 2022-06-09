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
	public int TotalCenterQna() {
		System.out.println("===> MyBatis 사용 TotalCenterQna() 실행~");
		return mybatis.selectOne("centerPaging.TotalCenterQna");
	}
	
	//고객문의 페이징+검색
	public List<Map<String, Object>> CenterQnaPerPageSearch(String searchCondition, String searchKeyword,
			int start, int end) {
		System.out.println("===> MyBatis 사용 CenterQnaPerPageSearch() 실행");
		List<Map<String, Object>> list = null;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		//검색조건 값이 없을 때 기본값 설정
		if (searchCondition == null) {
			searchCondition = "TITLE";
		}
		if (searchCondition == "") {
			searchCondition = "TITLE";
		}
		if (searchKeyword == null) {
			searchKeyword = "";
		}
		
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", searchKeyword);
		
		if ("TITLE".equals(searchCondition)) {
			list = mybatis.selectList("centerPaging.CenterQnaPerPageSearch", map);
		} else if ("CONTENT".equals(searchCondition)) {
			list = mybatis.selectList("centerPaging.CenterQnaPerPageSearch", map);
		}
		
		return list;
	}
	
	//고객문의 페이징+검색 출력수
	public int TotalCenterQnaPerPageSearch(String searchCondition, String searchKeyword) {
		System.out.println("===> MyBatis 사용 TotalCenterQnaPerPageSearch() 실행~");
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", searchKeyword);
		System.out.println("map" + map);
		return mybatis.selectOne("centerPaging.TotalCenterQnaPerPageSearch", map);
	}
	
	//고객문의 목록 - 검색기능이 완벽해지면 pagingCenterQnaList메서드는 지워도 됨
//	public List<Map<String, Object>> pagingCenterQnaList(int start, int end) {
//		System.out.println("===> MyBatis 사용 pagingCenterQnaList() 실행");
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("start", start);
//		map.put("end", end);
//		
//		return mybatis.selectList("centerPaging.CenterQnaPerPage", map);
//	}
}
