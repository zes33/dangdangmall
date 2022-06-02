package com.spring.mall.center.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.center.dao.CenterQnaDAO;
import com.spring.mall.center.service.CenterQnaService;
import com.spring.mall.center.vo.CenterQnaVO;

@Service("centerQnaService")
public class CenterQnaServiceImpl implements CenterQnaService{

	@Autowired
	private CenterQnaDAO centerQnaDAO;
	
	public CenterQnaServiceImpl() {
		System.out.println(">> CenterQnaServiceImpl() 객체 생성~");
	}
	
	@Override
	public void insertCenterQna(CenterQnaVO vo) {
		centerQnaDAO.insertCenterQna(vo);
	}

	@Override
	public void updateCenterQna(CenterQnaVO vo) {
		centerQnaDAO.updateCenterQna(vo);
	}

	@Override
	public void deleteCenterQna(CenterQnaVO vo) {
		centerQnaDAO.deleteCenterQna(vo);
	}

	@Override
	public CenterQnaVO getCenterQna(CenterQnaVO vo) {
		return centerQnaDAO.getCenterQna(vo);
	}

	@Override
	public List<CenterQnaVO> getCenterQnaList(CenterQnaVO vo) {
		return centerQnaDAO.getCenterQnaList(vo);
	}

}