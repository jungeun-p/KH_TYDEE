package com.tydee.dto;

public class DistinctDto {
	private int lev;
	private int parent_seq;
	public DistinctDto() {}
	public DistinctDto(int lev, int parent_seq) {
		this.lev = lev;
		this.parent_seq = parent_seq;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getParent_seq() {
		return parent_seq;
	}
	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
	}
}
