package com.spring.mall.cart.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.spring.mall.cart.vo.CartVO;

@Repository
public class CartDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

//	@Inject
//	SqlSession sqlSession;

	public CartDAO() {
		System.out.println(">> CartDAOMybatis() 객체 생성 ");
	}

	// 1. 장바구니 추가
	public void insert(CartVO vo) {
		mybatis.insert("cartDAO.insertCart", vo);
	}

	// 2. 장바구니 목록
	public List<CartVO> listCart(String user_id) {
		return mybatis.selectList("cartDAO.listCart", user_id);
	}
//	public List<CartVO> listCart(CartVO vo) {
//		return mybatis.selectList("cartDAO.listCart", vo);
//	}

	// 3. 장바구니 삭제
	public void delete(int cart_id) {
		mybatis.delete("cartDAO.deleteCart", cart_id);
	}

	// 4. 장바구니 수정
	public void modifyCart(CartVO vo) {
		mybatis.update("cartDAO.modifyCart", vo);
	}

	// 5. 장바구니 금액 합계
	public int sumMoney(String user_id) {
		mybatis.selectOne("cartDAO.sumMoney", user_id);
		return mybatis.selectOne("cartDAO.sumMoney", user_id);
	}

	// 6. 장바구니 동일한 상품 레코드 확인
	public int countCart(int product_id, String user_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product_id", product_id);
		map.put("user_id", user_id);
		return mybatis.selectOne("cartDAO.countCart", map);
	}

	// 7. 장바구니 상품수량 변경
	public void updateCart(CartVO vo) {
		mybatis.update("cartDAO.sumCart", vo);
	}
}
