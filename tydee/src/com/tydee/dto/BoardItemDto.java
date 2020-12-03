package com.tydee.dto;

import java.util.Date;

public class BoardItemDto {
	private int item_no;
	private String item_category;
	private String item_title;
	private String item_content;
	private String item_image;
	private int item_price;
	private Date item_regdate;
	private String item_active;
	private int item_quan;
	public BoardItemDto() {}
	public BoardItemDto(String item_category) {
		this.item_category = item_category;
	}
	public BoardItemDto(int item_no, String item_category, String item_title, String item_content, String item_image, int item_price) {
		this.item_no = item_no;
		this.item_category = item_category;
		this.item_title = item_title;
		this.item_content = item_content;
		this.item_image = item_image;
		this.item_price = item_price;
	}
	public BoardItemDto(String item_category, String item_title, String item_content, String item_image, int item_price) {
		this.item_category = item_category;
		this.item_title = item_title;
		this.item_content = item_content;
		this.item_image = item_image;
		this.item_price = item_price;
	}
	public BoardItemDto(int item_no, String item_category, String item_title, String item_content,
			String item_image, int item_price, Date item_regdate, String item_active, int item_quan) {
		this.item_no = item_no;
		this.item_category = item_category;
		this.item_title = item_title;
		this.item_content = item_content;
		this.item_image = item_image;
		this.item_price = item_price;
		this.item_regdate = item_regdate;
		this.item_active = item_active;
		this.item_quan = item_quan;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public String getItem_category() {
		return item_category;
	}
	public void setItem_category(String item_category) {
		this.item_category = item_category;
	}
	public String getItem_title() {
		return item_title;
	}
	public void setItem_title(String item_title) {
		this.item_title = item_title;
	}
	public String getItem_content() {
		return item_content;
	}
	public void setItem_content(String item_content) {
		this.item_content = item_content;
	}
	public String getItem_image() {
		return item_image;
	}
	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public Date getItem_regdate() {
		return item_regdate;
	}
	public void setItem_regdate(Date item_regdate) {
		this.item_regdate = item_regdate;
	}
	public String getItem_active() {
		return item_active;
	}
	public void setItem_active(String item_active) {
		this.item_active = item_active;
	}
	public int getItem_quan() {
		return item_quan;
	}
	public void setItem_quan(int item_quan) {
		this.item_quan = item_quan;
	}
	
}
