package com.tydee.second.dto;

import java.util.Date;

public class SecondCommDto {

	private int sec_comm_no;
	private int sec_no;
	private int user_no;
	private String sec_comm_content;
	private Date sec_comm_regdate;
	private String sec_comm_delete;
	
	
	public SecondCommDto() {
		
	}


	public SecondCommDto(int sec_comm_no, int sec_no, int user_no, String sec_comm_content, Date sec_comm_regdate,
			String sec_comm_delete) {

		this.sec_comm_no = sec_comm_no;
		this.sec_no = sec_no;
		this.user_no = user_no;
		this.sec_comm_content = sec_comm_content;
		this.sec_comm_regdate = sec_comm_regdate;
		this.sec_comm_delete = sec_comm_delete;
	}


	public int getSec_comm_no() {
		return sec_comm_no;
	}


	public void setSec_comm_no(int sec_comm_no) {
		this.sec_comm_no = sec_comm_no;
	}


	public int getSec_no() {
		return sec_no;
	}


	public void setSec_no(int sec_no) {
		this.sec_no = sec_no;
	}


	public int getUser_no() {
		return user_no;
	}


	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}


	public String getSec_comm_content() {
		return sec_comm_content;
	}


	public void setSec_comm_content(String sec_comm_content) {
		this.sec_comm_content = sec_comm_content;
	}


	public Date getSec_comm_regdate() {
		return sec_comm_regdate;
	}


	public void setSec_comm_regdate(Date sec_comm_regdate) {
		this.sec_comm_regdate = sec_comm_regdate;
	}


	public String getSec_comm_delete() {
		return sec_comm_delete;
	}


	public void setSec_comm_delete(String sec_comm_delete) {
		this.sec_comm_delete = sec_comm_delete;
	}

	
	
	
	
}
