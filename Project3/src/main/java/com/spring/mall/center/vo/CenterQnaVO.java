package com.spring.mall.center.vo;

import java.sql.Date;

public class CenterQnaVO {
	private int center_qna_id;
	private String center_qna_content;
	private String center_qna_title;
	private String user_id;
	private Date center_qna_date;
	
	public CenterQnaVO() {
		System.out.println(">> CenterQnaVO() 객체 생성~~ ");
	}

	public CenterQnaVO(int center_qna_id, String center_qna_content, String center_qna_title, String user_id,
			Date center_qna_date) {
		super();
		this.center_qna_id = center_qna_id;
		this.center_qna_content = center_qna_content;
		this.center_qna_title = center_qna_title;
		this.user_id = user_id;
		this.center_qna_date = center_qna_date;
	}

	public int getCenter_qna_id() {
		return center_qna_id;
	}

	public void setCenter_qna_id(int center_qna_id) {
		this.center_qna_id = center_qna_id;
	}

	public String getCenter_qna_content() {
		return center_qna_content;
	}

	public void setCenter_qna_content(String center_qna_content) {
		this.center_qna_content = center_qna_content;
	}

	public String getCenter_qna_title() {
		return center_qna_title;
	}

	public void setCenter_qna_title(String center_qna_title) {
		this.center_qna_title = center_qna_title;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getCenter_qna_date() {
		return center_qna_date;
	}

	public void setCenter_qna_date(Date center_qna_date) {
		this.center_qna_date = center_qna_date;
	}

	@Override
	public String toString() {
		return "CenterQnaVO [center_qna_id=" + center_qna_id + ", center_qna_content=" + center_qna_content
				+ ", center_qna_title=" + center_qna_title + ", user_id=" + user_id + ", center_qna_date="
				+ center_qna_date + "]";
	}


}
