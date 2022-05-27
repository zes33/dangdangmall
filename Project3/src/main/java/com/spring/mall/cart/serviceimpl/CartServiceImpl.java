package com.spring.mall.cart.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.cart.dao.CartDAO;
import com.spring.mall.cart.service.CartService;
import com.spring.mall.cart.vo.CartDetailProductVO;

@Service("cartService")
public class CartServiceImpl implements CartService{
	
	
	@Autowired
	private CartDAO cartDAO;

	public CartServiceImpl() {
		System.out.println(">> CartServiceImpl() 객체 생성 ");
	}

	@Override
	public List<CartDetailProductVO> getCartList(CartDetailProductVO vo) {
		return cartDAO.getCartList(vo);
	}
	
	

}
