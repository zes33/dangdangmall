package com.spring.mall.user.service;

import com.spring.mall.user.vo.UserVO;

public interface UserLoginService {
	UserVO getUser(UserVO vo);
	UserVO gerId(UserVO vo);
	UserVO getPwd(UserVO vo);
}
