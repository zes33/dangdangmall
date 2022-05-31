package com.spring.mall.product.vo;

public class ProductQnaVO {
	private int qna_id;
	private String qna_content;
	private int product_id;
	private String user_id;
	private int q_or_a;
	private int qna_group_number;
	private int qna_group;
	
	public ProductQnaVO() {
		System.out.println("ProductQnaVO() 객체 생성~");
	}

	@Override
	public String toString() {
		return "ProductQnaVO [qna_id=" + qna_id + ", qna_content=" + qna_content + ", product_id=" + product_id
				+ ", user_id=" + user_id + ", q_or_a=" + q_or_a + ", qna_group_number=" + qna_group_number
				+ ", qna_group=" + qna_group + "]";
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

	public int getQ_or_a() {
		return q_or_a;
	}

	public void setQ_or_a(int q_or_a) {
		this.q_or_a = q_or_a;
	}

	public int getQna_group_number() {
		return qna_group_number;
	}

	public void setQna_group_number(int qna_group_number) {
		this.qna_group_number = qna_group_number;
	}

	public int getQna_group() {
		return qna_group;
	}

	public void setQna_group(int qna_group) {
		this.qna_group = qna_group;
	}
	
	
	
}
