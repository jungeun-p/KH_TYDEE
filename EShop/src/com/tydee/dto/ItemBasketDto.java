package com.tydee.dto;

public class ItemBasketDto {
	private int basket_no;
	private int user_no;
	private int item_no;
	private int item_quan;
	private String item_title;
	private int item_price;
	private String item_image;
	private int total_price;
	public ItemBasketDto() {}
	public ItemBasketDto(int basket_no,int item_no) {
		this.basket_no = basket_no;
		this.item_no = item_no;
	}
	public ItemBasketDto(int user_no, int item_no, int item_quan) {
		this.user_no = user_no;
		this.item_no = item_no;
		this.item_quan = item_quan;
	}
	public ItemBasketDto(int basket_no, int user_no, int item_no, int item_quan) {
		this.basket_no = basket_no;
		this.user_no = user_no;
		this.item_no = item_no;
		this.item_quan = item_quan;
	}
	public ItemBasketDto(int basket_no, int user_no, int item_no, int item_quan, String item_title, int item_price, String item_image) {
		this.basket_no = basket_no;
		this.user_no = user_no;
		this.item_no = item_no;
		this.item_quan = item_quan;
		this.item_title = item_title;
		this.item_price = item_price;
		this.item_image = item_image;
	}
	public ItemBasketDto(int basket_no, int user_no, int item_no, int item_quan, String item_title, int item_price,
			String item_image, int total_price) {
		this.basket_no = basket_no;
		this.user_no = user_no;
		this.item_no = item_no;
		this.item_quan = item_quan;
		this.item_title = item_title;
		this.item_price = item_price;
		this.item_image = item_image;
		this.total_price = total_price;
	}
	public int getBasket_no() {
		return basket_no;
	}
	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
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
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getItem_image() {
		return item_image;
	}
	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}
	
}
