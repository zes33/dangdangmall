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
	
	//1.관리자 회원목록 출력 
	public List<UserVO> AdminUserList(UserVO vo) {
		return mybatis.selectList("AdminUsersDAO.AdminUserList",vo);
	}
	
	//2. 관리자 회원 상세정보 출력 
	public UserVO selectUser(UserVO vo) {
		return mybatis.selectOne("AdminUsersDAO.selectUser", vo);
	}
	
	//3. 관리자 회원상태 휴먼회원으로 변경(0)
	public void deleteUser(UserVO vo) {
		mybatis.update("AdminUsersDAO.deleteUser", vo);
	}
	
	//4. 회원 아이디, 이름으로 검색 
	public List<UserVO> searchUserList(UserVO vo){
		return mybatis.selectList("AdminUsersDAO.searchUserList", vo);
	}
}
