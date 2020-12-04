package member.login.dao;

import static member.login.db.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.login.dto.loginDto;

public class loginDao {
	
	public loginDto login(String myemail, String mypw) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		loginDto dto = null;
		String sql = " SELECT MYNO, MYEMAIL, MYPW, MYNAME, SNS_ID, SNS_TYPE "
				   + " FROM LOGIN "
				   + " WHERE MYEMAIL = ? AND MYPW = ? ";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, myemail);
			pstm.setString(2, mypw);
			System.out.println("query 준비" + sql);
			
			rs = pstm.executeQuery();
			System.out.println("query 실행");
			
			while(rs.next()) {
				dto = new loginDto();
				dto.setMyno(rs.getInt(1));
				dto.setMyemail(rs.getString(2));
				dto.setMypw(rs.getString(3));
				dto.setMyname(rs.getString(4));
				dto.setSns_id(rs.getString(5));
				dto.setSns_type(rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("종료");
		}
		
		return dto;
		
	}
	
	public int insertUser(loginDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " INSERT INTO LOGIN " 
				   + " VALUES(MYNOSEQ.NEXTVAL, ?, ?, ?, '0', '0') ";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMyemail());
			pstm.setString(2, dto.getMypw());
			pstm.setString(3, dto.getMyname());
			System.out.println("3. query 준비 : " + sql);
			res = pstm.executeUpdate();
			
			if (res > 0) {
				commit(con);
			}
			System.out.println("4. query 실행 및 리턴");
		} catch (SQLException e) {
			System.out.println("[error] 3. or 4.");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		return res;
//			return (res>0)?true:false;
	}
	
	//naver sign
	public int insertNaver(loginDto dto) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		
		int res = 0;
		String sql = " INSERT INTO LOGIN " 
				   + " VALUES(MYNOSEQ.NEXTVAL, ?, ?, ?, ?, 'naver') ";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMyemail());
			pstm.setString(2, dto.getMypw());
			pstm.setString(3, dto.getMyname());
			pstm.setString(4, dto.getSns_id());
			System.out.println("3. query 준비 : " + sql);
			res = pstm.executeUpdate();
			
			if (res > 0) {
				commit(con);
			}
			System.out.println("4. query 실행 및 리턴");
		} catch (SQLException e) {
			System.out.println("[error] 3. or 4.");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		
		return res;
	}
	
	// naver login
	

}
