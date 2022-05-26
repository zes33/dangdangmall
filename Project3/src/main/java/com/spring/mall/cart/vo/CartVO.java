package com.spring.mall.cart.vo;

public class CartVO {
	private int cart_id;
	private String user_id;
	private String n_user_ip;
	
	public CartVO() {
		System.out.println(">> CartVO() 객체 생성~~ ");
	}
	
	public CartVO(int cart_id, String user_id, String n_user_ip) {
		super();
		this.cart_id = cart_id;
		this.user_id = user_id;
		this.n_user_ip = n_user_ip;
	}
	
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getN_user_ip() {
		return n_user_ip;
	}
	public void setN_user_ip(String n_user_ip) {
		this.n_user_ip = n_user_ip;
	}

	@Override
	public String toString() {
		return "CartVO [cart_id=" + cart_id + ", user_id=" + user_id + ", n_user_ip=" + n_user_ip + "]";
	}
	
	
	
}
