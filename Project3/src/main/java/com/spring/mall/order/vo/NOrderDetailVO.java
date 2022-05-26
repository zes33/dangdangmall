package com.spring.mall.order.vo;

public class NOrderDetailVO {
	private int n_order_detail_id;
	private int n_user_order_cnt;
	private int product_id;
	private int n_order_id;
	
	public NOrderDetailVO() {
		System.out.println(">> NOrderDetailVO() 객체 생성~~");
	}

	public NOrderDetailVO(int n_order_detail_id, int n_user_order_cnt, int product_id, int n_order_id) {
		super();
		this.n_order_detail_id = n_order_detail_id;
		this.n_user_order_cnt = n_user_order_cnt;
		this.product_id = product_id;
		this.n_order_id = n_order_id;
	}

	public int getN_order_detail_id() {
		return n_order_detail_id;
	}

	public void setN_order_detail_id(int n_order_detail_id) {
		this.n_order_detail_id = n_order_detail_id;
	}

	public int getN_user_order_cnt() {
		return n_user_order_cnt;
	}

	public void setN_user_order_cnt(int n_user_order_cnt) {
		this.n_user_order_cnt = n_user_order_cnt;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getN_order_id() {
		return n_order_id;
	}

	public void setN_order_id(int n_order_id) {
		this.n_order_id = n_order_id;
	}

	@Override
	public String toString() {
		return "NOrderDetailVO [n_order_detail_id=" + n_order_detail_id + ", n_user_order_cnt=" + n_user_order_cnt
				+ ", product_id=" + product_id + ", n_order_id=" + n_order_id + "]";
	}
	
	
}
