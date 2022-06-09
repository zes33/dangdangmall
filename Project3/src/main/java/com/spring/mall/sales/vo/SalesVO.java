package com.spring.mall.sales.vo;

public class SalesVO {
	private String year;
	private String month;
	private String day;
	private int total;
	
	public SalesVO() {
		System.out.println(">>SalesVO() 객체 생성");
	}

	public SalesVO(String year, String month, String day, int total) {
		super();
		this.year = year;
		this.month = month;
		this.day = day;
		this.total = total;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "SalesVO [year=" + year + ", month=" + month + ", day=" + day + ", total=" + total + "]";
	}
	
}
