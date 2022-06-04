package com.spring.mall.center.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mall.center.vo.CenterReplyVO;

@Repository
public class CenterReplyDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CenterReplyDAO() {
		System.out.println(">> CenterReplyDAOMybatis() 객체 생성~");
	}
	
	//답변 등록
	public void insertCenterReply(CenterReplyVO vo) {
		System.out.println("===> MyBatis 사용 insertCenterReply() 실행");
		mybatis.insert("centerReplyDAO.insertCenterReply", vo);
	}
	
	//답변 수정
	public void updateCenterReply(CenterReplyVO vo) {
		System.out.println("===> MyBatis 사용 updateCenterReply() 실행");
		mybatis.update("centerReplyDAO.updateCenterReply", vo);
	}
	
	//답변 삭제
	public void deleteCenterReply(CenterReplyVO vo) {
		System.out.println("===> MyBatis 사용 deleteCenterReply() 실행");
		mybatis.delete("centerReplyDAO.deleteCenterReply", vo);
	}
	
	//답변 하나 조회
	public CenterReplyVO getCenterReply(CenterReplyVO vo) {
		System.out.println("===> MyBatis 사용 getCenterReply() 실행");
		return mybatis.selectOne("centerReplyDAO.getCenterReply", vo);
	}
	
	//답변 목록 조회
	public List<CenterReplyVO> getCenterReplyList(CenterReplyVO vo) {
		System.out.println("===> MyBatis 사용 getCenterReplyList() 실행");
		List<CenterReplyVO> list = null;
		return mybatis.selectList("centerReplyDAO.getCenterReply_T", vo);
	}
	
//	//답변 목록 조회 - 제목 또는 작성자 닉네임으로 검색
//		public List<CenterReplyVO> getCenterReplyList2(CenterReplyVO vo) {
//			System.out.println("===> Mybatis 사용 getBoardList() 실행");
//			List<BoardVO> list = null;
//			
//			// 검색조건 값이 없을 때 기본값 설정
//			if (vo.getSearchCondition() == null) {
//				vo.setSearchCondition("TITLE");
//			}
//			if (vo.getSearchKeyword() == null) {
//				vo.setSearchKeyword("");
//			}
//			if ("TITLE".equals(vo.getSearchCondition())) {
//				list = mybatis.selectList("boardDAO.getBoardList_T", vo.getSearchKeyword());
//			} else if ("CONTENT".equals(vo.getSearchCondition())) {
//				list = mybatis.selectList("boardDAO.getBoardList_C", vo.getSearchKeyword());
//			}
//			
//			return list;
//		}
}
