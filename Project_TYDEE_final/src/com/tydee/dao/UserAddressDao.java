package com.tydee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.tydee.dto.UserAddressDto;
import com.tydee.mybatis.SqlMapConfig;

public class UserAddressDao extends SqlMapConfig {
	private String namespace = "useraddress-mapper.";
	public List<UserAddressDto> selectRecent(int user_no) {
		SqlSession session = null;
		List<UserAddressDto> dto = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectList(namespace+"selectrecent", user_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}
	public List<Integer> lastAddressNo() {
		SqlSession session = null;
		List<Integer> list = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"lastaddressno");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	public int insertNew(UserAddressDto dto) {
		SqlSession session = null;
		int res = 0;
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insertnew", dto);
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
