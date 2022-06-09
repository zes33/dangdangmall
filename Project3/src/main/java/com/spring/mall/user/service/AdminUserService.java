package com.spring.mall.user.service;

import java.util.List;

import com.spring.mall.user.vo.UserVO;

public interface AdminUserService {
	
	//1.관리자 회원목록 출력 
	public List<UserVO> AdminUserList(UserVO vo);
	
	//2. 관리자 회원 상세목록 출력 
	public UserVO selectUser(UserVO vo);
	
	//3. 관리자 회원상태 휴먼회원으로 변경(0)
	public void deleteUser(UserVO vo);
}
