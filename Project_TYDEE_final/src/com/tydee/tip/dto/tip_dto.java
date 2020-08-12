package com.tydee.tip.dto;

import java.util.Date;

public class tip_dto {
	
	private int tip_no;
	private int user_no;
	private String user_nickname;
	private String tip_title;
	private String tip_content;
	private String tip_summary;
	private String tip_image;	
	private Date tip_regdate;
	private String tip_delete;
	
	public tip_dto() {
		
	}
	

	public tip_dto(int tip_no, int user_no, String user_nickname, String tip_title, String tip_content, String tip_summary,String tip_image, Date tip_regdate, String tip_delete) {
	
		this.tip_no = tip_no;
		this.user_no = user_no;
		this.user_nickname = user_nickname;
		this.tip_title = tip_title;
		this.tip_content = tip_content;
		this.tip_summary = tip_summary;
		this.tip_image = tip_image;
		this.tip_regdate = tip_regdate;
		this.tip_delete = tip_delete;
	}
	

	public tip_dto(int tip_no, int user_no, String tip_title, String tip_content, String tip_summary,String tip_image, Date tip_regdate, String tip_delete) {
	
		this.tip_no = tip_no;
		this.user_no = user_no;
		this.tip_title = tip_title;
		this.tip_content = tip_content;
		this.tip_summary = tip_summary;
		this.tip_image = tip_image;
		this.tip_regdate = tip_regdate;
		this.tip_delete = tip_delete;
	}
	
	
	//insert
	public tip_dto(int user_no, String tip_title, String tip_content, String tip_summary) {
		this.user_no = user_no;
		this.tip_title = tip_title;
		this.tip_content = tip_content;
		this.tip_summary = tip_summary;
	}
	
	public tip_dto(int tip_no) {
		this.tip_no = tip_no;
	}
	
	
	
	//update
	public tip_dto(int tip_no, String tip_title, String tip_content, String tip_summary, String tip_image) {
		
		this.tip_no = tip_no;
		this.tip_title = tip_title;
		this.tip_content = tip_content;
		this.tip_summary = tip_summary;
		this.tip_image = tip_image;
		
	}




	public int getTip_no() {
		return tip_no;
	}

	public void setTip_no(int tip_no) {
		this.tip_no = tip_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	
	public String getTip_title() {
		return tip_title;
	}

	public void setTip_title(String tip_title) {
		this.tip_title = tip_title;
	}

	public String getTip_content() {
		return tip_content;
	}

	public void setTip_content(String tip_content) {
		this.tip_content = tip_content;
	}

	public String getTip_summary() {
		return tip_summary;
	}

	public void setTip_summary(String tip_summary) {
		this.tip_summary = tip_summary;
	}

	public String getTip_image() {
		return tip_image;
	}

	public void setTip_image(String tip_image) {
		this.tip_image = tip_image;
	}

	public Date getTip_regdate() {
		return tip_regdate;
	}

	public void setTip_regdate(Date tip_regdate) {
		this.tip_regdate = tip_regdate;
	}

	public String getTip_delete() {
		return tip_delete;
	}

	public void setTip_delete(String tip_delete) {
		this.tip_delete = tip_delete;
	}


	
}