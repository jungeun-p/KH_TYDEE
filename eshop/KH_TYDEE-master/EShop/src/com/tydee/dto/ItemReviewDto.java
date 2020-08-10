package com.tydee.dto;

import java.util.Date;

public class ItemReviewDto {
	private int review_no;
	private int user_no;
	private int item_no;
	private String review_content;
	private String review_image;
	private Date review_regdate;
	private int review_rate;
	private String reivew_delete;
	
	public ItemReviewDto() {}
	public ItemReviewDto(int review_no, int user_no, int item_no, String review_content, String review_image,
			Date review_regdate, int review_rate, String reivew_delete) {
		this.review_no = review_no;
		this.user_no = user_no;
		this.item_no = item_no;
		this.review_content = review_content;
		this.review_image = review_image;
		this.review_regdate = review_regdate;
		this.review_rate = review_rate;
		this.reivew_delete = reivew_delete;
	}
	
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
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
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_image() {
		return review_image;
	}
	public void setReview_image(String review_image) {
		this.review_image = review_image;
	}
	public Date getReview_regdate() {
		return review_regdate;
	}
	public void setReview_regdate(Date review_regdate) {
		this.review_regdate = review_regdate;
	}
	public int getReview_rate() {
		return review_rate;
	}
	public void setReview_rate(int review_rate) {
		this.review_rate = review_rate;
	}
	public String getReivew_delete() {
		return reivew_delete;
	}
	public void setReivew_delete(String reivew_delete) {
		this.reivew_delete = reivew_delete;
	}
}
