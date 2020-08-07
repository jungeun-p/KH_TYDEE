package com.login.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.login.dto.UserInfoDto;

public class UserInfoDao extends SqlMapconfig {

	private String namespace = "userinfo-mapper.";

	public UserInfoDto Login(UserInfoDto idpw) {
		SqlSession session = null;
		UserInfoDto dto = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace + "Login", idpw);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}

	// 전체 리스트 출력
	public List<UserInfoDto> selectlist() {
		SqlSession session = null;
		List<UserInfoDto> list = null;

		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return list;

	}

	// 회원 가입.
	public int insertRegist(UserInfoDto dto) {

		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "insertRegist", dto);
			System.out.println("res" + res);
			System.out.println(insertRegist(dto));
			if (res > 0) {
				session.commit();
			}

		} catch (Exception e) {
			System.out.println("[Error] insertRegist");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}

	public int update(UserInfoDto dto) {
		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace + "update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;

	}

	public UserInfoDto nickChk(String User_nickname) {
		SqlSession session = null;
		UserInfoDto ndto = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			ndto = session.selectOne(namespace+"nickChk",User_nickname);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return ndto;
		
	}
}
