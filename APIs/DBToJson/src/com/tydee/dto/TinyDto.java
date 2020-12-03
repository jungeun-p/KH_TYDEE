package com.tydee.dto;

import java.sql.Date;

public class TinyDto {
	private int seq;
	private String name;
	private int parent_seq;
	private Date regdate;
	private int lev;
	public TinyDto () {}
	public TinyDto(int seq, String name, int parent_seq, Date regdate) {
		this.seq = seq;
		this.name = name;
		this.parent_seq = parent_seq;
		this.regdate = regdate;
	}
	public TinyDto(int seq, String name, int parent_seq, Date regdate, int lev) {
		this.seq = seq;
		this.name = name;
		this.parent_seq = parent_seq;
		this.regdate = regdate;
		this.lev = lev;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getParent_seq() {
		return parent_seq;
	}
	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
}
