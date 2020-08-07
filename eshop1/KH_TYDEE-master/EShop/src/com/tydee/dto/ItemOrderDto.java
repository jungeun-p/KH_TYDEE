package com.tydee.dto;

import java.util.Date;

public class ItemOrderDto {
	private int order_no;
	private int user_no;
	private int item_no;
	private int item_quan;
	private Date order_regdate;
	private String item_title;
	private int item_price;
	
	public ItemOrderDto() {}
	public ItemOrderDto(int order_no, int user_no, int item_no, int item_quan, Date order_regdate, String item_title,
			int item_price) {
		this.order_no = order_no;
		this.user_no = user_no;
		this.item_no = item_no;
		this.item_quan = item_quan;
		this.order_regdate = order_regdate;
		this.item_title = item_title;
		this.item_price = item_price;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public int getItem_quan() {
		return item_quan;
	}
	public void setItem_quan(int item_quan) {
		this.item_quan = item_quan;
	}
	public Date getOrder_regdate() {
		return order_regdate;
	}
	public void setOrder_regdate(Date order_regdate) {
		this.order_regdate = order_regdate;
	}
	public String getItem_title() {
		return item_title;
	}
	public void setItem_title(String item_title) {
		this.item_title = item_title;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	
}