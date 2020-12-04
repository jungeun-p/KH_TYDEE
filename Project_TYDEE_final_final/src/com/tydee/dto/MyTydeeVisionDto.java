package com.tydee.dto;

import java.util.Date;

public class MyTydeeVisionDto {
	private int vision_no;
	private int user_no;
	private String vision_text;
	private Date vision_regdate;
	public MyTydeeVisionDto() {}
	public MyTydeeVisionDto(int user_no, String vision_text) {
		this.user_no = user_no;
		this.vision_text = vision_text;
	}
	public MyTydeeVisionDto(int vision_no, int user_no, String vision_text, Date vision_regdate) {
		this.vision_no = vision_no;
		this.user_no = user_no;
		this.vision_text = vision_text;
		this.vision_regdate = vision_regdate;
	}
	public int getVision_no() {
		return vision_no;
	}
	public void setVision_no(int vision_no) {
		this.vision_no = vision_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getVision_text() {
		return vision_text;
	}
	public void setVision_text(String vision_text) {
		this.vision_text = vision_text;
	}
	public Date getVision_regdate() {
		return vision_regdate;
	}
	public void setVision_regdate(Date vision_regdate) {
		this.vision_regdate = vision_regdate;
	}
	
}
