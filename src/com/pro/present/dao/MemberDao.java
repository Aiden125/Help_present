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

import com.pro.present.dto.MemberDto;

public class MemberDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	private DataSource ds = null;
	
	// 싱글톤
	private static MemberDao instance = new MemberDao();
	public static MemberDao getInstance() {
		return instance;
	}
	// 커넥션풀
	private MemberDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g"); 
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		} 
	}
	
	
	// 1. 로그인 중복체크
	public int checkId(String mid) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER WHERE mID=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = FAIL;
			}else {
				result = SUCCESS;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
		
	// 2. dto 정보 가져오기
	public MemberDto getMemberDto(String mid) {
		MemberDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER WHERE mID=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String mpw = rs.getString("mpw");
				Date mbirth = rs.getDate("mbirth");
				String mname = rs.getString("mname");
				String mgender = rs.getString("mgender");
				String memail = rs.getString("memail");
				String mmbti = rs.getString("mmbti");
				Date mrdate = rs.getDate("mrdate");
				int mlike = rs.getInt("mlike");
				int mwritecount = rs.getInt("mwritecount");
				dto = new MemberDto(mid, mpw, mname, mbirth, mgender, memail, mmbti, mrdate, mlike, mwritecount);	
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
				
				
				
	// 3. 로그인
	public int login(String mid, String mpw ) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER WHERE mID=? AND mPW=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mpw);
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = SUCCESS;
			}else {
				result = FAIL;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	
	// 4. 회원가입
	public int joinMember(MemberDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBER(mID, mPW, mNAME, mBIRTH, mGENDER, mEMAIL, mMBTI) " + 
				"    VALUES(?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getMpw());
			pstmt.setString(3, dto.getMname());
			pstmt.setDate(4, dto.getMbirth());
			pstmt.setString(5, dto.getMgender());
			pstmt.setString(6, dto.getMemail());
			pstmt.setString(7, dto.getMmbti());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// 5-1. 회원리스트 보기
		public ArrayList<MemberDto> listMember(int startRow, int endRow){
			ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * " + 
					"    FROM (SELECT ROWNUM RN, A.* " + 
					"        FROM(SELECT * " + 
					"                FROM MEMBER " + 
					"                ORDER BY mLIKE DESC) A) " + 
					"    WHERE RN BETWEEN ? AND ?";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs = pstmt.executeQuery();
				while(rs.next()){
					String mid = rs.getString("mid");
					String mpw = rs.getString("mpw");				
					String mname = rs.getString("mname");				
					Date mbirth = rs.getDate("mbirth");
					String mgender = rs.getString("mgender");
					String memail = rs.getString("memail");
					String mmbti = rs.getString("mmbti");
					Date mrdate = rs.getDate("mrdate");
					int mlike = rs.getInt("mlike");
					int mwritecount = rs.getInt("mwritecount");
					dtos.add(new MemberDto(mid, mpw, mname, mbirth, mgender, memail, mmbti, mrdate, mlike, mwritecount));
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage()+dtos);
			} finally {
				try {
					if(rs!=null) rs.close();
					if(pstmt!=null) pstmt.close();
					if(conn!=null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return dtos;
		}
		
		
	// 5-2. 회원리스트 검색
	public ArrayList<MemberDto> searchMember(String mname, int startRow, int endRow){
		ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * " + 
				"    FROM (SELECT ROWNUM RN, A.* " + 
				"        FROM(SELECT * " + 
				"                FROM MEMBER " + 
				"                ORDER BY mLIKE DESC) A) " + 
				"    WHERE mNAME LIKE '%'||?||'%' AND RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mname);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				String mid = rs.getString("mid");
				String mpw = rs.getString("mpw");				
				// String mname = rs.getString("mname");				
				Date mbirth = rs.getDate("mbirth");
				String mgender = rs.getString("mgender");
				String memail = rs.getString("memail");
				String mmbti = rs.getString("mmbti");
				Date mrdate = rs.getDate("mrdate");
				int mlike = rs.getInt("mlike");
				int mwritecount = rs.getInt("mwritecount");
				dtos.add(new MemberDto(mid, mpw, mname, mbirth, mgender, memail, mmbti, mrdate, mlike, mwritecount));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dtos;
	}
		
		
	// 6. 회원정보수정
	public int modifyMember(MemberDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MEMBER SET mPW=?, " + 
				"                  mNAME=?, " + 
				"                  mBIRTH=?, " + 
				"                  mGENDER=?, " + 
				"                  mEMAIL=?, " + 
				"                  mMBTI=? " + 
				"        WHERE mID=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMpw());
			pstmt.setString(2, dto.getMname());
			pstmt.setDate(3, dto.getMbirth());
			pstmt.setString(4, dto.getMgender());
			pstmt.setString(5, dto.getMemail());
			pstmt.setString(6, dto.getMmbti());
			pstmt.setString(7, dto.getMid());
			result = pstmt.executeUpdate();
			System.out.println("회원 수정 성공");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	
	// 7. 회원 수 보기
	public int totalMember() {
		int totCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) TOTCNT FROM MEMBER";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totCnt = rs.getInt("totcnt");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return totCnt;
	}
	
	
	// 9. 좋아요 올리기
	public void mLikeUp(String mid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MEMBER SET mLIKE = mLIKE+1 WHERE mID=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	// 10. 글쓴 갯수 올리기
	public void writecountUp(String mid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MEMBER SET mWRITECOUNT = mWRITECOUNT+1 WHERE mID=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
		
	// 12. 회원 상세보기
	public MemberDto detailsMember(String mid) {
		MemberDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER WHERE mID=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String mpw = rs.getString("mpw");
				Date mbirth = rs.getDate("mbirth");
				String mname = rs.getString("mname");
				String mgender = rs.getString("mgender");
				String memail = rs.getString("memail");
				String mmbti = rs.getString("mmbti");
				Date mrdate = rs.getDate("mrdate");
				int mlike = rs.getInt("mlike");
				int mwritecount = rs.getInt("mwritecount");
				dto = new MemberDto(mid, mpw, mname, mbirth, mgender, memail, mmbti, mrdate, mlike, mwritecount);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
}
