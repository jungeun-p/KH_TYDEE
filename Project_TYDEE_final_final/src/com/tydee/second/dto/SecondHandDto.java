package com.tydee.second.dto;

import java.util.Date;

public class SecondHandDto {

	private int sec_no;
	private int user_no;
	private String sec_title;
	private String sec_content;
	private String sec_price;
	private String sec_image;
	private Date sec_regdate;
	private String sec_delete;
	
	

	public SecondHandDto() {
		
		
	}



	public SecondHandDto(int sec_no, int user_no, String sec_title, String sec_content, String sec_price,
			String sec_image, Date sec_regdate, String sec_delete) {
		
		this.sec_no = sec_no;
		this.user_no = user_no;
		this.sec_title = sec_title;
		this.sec_content = sec_content;
		this.sec_price = sec_price;
		this.sec_image = sec_image;
		this.sec_regdate = sec_regdate;
		this.sec_delete = sec_delete;
	}



	public int getSec_no() {
		return sec_no;
	}



	public void setSec_no(int sec_no) {
		this.sec_no = sec_no;
	}



	public int getUser_no() {
		return user_no;
	}



	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}



	public String getSec_title() {
		return sec_title;
	}



	public void setSec_title(String sec_title) {
		this.sec_title = sec_title;
	}



	public String getSec_content() {
		return sec_content;
	}



	public void setSec_content(String sec_content) {
		this.sec_content = sec_content;
	}



	public String getSec_price() {
		return sec_price;
	}



	public void setSec_price(String sec_price) {
		this.sec_price = sec_price;
	}



	public String getSec_image() {
		return sec_image;
	}



	public void setSec_image(String sec_image) {
		this.sec_image = sec_image;
	}



	public Date getSec_regdate() {
		return sec_regdate;
	}



	public void setSec_regdate(Date sec_regdate) {
		this.sec_regdate = sec_regdate;
	}



	public String getSec_delete() {
		return sec_delete;
	}



	public void setSec_delete(String sec_delete) {
		this.sec_delete = sec_delete;
	}
	
	
	
	
}