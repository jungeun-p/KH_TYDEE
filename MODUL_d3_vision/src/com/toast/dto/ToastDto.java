package com.toast.dto;

import java.util.Date;

public class ToastDto {
	private int seq;
	private String title;
	private String content;
	private Date regdate;
	public ToastDto() {}
	public ToastDto(int seq, String title, String content, Date regdate) {
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
