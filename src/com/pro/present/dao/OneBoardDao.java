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

import com.pro.present.dto.OneBoardDto;

public class OneBoardDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	private DataSource ds = null;
	
	// 싱글톤
	private static OneBoardDao instance = new OneBoardDao();
	public static OneBoardDao getInstance() {
		return instance;
	}
	// 커넥션풀
	private OneBoardDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g"); 
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		} 
	}
	
	
	// 1-1. 내가 질문한 리스트
	public ArrayList<OneBoardDto> requestListBoard(String mid, int startRow, int endRow){
		ArrayList<OneBoardDto> dtos = new ArrayList<OneBoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * " + 
				"    FROM (SELECT ROWNUM RN, A.* " + 
				"        FROM(SELECT O.*, M.mNAME " + 
				"                FROM ONEBOARD O, MEMBER M " + 
				"                WHERE O.mID=M.mID AND O.mID=? AND obBORN=0 AND obDELETEMARK=0 " + 
				"                ORDER BY obGROUP DESC, obSTEP) A) " + 
				"    WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int obno = rs.getInt("obno");
				String obtitle = rs.getString("obtitle");
				String obcontent = rs.getString("obcontent");
				Date obrdate = rs.getDate("obrdate");
				int obgroup = rs.getInt("obgroup");
				int obstep = rs.getInt("obstep");
				String obip = rs.getString("obip");
				int obdeletemark = rs.getInt("obdeletemark");
				String obgetname = rs.getString("obgetname");
				int obborn = rs.getInt("obborn");
				String obanswer = rs.getString("obanswer");
				String mname = rs.getString("mname");
				dtos.add(new OneBoardDto(obno, mid, obtitle, obcontent, obrdate, obgroup, obstep, obip, obdeletemark, obgetname, obborn, obanswer, mname));
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
	
	// 1-2. 내가 질문 받은 리스트
		public ArrayList<OneBoardDto> responseListBoard(String mid, int startRow, int endRow){
			ArrayList<OneBoardDto> dtos = new ArrayList<OneBoardDto>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * " + 
					"    FROM (SELECT ROWNUM RN, A.* " + 
					"        FROM(SELECT O.*, M.mNAME " + 
					"                FROM ONEBOARD O, MEMBER M " + 
					"                WHERE O.mID=M.mID AND obGETNAME=(SELECT mNAME FROM MEMBER WHERE mID=?) " + 
					"                AND obBORN=0 AND obDELETEMARK=0 " + 
					"                ORDER BY obGROUP DESC, obSTEP) A) " + 
					"    WHERE RN BETWEEN ? AND ?";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					// String mid = rs.getString("mid");
					int obno = rs.getInt("obno");
					String obtitle = rs.getString("obtitle");
					String obcontent = rs.getString("obcontent");
					Date obrdate = rs.getDate("obrdate");
					int obgroup = rs.getInt("obgroup");
					int obstep = rs.getInt("obstep");
					String obip = rs.getString("obip");
					int obdeletemark = rs.getInt("obdeletemark");
					String obgetname = rs.getString("obgetname");
					int obborn = rs.getInt("obborn");
					String obanswer = rs.getString("obanswer");
					String mname = rs.getString("mname");
					dtos.add(new OneBoardDto(obno, mid, obtitle, obcontent, obrdate, obgroup, obstep, obip, obdeletemark, obgetname, obborn, obanswer, mname));
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
	
	// 2-1. 내가 질문한 글 갯수
	public int requestTotalCnt(String mid) {
		int totalCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) " + 
				"    FROM ONEBOARD O, MEMBER M " + 
				"    WHERE O.mID=M.mID AND O.mID=? AND obBORN=0 AND obDELETEMARK=0 " + 
				"    ORDER BY obGROUP DESC, obSTEP";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			rs.next();
			totalCnt = rs.getInt(1); // 첫번째 열 가져오기
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
		return totalCnt;
	}
	
	// 2-2. 내가 질문받은 글 갯수
		public int responseTotalCnt(String mid) {
			int totalCnt = 0;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT COUNT(*) " + 
					"    FROM ONEBOARD O, MEMBER M " + 
					"    WHERE O.mID=M.mID AND obGETNAME=(SELECT mNAME FROM MEMBER WHERE mID=?) " + 
					"    AND obBORN=0 AND obDELETEMARK=0 " + 
					"    ORDER BY obGROUP DESC, obSTEP";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				rs = pstmt.executeQuery();
				rs.next();
				totalCnt = rs.getInt(1); // 첫번째 열 가져오기
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
			return totalCnt;
		}
	
	
	// 3. 일대일 게시판 질문쓰기
	public int writeOneBoard(String mid, String obtitle, String obcontent, String obip, String obgetname) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO ONEBOARD(obNO, mID, obTITLE, obCONTENT, obGROUP, obSTEP, ObIP, obGETNAME, obBORN) " + 
				"    VALUES(ONEBOARD_SEQ.NEXTVAL, ?, ?, ?, ONEBOARD_SEQ.CURRVAL, 0, ?, ?, 0)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, obtitle);
			pstmt.setString(3, obcontent);
			pstmt.setString(4, obip);
			pstmt.setString(5, obgetname);
			result = pstmt.executeUpdate();
			MemberDao mDao = MemberDao.getInstance();
			mDao.writecountUp(mid);
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
	
	
	// 4. 답변글 쓰기 전 step a
	private void replyStep(int obgroup, int obstep) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE ONEBOARD SET obSTEP = obSTEP+1 WHERE obGROUP=? AND obSTEP>?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, obgroup);
			pstmt.setInt(2, obstep);
			pstmt.executeUpdate();
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
	}
	
	// 5-1. 답변글 쓰면서 상태 바꿔주기
	private void updateStatus(int obgroup) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE ONEBOARD SET obANSWER = '답변완료' WHERE obGROUP=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, obgroup);
			pstmt.executeUpdate();
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
	}

	// 5. 답변글 쓰기
	public int reply(String mid, String obtitle, String obcontent, 
						String obip, int obgroup, int obstep, String obgetname) {
		int result = FAIL;
		replyStep(obgroup, obstep);
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO ONEBOARD(obNO, mID, obTITLE, obCONTENT, obGROUP, obSTEP, ObIP, obGETNAME, obBORN) " + 
				"    VALUES(ONEBOARD_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, 1)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, obtitle);
			pstmt.setString(3, obcontent);
			pstmt.setInt(4, obgroup);
			pstmt.setInt(5, obstep+1);
			pstmt.setString(6, obip);
			pstmt.setString(7, obgetname);
			result = pstmt.executeUpdate();
			MemberDao mDao = MemberDao.getInstance();
			mDao.writecountUp(mid);
			updateStatus(obgroup);
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
	
	// 6-1. 글상관없이 하나만 상세보기
	public OneBoardDto contentViewOnlyOne(int obno) {
		OneBoardDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT O.*, M.mNAME " + 
				"        FROM ONEBOARD O, MEMBER M " + 
				"        WHERE O.mID=M.mID AND obDELETEMARK=0 AND obno=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, obno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				// int obno = rs.getInt("obno");
				String mid = rs.getString("mid");
				String obtitle = rs.getString("obtitle");
				String obcontent = rs.getString("obcontent");
				Date obrdate = rs.getDate("obrdate");
				int obgroup = rs.getInt("obgroup");
				int obstep = rs.getInt("obstep");
				String obip = rs.getString("obip");
				int obdeletemark = rs.getInt("obdeletemark");
				String obgetname = rs.getString("obgetname");
				int obborn = rs.getInt("obborn");
				String obanswer = rs.getString("obanswer");
				String mname = rs.getString("mname");
				dto = new OneBoardDto(obno, mid, obtitle, obcontent, obrdate, obgroup, obstep, obip, obdeletemark, obgetname, obborn, obanswer, mname);
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
		return dto;
	}
	
	// 6-2 원글만 상세보기
	public OneBoardDto contentView(int obno, int obgroup) {
		OneBoardDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT O.*, M.mNAME " + 
				"        FROM ONEBOARD O, MEMBER M " + 
				"        WHERE O.mID=M.mID AND obDELETEMARK=0 AND obGROUP=? AND obBORN=0";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, obgroup);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				// int obno = rs.getInt("obno");
				String mid = rs.getString("mid");
				String obtitle = rs.getString("obtitle");
				String obcontent = rs.getString("obcontent");
				Date obrdate = rs.getDate("obrdate");
				// int obgroup = rs.getInt("obgroup");
				int obstep = rs.getInt("obstep");
				String obip = rs.getString("obip");
				int obdeletemark = rs.getInt("obdeletemark");
				String obgetname = rs.getString("obgetname");
				int obborn = rs.getInt("obborn");
				String obanswer = rs.getString("obanswer");
				String mname = rs.getString("mname");
				dto = new OneBoardDto(obno, mid, obtitle, obcontent, obrdate, obgroup, obstep, obip, obdeletemark, obgetname, obborn, obanswer, mname);
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
		return dto;
	}
	
	
	// 7. 답변들 상세보기
	public ArrayList<OneBoardDto> replyListView(int obgroup){
		ArrayList<OneBoardDto> dtos = new ArrayList<OneBoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT O.*, M.mNAME " + 
				"        FROM ONEBOARD O, MEMBER M " + 
				"        WHERE O.mID=M.mID AND obDELETEMARK=0 AND obGROUP=? AND obBORN!=0 " + 
				"        ORDER BY obRDATE";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, obgroup);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int obno = rs.getInt("obno");
				String mid = rs.getString("mid");
				String obtitle = rs.getString("obtitle");
				String obcontent = rs.getString("obcontent");
				Date obrdate = rs.getDate("obrdate");
				// int obgroup = rs.getInt("obgroup");
				int obstep = rs.getInt("obstep");
				String obip = rs.getString("obip");
				int obdeletemark = rs.getInt("obdeletemark");
				String obgetname = rs.getString("obgetname");
				int obborn = rs.getInt("obborn");
				String obanswer = rs.getString("obanswer");
				String mname = rs.getString("mname");
				dtos.add(new OneBoardDto(obno, mid, obtitle, obcontent, obrdate, obgroup, obstep, obip, obdeletemark, obgetname, obborn, obanswer, mname));
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

	
	// 8. 글 수정
	public int modify(int obno, String obtitle, String obcontent, String obip) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE ONEBOARD SET obTITLE=?, " + 
				"                     obCONTENT=?, " + 
				"                     obIP=? " + 
				"            WHERE obNO=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, obtitle);
			pstmt.setString(2, obcontent);
			pstmt.setString(3, obip);
			pstmt.setInt(4, obno);
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
	
	// 9. 글 삭제
	public int delete(int obno) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE ONEBOARD SET obDELETEMARK = 1 WHERE obNO=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, obno);
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
	
	
	
}
