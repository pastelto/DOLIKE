package com.kh.member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.member.model.vo.Member;
import static com.kh.common.JDBCTemplate.*;

public class MemberDao {

	private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//회원 로그인 : 아이디, 비밀번호 일치시 로그인하여 loginUser 리턴.
	public Member loginMember(Connection conn, String userId, String userPwd) {
		Member loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			System.out.println(userId);
			System.out.println(userPwd);
			rset = pstmt.executeQuery();
			System.out.println(rset);
			if (rset.next()) {
				loginUser = new Member(
						rset.getString("USER_ID"),
						rset.getString("USER_NAME"),
						rset.getString("PASSWORD"),
						rset.getString("BIRTHDATE"),
						rset.getString("PHONE"),
						rset.getString("EMAIL"),
						rset.getString("NICKNAME"),
						rset.getString("INTERESTS"),
						rset.getDate("USER_CREATE_DATE"),
						rset.getString("USER_STATUS")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
	}
	
	
	//회원가입
	public int insertMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		java.sql.Date birth = java.sql.Date.valueOf(m.getBirthDate());
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getUserPwd());
			pstmt.setString(4, m.getBirthDate());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getNickName());
			pstmt.setString(8, m.getInterests());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	//회원선택
	public Member selectMember(Connection conn, String userId) {
		Member mem = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				mem = new Member(
						rset.getString("USER_ID"),
						rset.getString("USER_NAME"),
						rset.getString("PASSWORD"),
						rset.getString("BIRTHDATE"),
						rset.getString("PHONE"),
						rset.getString("EMAIL"),
						rset.getString("NICKNAME"),
						rset.getString("INTERESTS"),
						rset.getDate("USER_CREATE_DATE"),
						rset.getString("USER_STATUS")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return mem;
	}
	
	
	//회원정보수정 : 비밀번호, 닉네임, 관심사만 수정 가능
	//update PASSWORD, NICKNAME, INTERESTS
<<<<<<< HEAD
<<<<<<< HEAD
	public int updateMember(Connection conn, String newPwd, String userId, String userPwd, String nickName, String interests) {
=======
	public int updateMember(Connection conn, String userId, String userPwd, String nickName, String interests1, String interests2, String interests3) {
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
=======
	public int updateMember(Connection conn, String userId, String userPwd, String nickName, String interests) {
>>>>>>> parent of ad3e5c8 (Merge pull request #110 from pastelto/soyoung)
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userPwd);
			pstmt.setString(2, nickName);
			pstmt.setString(3, interests);
			pstmt.setString(4, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//회원탈퇴 : 탈퇴회원리스트 보관을 위해 회원상태값 Y에서 N으로 변경
	//update USER_STATUS='N'
	public int deleteMember(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int idCheck(Connection conn, String userId) {
		// TODO Auto-generated method stub
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
<<<<<<< HEAD
=======

	public int nickCheck(Connection conn, String nickName) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("nickCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, nickName);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int phoneCheck(Connection conn, String phone) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("phoneCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, phone);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int emailCheck(Connection conn, String email) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("emailCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public int accessUpdate(Connection conn, String userId, String userPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("accessUpdate");
		
		System.out.println("loginUserId11 : " + userId);
		System.out.println("loginUserPwd11 : " + userPwd);
		System.out.println("sql1 :" + sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			System.out.println("sql2 :" + sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			System.out.println("loginUserId : " + userId);
			System.out.println("loginUserPwd : " + userPwd);
			rset = pstmt.executeQuery();
			System.out.println("ResultSet : " + rset);
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
	 
}
