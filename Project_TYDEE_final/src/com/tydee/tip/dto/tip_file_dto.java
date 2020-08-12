package com.tydee.tip.dto;

public class tip_file_dto {
	
	private int file_no;
	private String board_type;
	private String file_name;
	public tip_file_dto(int file_no, String board_type, String file_name) {
		super();
		this.file_no = file_no;
		this.board_type = board_type;
		this.file_name = file_name;
	}
	public tip_file_dto() {
		
	}
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	
	

}
