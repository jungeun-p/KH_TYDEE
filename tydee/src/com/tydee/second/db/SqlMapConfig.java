package com.tydee.second.db;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
   public SqlSessionFactory sqlSessionFactory;
   public SqlSessionFactory getSqlSessionFactory() {
      String resource = "com/tydee/second/db/second_config.xml";
      // class는 . 경로는 /
     Reader reader = null;
      try {
         reader = Resources.getResourceAsReader(resource);
         sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
         
      } catch (IOException e) {
         e.printStackTrace();
      }finally {
    	  try {
			reader.close();
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
      }
      
      
      return sqlSessionFactory;
   }
}