package com.spring.mall.user.service;

import java.util.List;

import com.spring.mall.user.vo.UserVO;

public interface AdminUserService {
	void deleteAdminUser(UserVO vo);
	UserVO getAdminUser(UserVO vo);
	List<UserVO> getAdminUserList(UserVO vo);
}
