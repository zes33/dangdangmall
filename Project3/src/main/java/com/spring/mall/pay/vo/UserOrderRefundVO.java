package com.spring.mall.pay.vo;

import java.util.Date;

public class UserOrderRefundVO {
	private int refund_id;
	private String refund_reason;
	private int refund_status;
	private int order_detail_id;
	private Date refund_date;
	private double refund_total;
	
	
	public UserOrderRefundVO() {
		System.out.println(">> UserOrderRefundVO() 객체 생성~~");
	}


	public UserOrderRefundVO(int refund_id, String refund_reason, int refund_status, int order_detail_id,
			Date refund_date, double refund_total) {
		super();
		this.refund_id = refund_id;
		this.refund_reason = refund_reason;
		this.refund_status = refund_status;
		this.order_detail_id = order_detail_id;
		this.refund_date = refund_date;
		this.refund_total = refund_total;
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


	public int getOrder_detail_id() {
		return order_detail_id;
	}


	public void setOrder_detail_id(int order_detail_id) {
		this.order_detail_id = order_detail_id;
	}


	public Date getRefund_date() {
		return refund_date;
	}


	public void setRefund_date(Date refund_date) {
		this.refund_date = refund_date;
	}


	public double getRefund_total() {
		return refund_total;
	}


	public void setRefund_total(double refund_total) {
		this.refund_total = refund_total;
	}


	@Override
	public String toString() {
		return "UserOrderRefundVO [refund_id=" + refund_id + ", refund_reason=" + refund_reason + ", refund_status="
				+ refund_status + ", order_detail_id=" + order_detail_id + ", refund_date=" + refund_date
				+ ", refund_total=" + refund_total + "]";
	}

	
}
