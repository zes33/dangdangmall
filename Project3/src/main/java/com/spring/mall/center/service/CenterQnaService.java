package com.spring.mall.center.service;

import java.util.List;

import com.spring.mall.center.vo.CenterQnaVO;

public interface CenterQnaService {
	void insertCenterQna(CenterQnaVO vo);
	void updateCenterQna(CenterQnaVO vo);
	void deleteCenterQna(CenterQnaVO vo);
	CenterQnaVO getCenterQna(CenterQnaVO vo);
	List<CenterQnaVO> getCenterQnaList(CenterQnaVO vo);
}
