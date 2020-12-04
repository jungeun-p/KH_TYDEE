package com.toast.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.toast.dto.ToastDto;

public class ToastDao extends SqlMapConfig {
	private String namespace = "toastmapper.";
	public List<ToastDto> selectList(){
		SqlSession session = null;
		List<ToastDto> list = null;
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
	public ToastDto selectOne(int seq) {
		SqlSession session = null;
		ToastDto dto = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"selectOne", seq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}
	public int insert(ToastDto dto) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insert", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
}
