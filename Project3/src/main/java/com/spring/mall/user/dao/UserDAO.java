package com.spring.mall.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.spring.mall.user.vo.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserDAO() {
		System.out.println(">>UserDAO() 객체 생성");
	}
	
	//user 데이터 한명 조회(로그인 시 사용)
	public UserVO getUser(UserVO vo) {
		System.out.println("MyBatis 사용 getUser() 실행~");
		
		return mybatis.selectOne("userDAO.getUser", vo);
	}
	

}
