package com.tydee.tip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.tydee.tip.dto.tip_dto;
import com.tydee.tip.mybatis.SqlMapConfig;



public class tip_dao extends SqlMapConfig {

	private String namespace = "tips-mapper.";

	public List<tip_dto> selectList() {
		
		SqlSession session = null;
		List<tip_dto> list = null;

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

	public tip_dto selectOne(int tip_no) {

		SqlSession session = null;
		tip_dto dto = null;

		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace + "selectOne",tip_no);
		} catch (Exception e) {
			System.out.println("[error] selectOne");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return dto;

	}

	public int insert(tip_dto dto) {
		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "insert", dto);
			if (res > 0) {
				session.commit();
			}

		} catch (Exception e) {
			System.out.println("[error] insert");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}

	public int update(tip_dto dto) {

		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace + "update", dto);
			if (res > 0) {
				session.commit();
			}

		} catch (Exception e) {
			System.out.println("[error] update");
			e.printStackTrace();
		}

		return res;
	}

	public int delete(int tip_no) {
		
		
		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace + "delete", tip_no);
			if (res > 0) {
				session.commit();
			}

		} catch (Exception e) {
			System.out.println("[error] delete");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;

	}

}
