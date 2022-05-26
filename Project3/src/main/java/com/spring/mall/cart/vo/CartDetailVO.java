package com.spring.mall.cart.vo;

public class CartDetailVO {
	private int card_detail_id; //장바구니 상세번호 
	private int cart_detail_cnt; //장바구니 상세상품 수량
	private int cart_id; //장바구니 
	private int product_id; //상품번호
	
	public CartDetailVO() {
		System.out.println(">> CartDetailVO() 객체 생성~~");
	}
	
	public CartDetailVO(int card_detail_id, int cart_detail_cnt, int cart_id, int product_id) {
		super();
		this.card_detail_id = card_detail_id;
		this.cart_detail_cnt = cart_detail_cnt;
		this.cart_id = cart_id;
		this.product_id = product_id;
	}

	public int getCard_detail_id() {
		return card_detail_id;
	}

	public void setCard_detail_id(int card_detail_id) {
		this.card_detail_id = card_detail_id;
	}

	public int getCart_detail_cnt() {
		return cart_detail_cnt;
	}

	public void setCart_detail_cnt(int cart_detail_cnt) {
		this.cart_detail_cnt = cart_detail_cnt;
	}

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	@Override
	public String toString() {
		return "CartDetailVO [card_detail_id=" + card_detail_id + ", cart_detail_cnt=" + cart_detail_cnt + ", cart_id="
				+ cart_id + ", product_id=" + product_id + "]";
	}
	
	
}
