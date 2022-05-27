package com.spring.mall.cart.service;

import java.util.List;

import com.spring.mall.cart.vo.CartDetailVO;
import com.spring.mall.cart.vo.CartVO;

public interface CartService {
	//CRUD 구현 
	void getCartId(CartVO vo);
	void insertCart(CartDetailVO vo);
	void updateCart(CartDetailVO vo);
	void deleteCart(CartDetailVO vo);
	CartDetailVO getCart(CartDetailVO vo);
	List<CartDetailVO> getCartList(CartDetailVO vo);
}
