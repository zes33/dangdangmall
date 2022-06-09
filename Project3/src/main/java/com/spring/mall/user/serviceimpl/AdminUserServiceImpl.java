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

	//1.관리자 회원목록 출력 
	@Override
	public List<UserVO> AdminUserList(UserVO vo) {
		return adminUserDAO.AdminUserList(vo);
	}

	//2. 관리자 회원 상세목록 출력 
	@Override
	public UserVO selectUser(UserVO vo) {
		return adminUserDAO.selectUser(vo);
	}

	//3. 관리자 회원상태 휴먼회원으로 변경(0)
	@Override
	public void deleteUser(UserVO vo) {
		adminUserDAO.deleteUser(vo);
	}


	
	
}
