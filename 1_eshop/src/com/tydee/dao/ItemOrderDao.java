package com.tydee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.tydee.dto.ItemOrderDto;
import com.tydee.dto.ItemTotalDto;
import com.tydee.mybatis.SqlMapConfig;

public class ItemOrderDao extends SqlMapConfig {
	private String namespace = "itemorder-mapper.";
	public int insertList(List<ItemOrderDto> list) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"insertList", list);
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
	public List<ItemOrderDto> selectList(int user_no){
		SqlSession session = null;
		List<ItemOrderDto> list = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectList", user_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	public List<ItemTotalDto> selectOne(int order_no) {
		SqlSession session = null;
		List<ItemTotalDto> list = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectOne", order_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
}
