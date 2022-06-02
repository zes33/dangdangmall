package com.spring.mall.order.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mall.cart.vo.CartVO;
import com.spring.mall.order.vo.UserOrderDetailVO;
import com.spring.mall.order.vo.UserOrderVO;
import com.spring.mall.pay.vo.PaymentVO;
import com.spring.mall.user.vo.UserVO;


@Repository
public class OrderDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public OrderDAO() {
		System.out.println(">> OrderDAO() 객체 생성 ");
	}
	
	//1. 주문 정보 입력 
	public void insertOrder(UserOrderVO vo) {
		mybatis.insert("orderDAO.insertOrder",vo);
	}
	
	//2. 주문 상세 정보 입력
	public void insertOrderDetail(UserOrderDetailVO vo) {
		mybatis.insert("orderDAO.insertOrderDetail", vo);
	}
	
	//3. 카트 삭제 
	public void cartAllDelete(String user_id) {
		mybatis.delete("orderDAO.cartAllDelete",user_id);
	}
	
	//4. 결제창에서 쓰일 최근 주문 정보 가져오기
	public UserOrderVO getOrder(String user_id, String order_id) {
		Map<String, String> orderMap = new HashMap<String, String>();
		orderMap.put("user_id", user_id);
		orderMap.put("order_id", order_id);
		return mybatis.selectOne("orderDAO.getOrder", orderMap);
	}
// 4-1 주문 정보 입력폼, 주문자 주소록 가져오기
//	public UserVO getUserAddr(String user_id) {
//		return mybatis.selectOne("orderDAO.getUserAddr", user_id);
//	}
	
	
	//5. 주문 완료 후, 결제 테이블로 넘기기 
	public void insertPayment(PaymentVO vo) {
		mybatis.insert("orderDAO.insertPayment",vo);
	}
}
