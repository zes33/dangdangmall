package com.spring.mall.product.vo;

public class ProductQnaNickVO {
	private int qna_id;
	private String qna_content;
	private int product_id;
	private String user_nickname;
	
	
	public int getQna_id() {
		return qna_id;
	}
	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	@Override
	public String toString() {
		return "ProductQnaNick [qna_id=" + qna_id + ", qna_content=" + qna_content + ", product_id=" + product_id
				+ ", user_nickname=" + user_nickname + "]";
	}
	
	
}
