package com.tydee.dto;

import java.util.Date;

public class MyTydeeDto {
	private int tiny_no;
	private int user_no;
	private String tiny_type;
	private String tiny_title;
	private int tiny_depth;
	private String tiny_content;
	private String tiny_image;
	private Date tiny_regdate;
	private String user_nickname;
	private int lev;
	public MyTydeeDto() {}
	public MyTydeeDto(int tiny_no, int user_no) {
		this.tiny_no = tiny_no;
		this.user_no = user_no;
	}
	public MyTydeeDto(int lev, int tiny_no, String tiny_title) {
		this.lev = lev;
		this.tiny_no = tiny_no;
		this.tiny_title = tiny_title;
	}
	public MyTydeeDto(int tiny_no, int user_no, String tiny_title, String tiny_content) {
		this.tiny_no = tiny_no;
		this.user_no = user_no;
		this.tiny_title = tiny_title;
		this.tiny_content = tiny_content;
	}
	public MyTydeeDto (int user_no, String tiny_type, String tiny_title, int tiny_depth, String tiny_content, String tiny_image) {
		this.user_no = user_no;
		this.tiny_type = tiny_type;
		this.tiny_title = tiny_title;
		this.tiny_depth = tiny_depth;
		this.tiny_content = tiny_content;
		this.tiny_image = tiny_image;
	}
	public MyTydeeDto(int tiny_no, int user_no, String tiny_title, int tiny_depth, String tiny_content, 
			String tiny_image, Date tiny_regdate) {
		this.tiny_no = tiny_no;
		this.user_no = user_no;
		this.tiny_title = tiny_title;
		this.tiny_depth = tiny_depth;
		this.tiny_content = tiny_content;
		this.tiny_image = tiny_image;
		this.tiny_regdate = tiny_regdate;
	}
	public MyTydeeDto(int tiny_no, int user_no, String tiny_type, String tiny_title, int tiny_depth,
			String tiny_content, String tiny_image, Date tiny_regdate, String user_nickname, int lev) {
		super();
		this.tiny_no = tiny_no;
		this.user_no = user_no;
		this.tiny_type = tiny_type;
		this.tiny_title = tiny_title;
		this.tiny_depth = tiny_depth;
		this.tiny_content = tiny_content;
		this.tiny_image = tiny_image;
		this.tiny_regdate = tiny_regdate;
		this.user_nickname = user_nickname;
		this.lev = lev;
	}
	
	public int getTiny_no() {
		return tiny_no;
	}
	public void setTiny_no(int tiny_no) {
		this.tiny_no = tiny_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getTiny_type() {
		return tiny_type;
	}
	public void setTiny_type(String tiny_type) {
		this.tiny_type = tiny_type;
	}
	public String getTiny_title() {
		return tiny_title;
	}
	public void setTiny_title(String tiny_title) {
		this.tiny_title = tiny_title;
	}
	public int getTiny_depth() {
		return tiny_depth;
	}
	public void setTiny_depth(int tiny_depth) {
		this.tiny_depth = tiny_depth;
	}
	public String getTiny_content() {
		return tiny_content;
	}
	public void setTiny_content(String tiny_content) {
		this.tiny_content = tiny_content;
	}
	public String getTiny_image() {
		return tiny_image;
	}
	public void setTiny_image(String tiny_image) {
		this.tiny_image = tiny_image;
	}
	public Date getTiny_regdate() {
		return tiny_regdate;
	}
	public void setTiny_regdate(Date tiny_regdate) {
		this.tiny_regdate = tiny_regdate;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	
}
