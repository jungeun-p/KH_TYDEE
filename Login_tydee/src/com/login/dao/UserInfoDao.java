package com.login.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.login.dto.UserInfoDto;
import com.login.dto.UserInfoUpdateDto;

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
			System.out.println("dao res" + res);
			
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
	// 선택 된 user_no의 role 등급 변경 
	public int updaterole(int user_no , String user_role) {
		SqlSession session = null;
		
		int res = 0;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_no", user_no );
		map.put("user_role", user_role);
		
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace + "updaterole",map);
			 if(res > 0) {
				 session.commit();
			 }
		} catch (Exception e) {
			System.out.println("[Error] updaterole");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;

	}
	//닉네임 체크 
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
	// 등급 선택 시 선택 된 user_no
	public UserInfoDto selectUser(int user_no) {
		SqlSession session = null;
		UserInfoDto ndto = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			ndto = session.selectOne(namespace+"selectUser",user_no);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return ndto;
		
	}
	// 비밀번호 찾기 (email) 정보 확인
	public boolean PwCheck(String user_id) {
		SqlSession session = null;
		String res_id = "";
		boolean b = false;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res_id = session.selectOne(namespace+"PwCheck",user_id);
			if(!(res_id.equals(""))) {
				b = true;
			}
		} catch (Exception e) {
			System.out.println("DaoPw");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return b;
		
	}
	//비밀번호 찾기 정보 불러오기
	public UserInfoDto PwInfo(String user_id) {
		SqlSession session = null;
		UserInfoDto dto = null;
		System.out.println("dao:"+dto);
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"PwInfo",user_id);
			System.out.println("dao :"+dto);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return dto;
		
	}
	//User 정보수정 
	public int UserUP(UserInfoUpdateDto dto) {
		SqlSession session = null;
		
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"UserUP",dto);
			if( res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		return res;
		
	}
	
	//회원 탈퇴
	public int delete(int user_no) {
		SqlSession session = null;
		
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"delete",user_no);
			if(res>0) {
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




