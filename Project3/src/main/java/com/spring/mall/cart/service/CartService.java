package com.spring.mall.cart.service;

import java.util.List;

import com.spring.mall.cart.vo.CartDetailProductVO;

public interface CartService {
	//CRUD 구현 
	List<CartDetailProductVO> getCartList(CartDetailProductVO vo);
}
