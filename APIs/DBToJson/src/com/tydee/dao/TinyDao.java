package com.tydee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.tydee.dto.DistinctDto;
import com.tydee.dto.TinyDto;

public class TinyDao extends SqlMapConfig {
	private String namespace = "tydeemapper.";
	public List<TinyDto> selectList(){
		SqlSession session = null;
		List<TinyDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	public List<TinyDto> selectListWithLev(){
		SqlSession session = null;
		List<TinyDto> list = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectListWithLev");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	public List<DistinctDto> selectDistinct(){
		SqlSession session = null;
		List<DistinctDto> list = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectDistinct");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	public List<TinyDto> selectListParentSeq(int parent_seq){
		SqlSession session = null;
		List<TinyDto> list = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectListParentSeq", parent_seq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	public TinyDto selectOneSeq(int seq){
		SqlSession session = null;
		TinyDto dto = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"selectOneSeq", seq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}
	public List<TinyDto> selectListLev(DistinctDto distinctdto){
		SqlSession session = null;
		List<TinyDto> list = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectListLev", distinctdto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
}
