package com.tydee.tip.dao;

import java.util.List;

import com.tydee.tip.dto.tip_dto;




public class tip_biz {
	
	private tip_dao dao = new tip_dao();
	
	public List<tip_dto> selectList(){
		
		return dao.selectList();
	}
	public tip_dto selectOne(int tip_no) {
		return dao.selectOne(tip_no);
		
	}
	public int insert(tip_dto dto) {
		return dao.insert(dto);
		
	}
	public int update(tip_dto dto) {
		return dao.update(dto);
		
	}
	public int delete(int tip_no) {
		return dao.delete(tip_no);
	}
}
