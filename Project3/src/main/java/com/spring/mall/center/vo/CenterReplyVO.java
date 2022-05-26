package com.spring.mall.center.vo;

public class CenterReplyVO {
	private int center_reply_id;
	private String reply_content;
	private int center_qna_id;
	
	public CenterReplyVO() {
		System.out.println(">> CenterReplyVO() 객체 생성~~ ");
	}

	public CenterReplyVO(int center_reply_id, String reply_content, int center_qna_id) {
		super();
		this.center_reply_id = center_reply_id;
		this.reply_content = reply_content;
		this.center_qna_id = center_qna_id;
	}

	public int getCenter_reply_id() {
		return center_reply_id;
	}

	public void setCenter_reply_id(int center_reply_id) {
		this.center_reply_id = center_reply_id;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public int getCenter_qna_id() {
		return center_qna_id;
	}

	public void setCenter_qna_id(int center_qna_id) {
		this.center_qna_id = center_qna_id;
	}

	@Override
	public String toString() {
		return "CenterReplyVO [center_reply_id=" + center_reply_id + ", reply_content=" + reply_content
				+ ", center_qna_id=" + center_qna_id + "]";
	}
	
}
