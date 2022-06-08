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
		System.out.println("===> MyBatis 사용 totalCenterQnaCnt() 실행~");
		return mybatis.selectOne("centerPaging.totalCenterQnaCnt");
	}
	
	//고객문의 목록 - 검색기능이 완벽해지면 pagingCenterQnaList메서드는 지워도 됨
	public List<Map<String, Object>> pagingCenterQnaList(int start, int end) {
		System.out.println("===> MyBatis 사용 pagingCenterQnaList() 실행");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return mybatis.selectList("centerPaging.CenterQnaPerPage", map);
	}
	
	//고객문의 목록 - 검색기능 추가
	public List<Map<String, Object>> pagingCenterQnaListSearch(CenterQnaVO vo, int startInt, int endInt) {
		System.out.println("===> MyBatis 사용 pagingCenterQnaListSearch() 실행");
		List<Map<String, Object>> list = null;
		
		//페이징 처리를 위해 매퍼에 인자를 전달할 map 선언하고, string으로 강제형변환
		Map<String, String> map = new HashMap<String, String>();
		String start = Integer.toString(startInt);
		String end = Integer.toString(endInt);
		map.put("start", start);
		map.put("end", end);
		
		//검색조건 값이 없을 때 기본값 설정
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("TITLE");
		}
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		
		map.put("searchKeyword",vo.getSearchKeyword());
		
		if ("TITLE".equals(vo.getSearchCondition())) {
			list = mybatis.selectList("centerPaging.CenterQnaPerPageSearch_T", map);
		} else if ("CONTENT".equals(vo.getSearchCondition())) {
			list = mybatis.selectList("centerPaging.CenterQnaPerPageSearch_C", map);
		}
		
		return list;
	}
	
	//고객문의 전체 개수 - 제목으로 검색
	public int totalCenterQnaCnt_T() {
		System.out.println("===> MyBatis 사용 totalCenterQnaCnt_T() 실행~");
		return mybatis.selectOne("centerPaging.totalCenterQnaCnt_T");
	}
	
	//고객문의 전체 개수 - 내용으로 검색
	public int totalCenterQnaCnt_C() {
		System.out.println("===> MyBatis 사용 totalCenterQnaCnt_T() 실행~");
		return mybatis.selectOne("centerPaging.totalCenterQnaCnt_C");
	}
}
