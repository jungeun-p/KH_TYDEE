package com.tydee.dto;

import java.util.Date;

public class ItemPurchaseDto {
	private int purhcase_no;
	private int user_no;
	private int item_no;
	private int item_quan;
	private Date purchase_regdate;
	private String item_title;
	private int item_price;
	
	public ItemPurchaseDto() {}
	public ItemPurchaseDto(int purhcase_no, int user_no, int item_no, int item_quan, Date purchase_regdate,
			String item_title, int item_price) {
		this.purhcase_no = purhcase_no;
		this.user_no = user_no;
		this.item_no = item_no;
		this.item_quan = item_quan;
		this.purchase_regdate = purchase_regdate;
		this.item_title = item_title;
		this.item_price = item_price;
	}
	
	public int getPurhcase_no() {
		return purhcase_no;
	}
	public void setPurhcase_no(int purhcase_no) {
		this.purhcase_no = purhcase_no;
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
	public Date getPurchase_regdate() {
		return purchase_regdate;
	}
	public void setPurchase_regdate(Date purchase_regdate) {
		this.purchase_regdate = purchase_regdate;
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
