package com.spring.mall.user.serviceimpl;

import javax.servlet.http.HttpSession;

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

	@Override
	public int idCheck(String user_id) {
		
		int result = userDAO.idCheck(user_id);
		return result;
	}

	@Override
	public int passCheck(UserVO vo) {
		int result = userDAO.passCheck(vo);
		return result;
	}

	@Override
	public void secession(UserVO vo,HttpSession session) {
		userDAO.secession(vo,session);
	}

}
