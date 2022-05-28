package com.spring.mall.cart.service;

import java.util.List;

import com.spring.mall.cart.vo.CartDetailProductVO;
import com.spring.mall.cart.vo.CartDetailVO;
import com.spring.mall.cart.vo.CartVO;

public interface CartService {
	//CRUD 구현 
	
	
	//카트 추가 
	public void addCart(CartDetailVO vo);
	
	// 카트 삭제 
	public void deleteCart(CartDetailVO vo);
	
	// 카트 수량 수정 
	public void updateCount(CartDetailVO vo);
	
	/* 카트 목록 
	public List<CartDetailProductVO> getCartList(String user_id);	*/
	public List<CartDetailProductVO> getCartList(CartDetailProductVO vo);
	
	// 카트 안에 해당 상품이 있는지 확인 
	public CartDetailVO checkCart(CartDetailVO vo);

	// 회원아이디로 장바구니 아이디 체크
	public CartVO getCartId(CartVO vo);

	
	
}
