package com.spring.mall.center.service;

import java.util.List;

import com.spring.mall.center.vo.CenterReplyVO;

public interface CenterReplyService {
	void insertCenterReply(CenterReplyVO vo);
	void updateCenterReply(CenterReplyVO vo);
	void deleteCenterReply(CenterReplyVO vo);
	CenterReplyVO getCenterReply(CenterReplyVO vo);
	List<CenterReplyVO> getCenterReplyList(CenterReplyVO vo);
}
