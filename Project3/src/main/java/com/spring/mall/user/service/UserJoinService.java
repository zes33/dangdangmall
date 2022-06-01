package com.spring.mall.user.service;

import javax.servlet.http.HttpSession;

import com.spring.mall.user.vo.UserVO;

public interface UserJoinService {
	int insertUser(UserVO vo);

	int idCheck(String user_id);

	void secession(UserVO vo, HttpSession session);

	int passCheck(UserVO vo);
}
