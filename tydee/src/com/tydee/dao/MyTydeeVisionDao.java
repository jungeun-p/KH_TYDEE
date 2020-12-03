package com.tydee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.tydee.dto.MyTydeeVisionDto;
import com.tydee.mybatis.SqlMapConfig;

public class MyTydeeVisionDao extends SqlMapConfig {
	private String namespace = "mytydee-mapper.";
	public List<MyTydeeVisionDto> selectList(int user_no){
		SqlSession session = null;
		List<MyTydeeVisionDto> list = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectListVision", user_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	public MyTydeeVisionDto selectOne(int vision_no) {
		SqlSession session = null;
		MyTydeeVisionDto dto = null;
		session = getSqlSessionFactory().openSession(false);
		dto = session.selectOne(namespace+"selectOneVision", vision_no);
		return dto;
	}
	public int insertVision(MyTydeeVisionDto dto) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insertVision", dto);
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
	public int deleteVision(int vision_no) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"deleteVision", vision_no);
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
