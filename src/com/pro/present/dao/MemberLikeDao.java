package com.pro.present.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberLikeDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	private DataSource ds = null;
	
	// 싱글톤
	private static MemberLikeDao instance = new MemberLikeDao();
	public static MemberLikeDao getInstance() {
		return instance;
	}
	private MemberLikeDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g"); 
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	
	// 1. 좋아요 정보 입력
	public int hitLike(String mid, String mmyid) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBER_LIKE_TABLE " + 
				"    VALUES(MEMBER_LIKE_TABLE_SEQ.NEXTVAL, ?, ?, 1)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mmyid);
			result = pstmt.executeUpdate();
			MemberDao mDao = MemberDao.getInstance();
			mDao.mLikeUp(mid);
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " : hitLike");
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
	public int deleteLike(String mid, String mmyid) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE MEMBER_LIKE_TABLE " + 
				"    WHERE mID=? AND mMYID=? AND LIKECHECK=1";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mmyid);
			result = pstmt.executeUpdate();
			MemberDao mDao = MemberDao.getInstance();
			mDao.mLikeDown(mid);
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " : deleteLike");
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
	public int checkLike(String mid, String mmyid) {
		int totCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT LIKECHECK " + 
				"    FROM MEMBER_LIKE_TABLE " + 
				"    WHERE mID=? AND mMYID=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mmyid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totCnt = rs.getInt("likecheck");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " : checkLike 에러");
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
