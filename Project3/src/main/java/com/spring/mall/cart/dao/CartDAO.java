package com.spring.mall.cart.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mall.cart.vo.CartDetailProductVO;
import com.spring.mall.cart.vo.CartDetailVO;
import com.spring.mall.cart.vo.CartVO;

@Repository
public class CartDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CartDAO() {
		System.out.println(">> CartDAOMybatis() 객체 생성 ");
	}
	// 회원아이디로 장바구니 아이디 체크 
	public CartVO getCartId(CartVO vo) {
		System.out.println(">> getCartId() 객체 생성 ");
		return mybatis.selectOne("cartDAO.getCartId", vo);
	}
	
	// 카트 안에 해당 상품이 있는지 확인
	public CartDetailVO checkCart(CartDetailVO vo) {
		System.out.println(">> checkCart() 객체 생성 ");
		return mybatis.selectOne("cartDAO.checkCart", vo);
	}
	
	// 장바구니 세부 목록 다 가져오기 
	public List<CartDetailProductVO> getCartList(CartDetailProductVO vo){
		System.out.println(">> getCartList() 객체 생성 ");
		return mybatis.selectList("cartDAO.getCartList",vo);
	}
	
	// 카트 세부상품 추가
	public void addCart(CartDetailVO vo) {
		System.out.println(">> addCart() 실행");
		mybatis.insert("cartDAO.addCart", vo);
	}
	
	// 카트 세부 상품 삭제
	public void deleteCart(CartDetailVO vo) {
		System.out.println(">> deleteCart() 실행");
		 mybatis.delete("cartDAO.deleteCart", vo);
	}
	
	// 카트 세부 상품 수량 수정
	public void updateCount(CartDetailVO vo) {
		System.out.println(">> updateCount() 실행");
		 mybatis.update("cartDAO.updateCount", vo);
	}
}
