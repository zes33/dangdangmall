package com.spring.mall.product.vo;

public class ProductQnaVO {
	private int qna_id;
	private String qna_content;
	private int product_id;
	private String user_id;
	
	public ProductQnaVO() {
		System.out.println(">> ProductQnaVO() 객체 생성~~");
	}
	


	public ProductQnaVO(int qna_id, String qna_content, int product_id, String user_id) {
		super();
		this.qna_id = qna_id;
		this.qna_content = qna_content;
		this.product_id = product_id;
		this.user_id = user_id;
	}

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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "ProductQnaVO [qna_id=" + qna_id + ", qna_content=" + qna_content + ", product_id=" + product_id
				+ ", user_id=" + user_id + "]";
	}
	
	
}
