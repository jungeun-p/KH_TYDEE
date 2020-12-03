package com.tydee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.tydee.dto.BoardItemDto;
import com.tydee.mybatis.SqlMapConfig;

public class BoardItemDao extends SqlMapConfig {
	private String namespace = "boarditem-mapper.";
	public List<BoardItemDto> selectListAllY(){
		SqlSession session = null;
		List<BoardItemDto> itemList = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			itemList = session.selectList(namespace+"selectListAllY");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return itemList;
	}
	public List<BoardItemDto> selectListSomeY(String item_category){
		SqlSession session = null;
		List<BoardItemDto> itemList = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			itemList = session.selectList(namespace+"selectListSomeY", item_category);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return itemList;
	}
	public BoardItemDto selectOne(int item_no) {
		SqlSession session = null;
		BoardItemDto dto = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"selectOne", item_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}
	public List<BoardItemDto> selectCategory(){
		SqlSession session = null;
		List<BoardItemDto> categoryList = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			categoryList = session.selectList(namespace+"selectCategory");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return categoryList;
	}
	public int insert(BoardItemDto dto) {
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
	public int update(BoardItemDto dto) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"update", dto);
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
	public int delete(int item_no) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"delete", item_no);
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
