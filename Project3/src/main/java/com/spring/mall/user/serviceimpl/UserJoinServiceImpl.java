package com.spring.mall.user.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.user.dao.UserDAO;
import com.spring.mall.user.service.UserJoinService;
import com.spring.mall.user.vo.UserVO;

@Service("userJoinService")
public class UserJoinServiceImpl implements UserJoinService{

	@Autowired
	private UserDAO userDAO;
	
	public UserJoinServiceImpl() {
		System.out.println("UserJoinServiceImpl() 객체 생성");
	}
	
	@Override
	public int insertUser(UserVO vo) {
		
		return userDAO.insertUser(vo);
	}

}
