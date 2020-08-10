package com.tydee.second.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.tydee.second.db.SqlMapConfig;
import com.tydee.second.dto.SecondCommDto;
import com.tydee.second.dto.SecondHandDto;

public class SecondHandDao extends SqlMapConfig {
   private String namespace = "secondhand_mapper.";
  
   public List<SecondHandDto> selectList(){
      SqlSession session = null;
      List<SecondHandDto> list = null;
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
   
   public List<SecondCommDto> selectListComment(int sec_no,int user_no){
	   
	   SqlSession session = null;
	   List<SecondCommDto>list = null;
	   Map<Object, Object>map = new HashMap<Object, Object>();
	   map.put("sec_no", sec_no);
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
   
   public SecondHandDto selectOne(int sec_no) {
      SqlSession session = null;
      SecondHandDto dto = null;
      
      Map<Object, Object> map = new HashMap<Object, Object>();
      map.put("sec_no", sec_no);
      
    
      try {
         session = getSqlSessionFactory().openSession(false);
         dto = session.selectOne(namespace+"selectOne",sec_no);
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         session.close();
      }
      return dto;
   }
   
   
   
   public int insert(SecondHandDto dto) {
      
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
   
   public int update(SecondHandDto dto) {
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
   
   public int insertReply(SecondCommDto dto) {
	      
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
   
   
   
   public int delete(int sec_no) {
      SqlSession session = null;
     
      int res = 0;
      
      try {
         session = getSqlSessionFactory().openSession(false);
         res = session.delete(namespace+"delete", sec_no);
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
   
   public int deleteChild(int sec_no) {
	   
	   SqlSession session = null;
	   
	      int res = 0;
	      try {
	         session = getSqlSessionFactory().openSession(false);
	         res = session.delete(namespace+"deleteChild",sec_no);
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
   
   public int deleteReply(int sec_comm_no) {
	   
	   SqlSession session = null;
	   
	      int res = 0;
	      try {
	         session = getSqlSessionFactory().openSession(false);
	         res = session.delete(namespace+"deleteReply", sec_comm_no);
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
   
   
	/*
	 * public int multiDelete(String[] sec_no) { int count = 0; Map<String,
	 * String[]> map = new HashMap<String, String[]>(); map.put("sec_nos", sec_no);
	 * SqlSession session = null; try { session =
	 * getSqlSessionFactory().openSession(false); count =
	 * session.delete(namespace+"muldel", map); if (count == sec_no.length) {
	 * session.commit(); } } catch (Exception e) { e.printStackTrace(); } finally {
	 * session.close(); } return count; }
	 */
}