package com.pro.present.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class LikeBoardDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	private DataSource ds = null;
	
	// 싱글톤
	private static LikeBoardDao instance = new LikeBoardDao();
	public static LikeBoardDao getInstance() {
		return instance;
	}
	private LikeBoardDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g"); 
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	
	// 1. 좋아요 정보 입력
	public int hitLike(String mid, int bno) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO LIKE_TABLE VALUES(LIKE_TABLE_SEQ.NEXTVAL, ?, ?, 1)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, bno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	
	// 2. 좋아요 제거하기
	public int deleteLike(String mid, int bno) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE LIKE_TABLE WHERE bNO=? AND mID=? AND LIKECHECK=1 ";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, mid);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	// 3. 눌렀는지 확인
	public int checkLike(String mid, int bno) {
		int totCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT LIKECHECK FROM LIKE_TABLE WHERE bNO=? AND mID=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totCnt = rs.getInt("likecheck");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
				if(rs!=null) rs.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return totCnt;
	}
}
