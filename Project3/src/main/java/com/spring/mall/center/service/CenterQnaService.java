package com.spring.mall.center.service;

import java.util.List;
import java.util.Map;

import com.spring.mall.center.vo.CenterQnaVO;

public interface CenterQnaService {
	void insertCenterQna(CenterQnaVO vo);
	void updateCenterQna(CenterQnaVO vo);
	void deleteCenterQna(CenterQnaVO vo);
	CenterQnaVO selectCenterQna(CenterQnaVO vo);
	Map<String, Object> getCenterQna(CenterQnaVO vo);
	List<Map<String, Object>> getCenterQnaList(CenterQnaVO vo);
}
