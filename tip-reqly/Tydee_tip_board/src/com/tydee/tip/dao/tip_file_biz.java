package com.tydee.tip.dao;

import java.util.List;

import com.tydee.tip.dto.tip_file_dto;

public class tip_file_biz {
	
	private tip_file_dao dao = new tip_file_dao();
	
	public List<tip_file_dto> selectList(){
		
		return dao.selectList();
	}
	public tip_file_dto selectOne(int seq) {
		return dao.selectOne(seq);
		
	}
	public int insert(tip_file_dto dto) {
		return dao.insert(dto);
		
	}
	public int update(tip_file_dto dto) {
		return dao.update(dto);
		
	}
	public int delete(int seq) {
		return dao.delete(seq);
	}

}
