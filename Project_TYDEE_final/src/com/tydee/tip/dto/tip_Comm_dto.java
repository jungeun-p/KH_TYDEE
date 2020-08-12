package com.tydee.tip.dto;

import java.util.Date;

public class tip_Comm_dto {

	private int tip_comm_no;
	private int tip_no;
	private int user_no;
	private String tip_comm_content;
	private Date tip_comm_regdate;
	private String tip_comm_delete;

	public tip_Comm_dto() {
		
	}
	
	public tip_Comm_dto(int tip_comm_no, int tip_no, int user_no, String tip_comm_content, Date tip_comm_regdate,
			String tip_comm_delete) {
		super();
		this.tip_comm_no = tip_comm_no;
		this.tip_no = tip_no;
		this.user_no = user_no;
		this.tip_comm_content = tip_comm_content;
		this.tip_comm_regdate = tip_comm_regdate;
		this.tip_comm_delete = tip_comm_delete;
	}

	public int getTip_comm_no() {
		return tip_comm_no;
	}

	public void setTip_comm_no(int tip_comm_no) {
		this.tip_comm_no = tip_comm_no;
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

	public String getTip_comm_content() {
		return tip_comm_content;
	}

	public void setTip_comm_content(String tip_comm_content) {
		this.tip_comm_content = tip_comm_content;
	}

	public Date getTip_comm_regdate() {
		return tip_comm_regdate;
	}

	public void setTip_comm_regdate(Date tip_comm_regdate) {
		this.tip_comm_regdate = tip_comm_regdate;
	}

	public String getTip_comm_delete() {
		return tip_comm_delete;
	}

	public void setTip_comm_delete(String tip_comm_delete) {
		this.tip_comm_delete = tip_comm_delete;
	}
	
	
	

}
