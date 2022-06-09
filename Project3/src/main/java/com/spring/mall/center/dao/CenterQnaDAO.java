package com.spring.mall.center.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mall.center.vo.CenterQnaVO;


@Repository
public class CenterQnaDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CenterQnaDAO() {
		System.out.println(">> CenterQnaDAOMybatis() 객체 생성~");
	}
	
	//문의 등록
	public void insertCenterQna(CenterQnaVO vo) {
		System.out.println("===> MyBatis 사용 insertCenterQna() 실행");
		mybatis.insert("centerQnaDAO.insertCenterQna", vo);
	}
	
	//문의 수정
	public void updateCenterQna(CenterQnaVO vo) {
		System.out.println("===> MyBatis 사용 updateCenterQna() 실행");
		mybatis.update("centerQnaDAO.updateCenterQna", vo);
	}
	
	//문의 삭제
	public void deleteCenterQna(CenterQnaVO vo) {
		System.out.println("===> MyBatis 사용 deleteCenterQna() 실행");
		mybatis.delete("centerQnaDAO.deleteCenterQna", vo);
	}
	
	//문의 하나 조회
	public CenterQnaVO selectCenterQna(CenterQnaVO vo) {
		System.out.println("===> MyBatis 사용 selectCenterQna() 실행");
		return mybatis.selectOne("centerQnaDAO.selectCenterQna", vo);
	}
	
	//문의 하나 조회 맵으로
	public Map<String, Object> getCenterQna(CenterQnaVO vo) {
		System.out.println("===> MyBatis 사용 getCenterQna() 실행");
		return mybatis.selectOne("centerQnaDAO.getCenterQna", vo);
	}
		
	//문의 목록 조회
	public List<Map<String, Object>> getCenterQnaList(CenterQnaVO vo) {
		System.out.println("===> MyBatis 사용 getCenterQnaList() 실행");
		List<Map<String, Object>> centerQnaList = mybatis.selectList("centerQnaDAO.getCenterQnaList");
		
		return centerQnaList;
	}
		
	//마이페이지에서 내 문의 목록 조회
	public List<Map<String, Object>> myCenterQna(CenterQnaVO vo) {
		System.out.println("===> MyBatis 사용 myCenterQna() 실행");
		List<Map<String, Object>> myCenterQna = mybatis.selectList("centerQnaDAO.myCenterQna", vo);
		return myCenterQna;
	}
	
	//마이페이지에서 문의 1개 조회
	public Map<String, Object> myCenter(CenterQnaVO vo) {
		System.out.println("===> MyBatis 사용 myCenter() 실행");
		return mybatis.selectOne("centerQnaDAO.myCenter", vo);
	}
}
