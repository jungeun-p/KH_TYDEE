package com.tydee.dto;

import java.util.Date;

public class ItemTotalDto {
	private int order_no;
	private String order_title;
	private int user_no;
	private int address_no;
	private String merchant_uid;
	private int item_no;
	private int item_quan;
	private int item_price;
	private int item_total_price;
	private Date order_regdate;
	private String item_title;
	private String item_image;
	private String user_name;
	private String user_phone;
	private String user_address_first;
	private String user_address_second;
	private String user_address_extra;
	private String user_postcode;
	
	public ItemTotalDto() {	}
	public ItemTotalDto(int order_no, String order_title, int user_no, int address_no, String merchant_uid, int item_no,
			int item_quan, int item_price, int item_total_price, Date order_regdate, String item_title,
			String item_image, String user_name, String user_phone, String user_address_first,
			String user_address_second, String user_address_extra, String user_postcode) {
		this.order_no = order_no;
		this.order_title = order_title;
		this.user_no = user_no;
		this.address_no = address_no;
		this.merchant_uid = merchant_uid;
		this.item_no = item_no;
		this.item_quan = item_quan;
		this.item_price = item_price;
		this.item_total_price = item_total_price;
		this.order_regdate = order_regdate;
		this.item_title = item_title;
		this.item_image = item_image;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_address_first = user_address_first;
		this.user_address_second = user_address_second;
		this.user_address_extra = user_address_extra;
		this.user_postcode = user_postcode;
	}

	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public String getOrder_title() {
		return order_title;
	}
	public void setOrder_title(String order_title) {
		this.order_title = order_title;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getAddress_no() {
		return address_no;
	}
	public void setAddress_no(int address_no) {
		this.address_no = address_no;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
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
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public int getItem_total_price() {
		return item_total_price;
	}
	public void setItem_total_price(int item_total_price) {
		this.item_total_price = item_total_price;
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
	public String getItem_image() {
		return item_image;
	}
	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_address_first() {
		return user_address_first;
	}
	public void setUser_address_first(String user_address_first) {
		this.user_address_first = user_address_first;
	}
	public String getUser_address_second() {
		return user_address_second;
	}
	public void setUser_address_second(String user_address_second) {
		this.user_address_second = user_address_second;
	}
	public String getUser_address_extra() {
		return user_address_extra;
	}
	public void setUser_address_extra(String user_address_extra) {
		this.user_address_extra = user_address_extra;
	}
	public String getUser_postcode() {
		return user_postcode;
	}
	public void setUser_postcode(String user_postcode) {
		this.user_postcode = user_postcode;
	}
	
}
