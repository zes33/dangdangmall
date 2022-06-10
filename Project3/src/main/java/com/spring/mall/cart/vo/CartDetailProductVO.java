package com.spring.mall.cart.vo;

public class CartDetailProductVO {
	private int cart_detail_id; // 장바구니 상세번호
	private int cart_detail_cnt; // 장바구니 상세상품 수량
	private int product_id; // 상품번호

	private int cart_id; // 장바구니 아이디
	private String user_id; // 회원아이디
	private String n_user_ip; // 비회원 아이피

	private int category_code; // 상품 카테고리
	private String product_name;// 상품명
	private int product_price; // 상품 가격
	private int product_stock; // 상품 재고
	private String product_info; // 상품 설명
	private int product_discount; // 상품 할인율
	private int product_state; // 상품 상태
	private String product_pic; // 상품이미지 이름 
	
	//추가 
    private int salePrice;
	private int totalPrice;
	

	public CartDetailProductVO() {
		System.out.println(">> CartDetailProductVO() 객체 생성 ");
	}

	public int getCart_detail_id() {
		return cart_detail_id;
	}

	public void setCart_detail_id(int cart_detail_id) {
		this.cart_detail_id = cart_detail_id;
	}

	public int getCart_detail_cnt() {
		return cart_detail_cnt;
	}

	public void setCart_detail_cnt(int cart_detail_cnt) {
		this.cart_detail_cnt = cart_detail_cnt;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
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

	public int getCategory_code() {
		return category_code;
	}

	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_stock() {
		return product_stock;
	}

	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}

	public String getProduct_info() {
		return product_info;
	}

	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}

	public int getProduct_discount() {
		return product_discount;
	}

	public void setProduct_discount(int product_discount) {
		this.product_discount = product_discount;
	}

	public int getProduct_state() {
		return product_state;
	}

	public void setProduct_state(int product_state) {
		this.product_state = product_state;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public void initSaleTotal() {
		this.salePrice = (int) (this.product_price * (1-this.product_discount));
		this.totalPrice = this.salePrice*this.cart_detail_cnt;
	}
	
	
	public String getProduct_pic() {
		return product_pic;
	}

	public void setProduct_pic(String product_pic) {
		this.product_pic = product_pic;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	@Override
	public String toString() {
		return "CartDetailProductVO [cart_detail_id=" + cart_detail_id + ", cart_detail_cnt=" + cart_detail_cnt
				+ ", product_id=" + product_id + ", cart_id=" + cart_id + ", user_id=" + user_id + ", n_user_ip="
				+ n_user_ip + ", category_code=" + category_code + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_stock=" + product_stock + ", product_info=" + product_info
				+ ", product_discount=" + product_discount + ", product_state=" + product_state + ", product_pic="
				+ product_pic + ", salePrice=" + salePrice + ", totalPrice=" + totalPrice + "]";
	}

	
	

}
