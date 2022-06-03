package com.spring.mall.user.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.user.dao.UserDAO;
import com.spring.mall.user.service.UserLoginService;
import com.spring.mall.user.vo.UserVO;

@Service("userLoginService")
public class UserLoginServiceImpl implements UserLoginService{

	@Autowired
	private UserDAO userDAO;
	
	public UserLoginServiceImpl() {
		System.out.println("UserLoginServiceImpl() 객체 생성");
	}
	
	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}

	@Override
	public UserVO gerId(UserVO vo) {
		return userDAO.getId(vo);
	}

	@Override
	public UserVO getPwd(UserVO vo) {
		return userDAO.getPwd(vo);
	}
}
