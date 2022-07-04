package com.pro.present.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.pro.present.dto.FreeBoardDto;
import com.pro.present.dto.ReplyDto;

public class ReplyDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	private DataSource ds = null;
	
	// 싱글톤
	private static ReplyDao instance = new ReplyDao();
	public static ReplyDao getInstance() {
		return instance;
	}
	// 커넥션풀
	private ReplyDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g"); 
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		} 
	}
	
	// 1. 댓글쓰기
	public int writeReply(String mid, int bno, String rcontent, String rip) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO REPLY(rNO, mID, bNO, rCONTENT, rIP) " + 
				"    VALUES(REPLY_SEQ.NEXTVAL, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, bno);
			pstmt.setString(3, rcontent);
			pstmt.setString(4, rip);
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
	
	
	// 2. 댓글수정
	public int modifyReply(int rno, String rcontent) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE REPLY SET rCONTENT=? " + 
				"            WHERE rNO=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rcontent);
			pstmt.setInt(2, rno);
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
	
	// 3. 댓글삭제
	public int deleteReply(int rno) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE REPLY WHERE rNO=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
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
	
	// 4. 댓글 리스트 보기
	public ArrayList<ReplyDto> replyList(int bno, int bgroup){
		ArrayList<ReplyDto> dtos = new ArrayList<ReplyDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT R.*, M.mNAME FROM REPLY R, FREEBOARD F, MEMBER M " + 
				"        WHERE R.bNO=F.bNO AND F.bGROUP=? AND F.bINDENT=0 AND M.mID=R.mID " + 
				"        ORDER BY R.rRDATE";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bgroup);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int rno = rs.getInt("rno");
				String mid = rs.getString("mid");
				String rcontent = rs.getString("rcontent");
				Date rrdate = rs.getDate("rrdate");
				String rip = rs.getString("rip");
				String mname = rs.getString("mname");
				dtos.add(new ReplyDto(rno, mid, bno, rcontent, rrdate, rip, mname));
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
		return dtos;
	}
}
