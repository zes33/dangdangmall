package com.spring.mall.product.vo;

public class ReviewVO {
	private int review_id;
	private String review_content;
	private int review_grade;
	private int order_detail_id;
	
	public ReviewVO() {
		System.out.println(">> ReviewVO() 객체 생성~~");
	}

	public ReviewVO(int review_id, String review_content, int review_grade, int order_detail_id) {
		super();
		this.review_id = review_id;
		this.review_content = review_content;
		this.review_grade = review_grade;
		this.order_detail_id = order_detail_id;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getReview_grade() {
		return review_grade;
	}

	public void setReview_grade(int review_grade) {
		this.review_grade = review_grade;
	}

	public int getOrder_detail_id() {
		return order_detail_id;
	}

	public void setOrder_detail_id(int order_detail_id) {
		this.order_detail_id = order_detail_id;
	}

	@Override
	public String toString() {
		return "ReviewVO [review_id=" + review_id + ", review_content=" + review_content + ", review_grade="
				+ review_grade + ", order_detail_id=" + order_detail_id + "]";
	}
	
	
}
