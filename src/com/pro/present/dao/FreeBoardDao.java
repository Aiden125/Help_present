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
import com.sun.corba.se.spi.ior.WriteContents;

public class FreeBoardDao {
	public static final int SUCCESS = 1; // 회원가입시
	public static final int FAIL = 0;	// 회원가입시
	private DataSource ds = null;
	
	// 싱글톤
	private static FreeBoardDao instance = new FreeBoardDao();
	public static FreeBoardDao getInstance() {
		return instance;
	}
	private FreeBoardDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g"); 
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		} 
	}
	
	// 1.글목록
	public ArrayList<FreeBoardDto> listBoard(String word, int startRow, int endRow){
		ArrayList<FreeBoardDto> dtos = new ArrayList<FreeBoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * " + 
				"    FROM (SELECT ROWNUM RN, A.* " + 
				"        FROM(SELECT B.*, M.mNAME, (SELECT COUNT(*) FROM REPLY WHERE bNO=B.bNO) REPLYCOUNT " + 
				"    FROM FREEBOARD B, MEMBER M " + 
				"    WHERE B.mID=M.mID AND bDELETEMARK=0 " + 
				"    AND (bMBTI LIKE '%'||UPPER(?)||'%' OR b.BTITLE LIKE '%'||UPPER(?)||'%' " + 
				"    OR bCONTENT LIKE '%'||UPPER(?)||'%' OR M.mNAME LIKE '%'||UPPER(?)||'%') " + 
				"    ORDER BY bGROUP DESC, bSTEP) A) " + 
				"    WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, word);
			pstmt.setString(2, word);
			pstmt.setString(3, word);
			pstmt.setString(4, word);
			pstmt.setInt(5, startRow);
			pstmt.setInt(6, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String mid = rs.getString("mid");
				String bmbti = rs.getString("bmbti");
				String btitle = rs.getString("btitle");
				String bcontent = rs.getString("bcontent");
				String bfilename = rs.getString("bfilename");
				Date brdate = rs.getDate("brdate");
				int bhit = rs.getInt("bhit");
				int bgroup = rs.getInt("bgroup");
				int bstep = rs.getInt("bstep");
				int bindent = rs.getInt("bindent");
				int blike = rs.getInt("blike");
				String bip = rs.getString("bip");
				int bdeletemark = rs.getInt("bdeletemark");
				String mname = rs.getString("mname");
				int replycount = rs.getInt("replycount");
				dtos.add(new FreeBoardDto(bno, mid, bmbti, btitle, bcontent, bfilename, brdate, bhit, bgroup, bstep, bindent, blike, bip, bdeletemark, mname, null, replycount));
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
	
	// 2-1. 전체갯수
	public int getBoardTotalCnt() {
		int totalCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM FREEBOARD WHERE bDELETEMARK=0";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
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
	
	// 2-2. 검색된 갯수
	public int getBoardSearchCnt(String word) {
		int totalCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) " + 
				"    FROM FREEBOARD B, MEMBER M " + 
				"    WHERE B.mID=M.mID AND bDELETEMARK=0 " + 
				"        AND (bMBTI LIKE '%'||UPPER(?)||'%' OR b.BTITLE LIKE '%'||UPPER(?)||'%' " + 
				"        OR bCONTENT LIKE '%'||UPPER(?)||'%' OR M.mNAME LIKE '%'||UPPER(?)||'%')";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, word);
			pstmt.setString(2, word);
			pstmt.setString(3, word);
			pstmt.setString(4, word);
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
	
	
	// 3. 자유게시판 원글쓰기
	public int write(String mid, String bmbti, String btitle, String bcontent, String bfilename, String bip) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO FREEBOARD(bNO, mID, bMBTI, bTITLE, bCONTENT, bFILENAME, " + 
				"                bGROUP, bSTEP, bINDENT, bIP) " + 
				"        VALUES(FREEBOARD_SEQ.NEXTVAL, ?, UPPER(?), ?, ?, ?, " + 
				"                FREEBOARD_SEQ.CURRVAL, 0, 0, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, bmbti);
			pstmt.setString(3, btitle);
			pstmt.setString(4, bcontent);
			pstmt.setString(5, bfilename);
			pstmt.setString(6, bip);
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
	private void replyStep(int bgroup, int bstep) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE FREEBOARD SET bSTEP = bSTEP+1 WHERE bGROUP=? AND bSTEP>?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bgroup);
			pstmt.setInt(2, bstep);
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
	public int reply(String mid, String bmbti, String btitle, String bcontent, String bfilename,
						String bip, int bgroup, int bstep, int bindent) {
		int result = FAIL;
		replyStep(bgroup, bstep);
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO FREEBOARD(bNO, mID, bMBTI, bTITLE, bCONTENT, bFILENAME, " + 
				"                bGROUP, bSTEP, bINDENT, bIP) " + 
				"        VALUES(FREEBOARD_SEQ.NEXTVAL, ?, ?, " + 
				"            ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, bmbti);
			pstmt.setString(3, btitle);
			pstmt.setString(4, bcontent);
			pstmt.setString(5, bfilename);
			pstmt.setInt(6, bgroup);
			pstmt.setInt(7, bstep+1);
			pstmt.setInt(8, bindent+1);
			pstmt.setString(9, bip);
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
	
	
	// 6. bno로 dto가져오기 = 글 상세보기(조회수 올리기 포함)
	public FreeBoardDto contentViewAndHit(int bno, int bgroup) {
		FreeBoardDto dto = null;
		hitUp(bno); // 글 상세보기시 자동적으로 hitUp
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT B.*, M.mMBTI, M.mNAME " + 
				"        FROM FREEBOARD B, MEMBER M " + 
				"        WHERE B.mID=M.mID AND bDELETEMARK=0 AND bGROUP=? AND bINDENT=0";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bgroup);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String mid = rs.getString("mid");
				String bmbti = rs.getString("bmbti");
				String btitle = rs.getString("btitle");
				String bcontent = rs.getString("bcontent");
				String bfilename = rs.getString("bfilename");
				Date brdate = rs.getDate("brdate");
				int bhit = rs.getInt("bhit");
				int bstep = rs.getInt("bstep");
				int bindent = rs.getInt("bindent");
				int blike = rs.getInt("blike");
				String bip = rs.getString("bip");
				int bdeletemark = rs.getInt("bdeletemark");
				String mname = rs.getString("mname");
				String mmbti = rs.getString("mmbti");
				dto = new FreeBoardDto(bno, mid, bmbti, btitle, bcontent, bfilename, brdate, bhit, bgroup, bstep, bindent, blike, bip, bdeletemark, mname, mmbti);
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
	
	
	
	// 7-0. 조회수 올리기
	private void hitUp(int bno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE FREEBOARD SET bHIT = bHIT+1 WHERE bNO=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
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
	// 7-1. 조회수 올리기
	public void hitDown(int bno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE FREEBOARD SET bHIT = bHIT-1 WHERE bNO=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
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
		
		
	
	// 7-2. 좋아요 올리기
	public void bLikeUp(int bno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE FREEBOARD SET bLIKE = bLIKE+1 WHERE bNO=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
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
	// 7-3. 좋아요 올리기
	public void bLikeDown(int bno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE FREEBOARD SET bLIKE = bLIKE-1 WHERE bNO=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
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
		
	
	// 8. bno로 dto가져오기 = 글 상세보기(조회수 올리기 미포함)
	public FreeBoardDto contentView(int bno) {
		FreeBoardDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT B.*, M.mMBTI, M.mNAME " + 
				"        FROM FREEBOARD B, MEMBER M " + 
				"        WHERE B.mID=M.mID AND bNO=? AND bDELETEMARK=0";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String mid = rs.getString("mid");
				String bmbti = rs.getString("bmbti");
				String btitle = rs.getString("btitle");
				String bcontent = rs.getString("bcontent");
				String bfilename = rs.getString("bfilename");
				Date brdate = rs.getDate("brdate");
				int bhit = rs.getInt("bhit");
				int bgroup = rs.getInt("bgroup");
				int bstep = rs.getInt("bstep");
				int bindent = rs.getInt("bindent");
				int blike = rs.getInt("blike");
				String bip = rs.getString("bip");
				int bdeletemark = rs.getInt("bdeletemark");
				String mname = rs.getString("mname");
				String mmbti = rs.getString("mmbti");
				dto = new FreeBoardDto(bno, mid, bmbti, btitle, bcontent, bfilename, brdate, bhit, bgroup, bstep, bindent, blike, bip, bdeletemark, mname, mmbti);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage()+dto);
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
	
	
	// 9. 답변들 상세보기
	public ArrayList<FreeBoardDto> replyListView(int bgroup){
		ArrayList<FreeBoardDto> dtos = new ArrayList<FreeBoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT B.*, M.mMBTI, M.mNAME " + 
				"        FROM FREEBOARD B, MEMBER M " + 
				"        WHERE B.mID=M.mID AND bDELETEMARK=0 AND bGROUP=? AND bINDENT!=0 " + 
				"        ORDER BY bSTEP, bRDATE";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bgroup);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String mid = rs.getString("mid");
				String bmbti = rs.getString("bmbti");
				String btitle = rs.getString("btitle");
				String bcontent = rs.getString("bcontent");
				String bfilename = rs.getString("bfilename");
				Date brdate = rs.getDate("brdate");
				int bhit = rs.getInt("bhit");
				int bstep = rs.getInt("bstep");
				int bindent = rs.getInt("bindent");
				int blike = rs.getInt("blike");
				String bip = rs.getString("bip");
				int bdeletemark = rs.getInt("bdeletemark");
				String mname = rs.getString("mname");
				String mmbti = rs.getString("mmbti");
				dtos.add(new FreeBoardDto(bno, mid, bmbti, btitle, bcontent, bfilename, brdate, bhit, bgroup, bstep, bindent, blike, bip, bdeletemark, mname, mmbti));
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
	
	
	// 10. 글 수정
	public int modify(int bno, String bmbti, String btitle, String bcontent, String bfilename, String bip) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE FREEBOARD SET bMBTI=?, " + 
				"                    bTITLE=?, " + 
				"                    bCONTENT=?, " + 
				"                    bFILENAME=?, " + 
				"                    bIP=? " + 
				"            WHERE bNO=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bmbti);
			pstmt.setString(2, btitle);
			pstmt.setString(3, bcontent);
			pstmt.setString(4, bfilename);
			pstmt.setString(5, bip);
			pstmt.setInt(6, bno);
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
	
	// 11. 글 삭제
	public int delete(int bno) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE FREEBOARD SET bDELETEMARK = 1 WHERE bNO=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
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
	
	
	// 12. 답글갯수
	public int replyCount(int bgroup) {
		int totCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*)-1 FROM FREEBOARD WHERE bGROUP=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bgroup);
			rs = pstmt.executeQuery();
			rs.next();
			totCnt = rs.getInt("1");
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
