package com.spring.mall.order.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mall.user.vo.MyInfoVO;

@Repository
public class UserOrderDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserOrderDAO() {
		System.out.println(">>UserOrderDAO() 객체 생성");
	}
	
	//내가 구매한 목록 조회
	@PostMapping("/getMyOrderList.do")
	public List<MyInfoVO> getMyOrder(String user_id){
		System.out.println(">>내 주문내역 보여주기");
		
		return mybatis.selectList("userOrderDAO.getMyOrder", user_id);
	}
}
