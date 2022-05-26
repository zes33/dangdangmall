package com.spring.mall.product.vo;

public class ProductReplyVO {
	private int product_reply_id;
	private String product_reply_content;
	private int qna_id;
	
	public ProductReplyVO() {
		System.out.println(">> ProductReplyVO() 객체 생성~~");
	}

	public ProductReplyVO(int product_reply_id, String product_reply_content, int qna_id) {
		super();
		this.product_reply_id = product_reply_id;
		this.product_reply_content = product_reply_content;
		this.qna_id = qna_id;
	}

	public int getProduct_reply_id() {
		return product_reply_id;
	}

	public void setProduct_reply_id(int product_reply_id) {
		this.product_reply_id = product_reply_id;
	}

	public String getProduct_reply_content() {
		return product_reply_content;
	}

	public void setProduct_reply_content(String product_reply_content) {
		this.product_reply_content = product_reply_content;
	}

	public int getQna_id() {
		return qna_id;
	}

	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
	}

	@Override
	public String toString() {
		return "ProductReplyVO [product_reply_id=" + product_reply_id + ", product_reply_content="
				+ product_reply_content + ", qna_id=" + qna_id + "]";
	}
	
	
}
