package com.spring.mall.user.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mall.user.vo.UserVO;

@Repository
public class AdminUserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public AdminUserDAO() {
		System.out.println(">> AdminUserDAO() 객체 생성~");
	}
	
	public void deleteAdminUser(UserVO vo) {
		System.out.println("===> MyBatis 사용 deleteAdminUser() 실행");
		mybatis.delete("adminUserDAO.deleteAdminUser", vo);
	}
	
	public List<UserVO> getAdminUserList(UserVO vo) {
		System.out.println("===> MyBatis 사용 getAdminUserList() 실행");
		List<UserVO> list = null;
		return mybatis.selectList("adminUserDAO.getAdminUserList", vo);
	}
	
	public UserVO getAdminUser(UserVO vo) {
		System.out.println("===>> Mybatis 사용 getAdminUser() 실행");
		return mybatis.selectOne("adminUserDAO.getAdminUser", vo);
	}
}
