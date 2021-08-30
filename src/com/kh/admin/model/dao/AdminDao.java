package com.kh.admin.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;


import com.kh.admin.model.vo.AdminPageInfo;
import com.kh.board.model.vo.Board;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao() {
		
		String fileName = MemberDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		System.out.println("fileName   " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public int getListCount(Connection conn) {
		
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount");
		System.out.println("갯 리스트 카우느"+sql);

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) { // 결과 값이 있으면 화면에 전체를 출력한다.
				listCount = rset.getInt(1); // 컬럼명을 적어주던가 , 숫자를 적어주면 된다.(컬럼명을 적는 것이 좋음)
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		System.out.println("어드민다오에서 listCount의 값은 : " + listCount);
		
		return listCount;
	}

	public ArrayList<Member> adminMemberList(Connection conn, AdminPageInfo ami) {
		
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminMemberList");
		System.out.println("쿼리문 : " + sql);
		int startRow = (ami.getCurrentPage()-1)*ami.getAdminLimit()+1;
		int endRow = startRow + ami.getAdminLimit()-1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getString("USER_ID"), 
								      rset.getString("USER_NAME"),
								      rset.getString("PASSWORD"),
								      rset.getString("BIRTHDATE"),
								      rset.getString("PHONE"),
								      rset.getString("EMAIL"),
								      rset.getString("NICKNAME"),
								      rset.getString("INTERESTS"),								      
								      rset.getDate("USER_CREATE_DATE"),
								      rset.getString("USER_STATUS")
						));
			}

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		System.out.println("다오에서 list 값 : " + list);
		return list;
	}

	public Member selectAdminMember(Connection conn, String amno) {
		
		Member am = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdminMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, amno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				am = new Member(  rset.getString("USER_ID"), 
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return am;
	}

	public ArrayList<Member> adminBlackList(Connection conn, AdminPageInfo amb) {
		
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminMemberBlackList");
		System.out.println("쿼리문 : " + sql);
		int startRow = (amb.getCurrentPage()-1)*amb.getAdminLimit()+1;
		int endRow = startRow + amb.getAdminLimit()-1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getString("USER_ID"), 
								      rset.getString("USER_NAME"),
								      rset.getString("PASSWORD"),
								      rset.getString("BIRTHDATE"),
								      rset.getString("PHONE"),
								      rset.getString("EMAIL"),
								      rset.getString("NICKNAME"),
								      rset.getString("INTERESTS"),								      
								      rset.getDate("USER_CREATE_DATE"),
								      rset.getString("USER_STATUS")
						));
			}

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		System.out.println("다오에서 list 값 : " + list);
		return list;
	}

	public int getBlackListCount(Connection conn) {
		
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getBlackListCount");
		System.out.println("갯 리스트 카운트"+sql);

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) { // 결과 값이 있으면 화면에 전체를 출력한다.
				listCount = rset.getInt(1); // 컬럼명을 적어주던가 , 숫자를 적어주면 된다.(컬럼명을 적는 것이 좋음)
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		System.out.println("어드민다오에서 listCount의 값은 : " + listCount);
		
		return listCount;
	}


	public int getBoardListCount(Connection conn) {

		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getBoardListCount");
		System.out.println("갯 리스트 카운트"+sql);

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) { // 결과 값이 있으면 화면에 전체를 출력한다.
				listCount = rset.getInt(1); // 컬럼명을 적어주던가 , 숫자를 적어주면 된다.(컬럼명을 적는 것이 좋음)
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		System.out.println("어드민다오에서 listCount의 값은 : " + listCount);
		
		return listCount;
	}

	public ArrayList<Board> adminBoardList(Connection conn, AdminPageInfo amb) {
		
		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminBoardList");
		System.out.println("쿼리문 : " + sql);
		int startRow = (amb.getCurrentPage()-1)*amb.getAdminLimit()+1;
		int endRow = startRow + amb.getAdminLimit()-1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO"),
						rset.getString("TAG"),
						rset.getInt("CATEGORY_NO"),
						rset.getString("BOARD_TITLE"),
						rset.getString("USER_ID"),
						rset.getDate("BOARD_DATE"),
						rset.getInt("VIEWS")
						));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		System.out.println("다오에서 list 값 : " + list);
		return list;
	}

	public int restoreMember(Connection conn, String status, String userId) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		
		String sql = prop.getProperty("memberStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, status);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}


}
