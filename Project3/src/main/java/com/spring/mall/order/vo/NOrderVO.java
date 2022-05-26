package com.spring.mall.order.vo;

import java.sql.Date;

public class NOrderVO {
	private int n_order_id;
	private Date n_order_date;
	private String n_order_addr;
	private String n_order_addr_d;
	private String n_order_zipcode;
	private String n_order_receiver;
	private String n_order_phone;
	private int n_order_total;
	private int n_user_status;
	
	public NOrderVO() {
		System.out.println(">> NOrderVO() 객체 생성~~");
	}

	public NOrderVO(int n_order_id, Date n_order_date, String n_order_addr, String n_order_addr_d,
			String n_order_zipcode, String n_order_receiver, String n_order_phone, int n_order_total,
			int n_user_status) {
		super();
		this.n_order_id = n_order_id;
		this.n_order_date = n_order_date;
		this.n_order_addr = n_order_addr;
		this.n_order_addr_d = n_order_addr_d;
		this.n_order_zipcode = n_order_zipcode;
		this.n_order_receiver = n_order_receiver;
		this.n_order_phone = n_order_phone;
		this.n_order_total = n_order_total;
		this.n_user_status = n_user_status;
	}

	public int getN_order_id() {
		return n_order_id;
	}

	public void setN_order_id(int n_order_id) {
		this.n_order_id = n_order_id;
	}

	public Date getN_order_date() {
		return n_order_date;
	}

	public void setN_order_date(Date n_order_date) {
		this.n_order_date = n_order_date;
	}

	public String getN_order_addr() {
		return n_order_addr;
	}

	public void setN_order_addr(String n_order_addr) {
		this.n_order_addr = n_order_addr;
	}

	public String getN_order_addr_d() {
		return n_order_addr_d;
	}

	public void setN_order_addr_d(String n_order_addr_d) {
		this.n_order_addr_d = n_order_addr_d;
	}

	public String getN_order_zipcode() {
		return n_order_zipcode;
	}

	public void setN_order_zipcode(String n_order_zipcode) {
		this.n_order_zipcode = n_order_zipcode;
	}

	public String getN_order_receiver() {
		return n_order_receiver;
	}

	public void setN_order_receiver(String n_order_receiver) {
		this.n_order_receiver = n_order_receiver;
	}

	public String getN_order_phone() {
		return n_order_phone;
	}

	public void setN_order_phone(String n_order_phone) {
		this.n_order_phone = n_order_phone;
	}

	public int getN_order_total() {
		return n_order_total;
	}

	public void setN_order_total(int n_order_total) {
		this.n_order_total = n_order_total;
	}

	public int getN_user_status() {
		return n_user_status;
	}

	public void setN_user_status(int n_user_status) {
		this.n_user_status = n_user_status;
	}

	@Override
	public String toString() {
		return "NOrderVO [n_order_id=" + n_order_id + ", n_order_date=" + n_order_date + ", n_order_addr="
				+ n_order_addr + ", n_order_addr_d=" + n_order_addr_d + ", n_order_zipcode=" + n_order_zipcode
				+ ", n_order_receiver=" + n_order_receiver + ", n_order_phone=" + n_order_phone + ", n_order_total="
				+ n_order_total + ", n_user_status=" + n_user_status + "]";
	}
	
}
