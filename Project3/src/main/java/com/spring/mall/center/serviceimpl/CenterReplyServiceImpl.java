package com.spring.mall.center.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.center.dao.CenterReplyDAO;
import com.spring.mall.center.service.CenterReplyService;
import com.spring.mall.center.vo.CenterReplyVO;

@Service("centerReplyService")
public class CenterReplyServiceImpl implements CenterReplyService{
	
	@Autowired
	private CenterReplyDAO centerReplyDAO;
	
	public CenterReplyServiceImpl() {
		System.out.println(">> CenterReplyServiceImpl() 객체 생성~");
	}
	
	@Override
	public void insertCenterReply(CenterReplyVO vo) {
		centerReplyDAO.insertCenterReply(vo);
	}

	@Override
	public void updateCenterReply(CenterReplyVO vo) {
		centerReplyDAO.updateCenterReply(vo);
	}

	@Override
	public void deleteCenterReply(CenterReplyVO vo) {
		centerReplyDAO.deleteCenterReply(vo);
	}

	@Override
	public CenterReplyVO getCenterReply(CenterReplyVO vo) {
		return centerReplyDAO.getCenterReply(vo);
	}

	@Override
	public List<CenterReplyVO> getCenterReplyList(CenterReplyVO vo) {
		return centerReplyDAO.getCenterReplyList(vo);
	}

}
