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

import com.kh.member.model.vo.Member;
import com.kh.message.model.vo.Message;
import com.kh.message.model.vo.MsgPageInfo;

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
	public ArrayList<Member> selectSearchUserList(Connection conn, String userId, String searchWord, MsgPageInfo pi) {
		ArrayList<Member> list = new ArrayList<Member>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getSearchUserList");
		int startRow = (pi.getCurrentPage()-1)*pi.getMsgLimit()+1;
		int endRow = startRow + pi.getMsgLimit()-1;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, userId);
			pstmt.setString(4,  "%'" + searchWord + "%'");
			
			rset = pstmt.executeQuery();
			System.out.println("sql? " + sql);
			System.out.println("rset? " + rset);
			
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
	public int getSearchUserListCount(Connection conn, String userId, String searchWord) {
		int count = 0;
		PreparedStatement pstmt =  null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getSearchUserListCount");
			
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, "%'" + searchWord + "%'");
			
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
		return count;
	}

}
