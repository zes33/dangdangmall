package com.spring.mall.pay.vo;

public class NOrderRefundVO {
	private int n_refund_id;
	private String n_refund_reason;
	private int n_refund_status;
	private int n_order_detail_id;
	
	public NOrderRefundVO() {
		System.out.println(">> NRefundIdVO() 객체 생성~~");
	}

	public NOrderRefundVO(int n_refund_id, String n_refund_reason, int n_refund_status, int n_order_detail_id) {
		super();
		this.n_refund_id = n_refund_id;
		this.n_refund_reason = n_refund_reason;
		this.n_refund_status = n_refund_status;
		this.n_order_detail_id = n_order_detail_id;
	}

	public int getN_refund_id() {
		return n_refund_id;
	}

	public void setN_refund_id(int n_refund_id) {
		this.n_refund_id = n_refund_id;
	}

	public String getN_refund_reason() {
		return n_refund_reason;
	}

	public void setN_refund_reason(String n_refund_reason) {
		this.n_refund_reason = n_refund_reason;
	}

	public int getN_refund_status() {
		return n_refund_status;
	}

	public void setN_refund_status(int n_refund_status) {
		this.n_refund_status = n_refund_status;
	}

	public int getN_order_detail_id() {
		return n_order_detail_id;
	}

	public void setN_order_detail_id(int n_order_detail_id) {
		this.n_order_detail_id = n_order_detail_id;
	}

	@Override
	public String toString() {
		return "NRefundIdVO [n_refund_id=" + n_refund_id + ", n_refund_reason=" + n_refund_reason + ", n_refund_status="
				+ n_refund_status + ", n_order_detail_id=" + n_order_detail_id + "]";
	}
	
	
}
