package com.spring.mall.user.dao;

import javax.servlet.http.HttpSession;

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
	
	//user insert(회원가입 시 사용)
	public int insertUser(UserVO vo) {
		System.out.println("MyBatis 사용 insertUser() 실행~");
		
		return mybatis.insert("userDAO.insertUser", vo);
	}
	
	//id찾기
	public UserVO getId(UserVO vo) {
		System.out.println("vo : " + vo);
		
		return mybatis.selectOne("userDAO.getId", vo);
	}
	
	//비밀번호 찾기
	public UserVO getPwd(UserVO vo) {
		
		return mybatis.selectOne("userDAO.getPwd", vo);
	}
	
	//아이디 체크
	public int idCheck(String user_id) {
		System.out.println("===> Mybatis로 idCheck");
		int result = mybatis.selectOne("userDAO.idCheck",user_id);
		return result;
	}

	//패스워드 체크
	public int passCheck(UserVO vo) {
		int result=mybatis.selectOne("userDAO.loginCheck",vo);

		return result;
	}

	// 회원탈퇴
	public void secession(UserVO vo, HttpSession session) {

		mybatis.update("userDAO.secession", vo);
		// 세션 삭제
		session.invalidate();
	}
	
	//회원 정보 수정
	public void updateInfo(UserVO vo) {
		mybatis.update("userDAO.updateInfo", vo);
	}
	
	//아이디에 해당하는 비번 찾기
	public String userPWCheck(UserVO vo) {
		return mybatis.selectOne("userDAO.userPWCheck", vo);
	}
	

}
