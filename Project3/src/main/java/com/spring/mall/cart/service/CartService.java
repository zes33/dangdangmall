package com.spring.mall.cart.service;

import java.util.List;

import com.spring.mall.cart.vo.CartDetailVO;

public interface CartService {
	//CRUD 구현 
	void insertCart(CartDetailVO vo);
	void updateCart(CartDetailVO vo);
	void deleteCart(CartDetailVO vo);
	List<CartDetailVO> getCartList(CartDetailVO vo);
}
