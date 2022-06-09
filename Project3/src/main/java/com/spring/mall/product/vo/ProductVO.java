package com.spring.mall.product.vo;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
	private int product_id;
	private int category_code;
	private String product_name;
	private int product_price;
	private int product_stock;
	private String product_info;
	private double product_discount;
	private int product_state;
	private String product_pic;
	
	private String searchCondition;
	private String searchKeyword;
	
	private MultipartFile pic_file;
	private MultipartFile info_file;
	
	public ProductVO() {
		System.out.println(">> ProductVO() 객체 생성~~");
	}

	
	
	public ProductVO(int product_id) {
		super();
		this.product_id = product_id;
	}



	public ProductVO(int product_id, int category_code, String product_name, int product_price, int product_stock,
			String product_info, double product_discount) {
		super();
		this.product_id = product_id;
		this.category_code = category_code;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_stock = product_stock;
		this.product_info = product_info;
		this.product_discount = product_discount;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getCategory_code() {
		return category_code;
	}

	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_stock() {
		return product_stock;
	}

	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}

	public String getProduct_info() {
		return product_info;
	}

	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}

	public double getProduct_discount() {
		return product_discount;
	}

	public void setProduct_discount(double product_discount) {
		this.product_discount = product_discount;
	}
	
	public int getProduct_state() {
		return product_state;
	}

	public void setProduct_state(int product_state) {
		this.product_state = product_state;
	}	


		public String getProduct_pic() {
		return product_pic;
	}



	public void setProduct_pic(String product_pic) {
		this.product_pic = product_pic;
	}



		@Override
	public String toString() {
		return "ProductVO [product_id=" + product_id + ", category_code=" + category_code + ", product_name="
				+ product_name + ", product_price=" + product_price + ", product_stock=" + product_stock
				+ ", product_info=" + product_info + ", product_discount=" + product_discount + ", product_state="
				+ product_state + ", product_pic=" + product_pic + ", searchCondition=" + searchCondition
				+ ", searchKeyword=" + searchKeyword + ", pic_file=" + pic_file + ", info_file=" + info_file + "]";
	}



		//-------------------------------
		public String getSearchCondition() {
			return searchCondition;
		}
		public void setSearchCondition(String searchCondition) {
			this.searchCondition = searchCondition;
		}

		public String getSearchKeyword() {
			return searchKeyword;
		}
		public void setSearchKeyword(String searchKeyword) {
			this.searchKeyword = searchKeyword;
		}

		// 파일업로드 관련 ----------------------
		

		public MultipartFile getPic_file() {
		return pic_file;
		}
	
	
	
		public void setPic_file(MultipartFile pic_file) {
			this.pic_file = pic_file;
		}
	
	
	
		public MultipartFile getInfo_file() {
			return info_file;
		}
	
	
	
		public void setInfo_file(MultipartFile info_file) {
			this.info_file = info_file;
		}

}
