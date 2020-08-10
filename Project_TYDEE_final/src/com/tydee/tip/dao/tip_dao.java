package com.tydee.tip.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.tydee.tip.dto.tip_Comm_dto;
import com.tydee.tip.dto.tip_dto;
import com.tydee.mybatis.SqlMapConfig;



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
	
	//팁 댓글 리스트-----------------------------------
		public List<tip_Comm_dto> selectListComment(int tip_no,int user_no) {
		
			SqlSession session = null;
			List<tip_Comm_dto> list = null;
			Map<Object, Object>map = new HashMap<Object, Object>();
			map.put("tip_no", tip_no);
		    map.put("user_no", user_no); 

			try {
				session = getSqlSessionFactory().openSession(false);
				list = session.selectList(namespace+"selectListComment",map);
				
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
	
	//댓글 추가 기능 ------------------------
		public int insertReply(tip_Comm_dto dto) {
		      
			  SqlSession session = null;
		   
			  int res = 0;
		      try {
		         session = getSqlSessionFactory().openSession(false);
		         res = session.insert(namespace+"insertReply" , dto);
		         
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
	
public int deleteReply(int tip_comm_no) {
		
		
		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace + "deleteReply", tip_comm_no);
			if (res > 0) {
				session.commit();
			}

		} catch (Exception e) {
			System.out.println("[error] deleteReply");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;

	}

}
