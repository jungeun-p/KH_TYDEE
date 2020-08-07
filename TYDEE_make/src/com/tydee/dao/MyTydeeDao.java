package com.tydee.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import com.tydee.dto.MyTydeeDistinctDto;
import com.tydee.dto.MyTydeeDto;
import com.tydee.mybatis.SqlMapConfig;

public class MyTydeeDao extends SqlMapConfig {
	private String namespace = "mytydee-mapper.";
	public List<MyTydeeDto> selectListLevDepth(MyTydeeDistinctDto dto){
		SqlSession session = null;
		List<MyTydeeDto> list = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectListLevDepth", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	public List<MyTydeeDistinctDto> selectListDistinct(int user_no){
		SqlSession session = null;
		List<MyTydeeDistinctDto> list = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectListDistinct", user_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	public List<MyTydeeDto> selectListTypeD(int user_no) {
		SqlSession session = null;
		List<MyTydeeDto> list = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectListTypeD", user_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	public int update(MyTydeeDto dto) {
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
	public int delete(MyTydeeDto dto) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"delete",dto);
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
	public int insert(MyTydeeDto dto) {
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
	public int insertNew(int user_no, int tydeenumber) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession(false);
			for (int i=0; i<tydeenumber; i++) {
				HashMap<String,Object> values = new HashMap<String, Object>();
				String tydee = randomTydee();
				values.put("user_no", user_no);
				values.put("tiny_title", tydee);
				values.put("tiny_content", tydee);
				res += session.insert(namespace+"insertNew", values);
				if (res > 0) {
					session.commit();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	public String randomTydee() {
		String[] tydee = {"거실", "방", "부엌", "베란다", "화장실", "다용도실", "테라스", "서재"};
		return tydee[(int) Math.floor(Math.random()*7)];
	}
}
