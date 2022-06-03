package com.spring.mall.pay.vo;

import java.util.Date;

public class RefundTotalVO {
	
	//USER_ORDER 테이블
	private String order_id;
	private Date order_date;
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
	
	//USERORDER_REFUND 테이블
	private int refund_id;
	private String refund_reason;
	private int refund_status;
	
	//PRODUCT 테이블
	private String product_name;
	
	public RefundTotalVO() {
		System.out.println("RefundTotalVO() 객체 생성");
	}

	public RefundTotalVO(String order_id, Date order_date, String order_addr, String order_addr_d, String order_zipcode,
			String order_receiver, String order_phone, int order_total, int user_status, String user_id,
			int order_detail_id, int user_order_cnt, int product_id, int refund_id, String refund_reason,
			int refund_status, String product_name) {
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
		this.refund_id = refund_id;
		this.refund_reason = refund_reason;
		this.refund_status = refund_status;
		this.product_name = product_name;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
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

	public int getRefund_id() {
		return refund_id;
	}

	public void setRefund_id(int refund_id) {
		this.refund_id = refund_id;
	}

	public String getRefund_reason() {
		return refund_reason;
	}

	public void setRefund_reason(String refund_reason) {
		this.refund_reason = refund_reason;
	}

	public int getRefund_status() {
		return refund_status;
	}

	public void setRefund_status(int refund_status) {
		this.refund_status = refund_status;
	}

	@Override
	public String toString() {
		return "RefundTotalVO [order_id=" + order_id + ", order_date=" + order_date + ", order_addr=" + order_addr
				+ ", order_addr_d=" + order_addr_d + ", order_zipcode=" + order_zipcode + ", order_receiver="
				+ order_receiver + ", order_phone=" + order_phone + ", order_total=" + order_total + ", user_status="
				+ user_status + ", user_id=" + user_id + ", order_detail_id=" + order_detail_id + ", user_order_cnt="
				+ user_order_cnt + ", product_id=" + product_id + ", refund_id=" + refund_id + ", refund_reason="
				+ refund_reason + ", refund_status=" + refund_status + ", product_name=" + product_name + "]";
	}

	
}
