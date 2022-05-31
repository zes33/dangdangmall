package com.spring.mall.user.vo;

public class MyInfoVO {

	//USER_ORDER 테이블 
	private int order_id;
	private String order_date;
	private String order_addr;
	private String order_addr_d;
	private String order_zipcode;
	private String order_receiver;
	private String order_phone;
	private int order_total;
	private int user_status;
	private String user_id;
	
	//USERORDER_DETAIL 테이블
	private int order_detail_id;
	private int user_order_cnt;
	private int product_id;
	
	//PRODUCT 테이블
	private int category_code;
	private String product_name;
	private int product_price;
	private int product_stock;
	private String product_info;
	private int product_discount;
	private int product_state;
	
	
	public MyInfoVO(int order_id, String order_date, String order_addr, String order_addr_d, String order_zipcode,
			String order_receiver, String order_phone, int order_total, int user_status, String user_id,
			int order_detail_id, int user_order_cnt, int product_id, int category_code, String product_name,
			int product_price, int product_stock, String product_info, int product_discount, int product_state) {
		super();
		this.order_id = order_id;
		this.order_date = order_date;
		this.order_addr = order_addr;
		this.order_addr_d = order_addr_d;
		this.order_zipcode = order_zipcode;
		this.order_receiver = order_receiver;
		this.order_phone = order_phone;
		this.order_total = order_total;
		this.user_status = user_status;
		this.user_id = user_id;
		this.order_detail_id = order_detail_id;
		this.user_order_cnt = user_order_cnt;
		this.product_id = product_id;
		this.category_code = category_code;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_stock = product_stock;
		this.product_info = product_info;
		this.product_discount = product_discount;
		this.product_state = product_state;
	}


	public int getOrder_id() {
		return order_id;
	}


	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}


	public String getOrder_date() {
		return order_date;
	}


	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}


	public String getOrder_addr() {
		return order_addr;
	}


	public void setOrder_addr(String order_addr) {
		this.order_addr = order_addr;
	}


	public String getOrder_addr_d() {
		return order_addr_d;
	}


	public void setOrder_addr_d(String order_addr_d) {
		this.order_addr_d = order_addr_d;
	}


	public String getOrder_zipcode() {
		return order_zipcode;
	}


	public void setOrder_zipcode(String order_zipcode) {
		this.order_zipcode = order_zipcode;
	}


	public String getOrder_receiver() {
		return order_receiver;
	}


	public void setOrder_receiver(String order_receiver) {
		this.order_receiver = order_receiver;
	}


	public String getOrder_phone() {
		return order_phone;
	}


	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}


	public int getOrder_total() {
		return order_total;
	}


	public void setOrder_total(int order_total) {
		this.order_total = order_total;
	}


	public int getUser_status() {
		return user_status;
	}


	public void setUser_status(int user_status) {
		this.user_status = user_status;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public int getOrder_detail_id() {
		return order_detail_id;
	}


	public void setOrder_detail_id(int order_detail_id) {
		this.order_detail_id = order_detail_id;
	}


	public int getUser_order_cnt() {
		return user_order_cnt;
	}


	public void setUser_order_cnt(int user_order_cnt) {
		this.user_order_cnt = user_order_cnt;
	}


	public int getProduct_id() {
		return product_id;
	}


	public void setProduct_id(int product_id) {
		this.product_id = product_id;
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


	@Override
	public String toString() {
		return "MyInfoVO [order_id=" + order_id + ", order_date=" + order_date + ", order_addr=" + order_addr
				+ ", order_addr_d=" + order_addr_d + ", order_zipcode=" + order_zipcode + ", order_receiver="
				+ order_receiver + ", order_phone=" + order_phone + ", order_total=" + order_total + ", user_status="
				+ user_status + ", user_id=" + user_id + ", order_detail_id=" + order_detail_id + ", user_order_cnt="
				+ user_order_cnt + ", product_id=" + product_id + ", category_code=" + category_code + ", product_name="
				+ product_name + ", product_price=" + product_price + ", product_stock=" + product_stock
				+ ", product_info=" + product_info + ", product_discount=" + product_discount + ", product_state="
				+ product_state + "]";
	}
}
