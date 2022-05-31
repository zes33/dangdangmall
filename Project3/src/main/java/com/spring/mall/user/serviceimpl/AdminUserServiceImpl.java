package com.spring.mall.user.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.user.dao.AdminUserDAO;
import com.spring.mall.user.service.AdminUserService;
import com.spring.mall.user.vo.UserVO;

@Service("adminUserService")
public class AdminUserServiceImpl implements AdminUserService{
	@Autowired
	private AdminUserDAO adminUserDAO;
	
	public AdminUserServiceImpl() {
		System.out.println(">> AdminUserServiceImpl() 객체 생성~~");
	}


	@Override
	public void deleteAdminUser(UserVO vo) {
		adminUserDAO.deleteAdminUser(vo);		
	}

	@Override
	public UserVO getAdminUser(UserVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserVO> getAdminUserList(UserVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
