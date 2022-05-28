package com.spring.mall.cart.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mall.cart.dao.CartDAO;
import com.spring.mall.cart.service.CartService;
import com.spring.mall.cart.vo.CartDetailProductVO;
import com.spring.mall.cart.vo.CartDetailVO;
import com.spring.mall.cart.vo.CartVO;

@Service("cartService")
public class CartServiceImpl implements CartService{
	
	
	@Autowired
	private CartDAO cartDAO;

	public CartServiceImpl() {
		System.out.println(">> CartServiceImpl() 객체 생성 ");
	}

	//추가 
	//회원아이디로 장바구니 아이디 체크
	@Override
	public CartVO getCartId(CartVO vo) {
		return cartDAO.getCartId(vo);
	}

	// 카트 안에 해당 상품이 있는지 확인
	@Override
	public CartDetailVO checkCart(CartDetailVO vo) {
		return cartDAO.checkCart(vo);
	}
	
	//장바구니 아이디로  장바구니 세부 상품 리스트로 받아오기 
	@Override
	public List<CartDetailProductVO> getCartList(CartDetailProductVO vo) {
		return cartDAO.getCartList(vo);
	}
	
	// 카트 세부상품 추가
	@Override
	public void addCart(CartDetailVO vo) {
		cartDAO.addCart(vo);
	}
	
	// 카트 세부 상품 삭제
	@Override
	public void deleteCart(CartDetailVO vo) {
		cartDAO.deleteCart(vo);
	}

	// 카트 세부 상품 수량 수정
	@Override
	public void updateCount(CartDetailVO vo) {
		cartDAO.updateCount(vo);;
	}

	


	

}
