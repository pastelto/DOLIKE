package com.kh.common.searchMember.model.dao;
import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.searchMember.model.vo.SearchListPageInfo;
import com.kh.member.model.vo.Member;

public class searchDao {

	private Properties prop = new Properties();
	
	// searchUser 쿼리 연결
	public searchDao() {
		String fileName = searchDao.class.getResource("/sql/message/searchuser-query.properties").getPath();
		System.out.println("fileName = " + fileName);
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	// 검색한 아이디 관련 리스트
	public ArrayList<Member> selectSearchUserList(Connection conn, String userId, String searchWord, String choice, SearchListPageInfo pi) {
		ArrayList<Member> list = new ArrayList<Member>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getSearchUserList");
		int startRow = (pi.getCurrentPage()-1)*pi.getMsgLimit()+1;
		int endRow = startRow + pi.getMsgLimit()-1;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, choice);
			pstmt.setString(2,  "%'" + searchWord + "%'");
			pstmt.setString(3, userId);
			pstmt.setString(4, choice);
			pstmt.setInt(5, startRow);
			pstmt.setInt(6, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Member m = new Member();
				m.setUserId(rset.getString("USER_ID"));
				m.setNickName(rset.getString("NICKNAME"));
				list.add(m);
				
				System.out.println("list? " + list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		System.out.println("searchList dao ? " + list);
		return list;
	}
	
	
	// 검색한 아이디 개수
	public int getSearchUserListCount(Connection conn, String userId, String searchWord, String choice) {
		int count = 0;
		PreparedStatement pstmt =  null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getSearchUserListCount");
			
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, choice);
			pstmt.setString(2, userId);
			pstmt.setString(3, choice);
			pstmt.setString(4, "%'" + searchWord + "%'");
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("count? : " + count);
		return count;
	}

}
