package com.tydee.dto;

public class UserAddressDto {
	private int address_no;
	private int user_no;
	private String user_name;
	private String user_phone;
	private String user_address_first;
	private String user_address_second;
	private String user_postalcode;
	
	public UserAddressDto() {}
	public UserAddressDto(int address_no, int user_no, String user_name, String user_phone, String user_address_first,
			String user_address_second, String user_postalcode) {
		this.address_no = address_no;
		this.user_no = user_no;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_address_first = user_address_first;
		this.user_address_second = user_address_second;
		this.user_postalcode = user_postalcode;
	}
	
	public int getAddress_no() {
		return address_no;
	}
	public void setAddress_no(int address_no) {
		this.address_no = address_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_address_first() {
		return user_address_first;
	}
	public void setUser_address_first(String user_address_first) {
		this.user_address_first = user_address_first;
	}
	public String getUser_address_second() {
		return user_address_second;
	}
	public void setUser_address_second(String user_address_second) {
		this.user_address_second = user_address_second;
	}
	public String getUser_postalcode() {
		return user_postalcode;
	}
	public void setUser_postalcode(String user_postalcode) {
		this.user_postalcode = user_postalcode;
	}
}
