package com.spring.mall.pay.vo;

public class UserOrderRefundVO {
	private int refund_id;
	private String refund_reason;
	private int refund_status;
	private int order_detail_id;
	
	public UserOrderRefundVO() {
		System.out.println(">> UserOrderRefundVO() 객체 생성~~");
	}

	public UserOrderRefundVO(int refund_id, String refund_reason, int refund_status, int order_detail_id) {
		super();
		this.refund_id = refund_id;
		this.refund_reason = refund_reason;
		this.refund_status = refund_status;
		this.order_detail_id = order_detail_id;
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

	@Override
	public String toString() {
		return "UserOrderRefundVO [refund_id=" + refund_id + ", refund_reason=" + refund_reason + ", refund_status="
				+ refund_status + ", order_detail_id=" + order_detail_id + "]";
	}
	
	
}
