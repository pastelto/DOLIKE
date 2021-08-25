package com.kh.follow.model.dao;

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

import com.kh.follow.model.vo.Follow;
import com.kh.follow.model.vo.FollowPageInfo;
import com.kh.notice.model.vo.Notice;
import com.kh.notice.model.vo.NoticePageInfo;

public class FollowDao {

	private Properties prop = new Properties();

	public FollowDao() {
		String fileName = FollowDao.class.getResource("/sql/follow/follow-query.properties").getPath();
		System.out.println("fileName: " + fileName);
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
	
	
	public int searchId(Connection conn, String followId) {
		int result = 0;
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, followId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { 
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


	public int insertId(Connection conn, Follow fl) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertId");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, fl.getUserId());
			pstmt.setString(2, fl.getFollowId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}


	public ArrayList<Follow> selectList(Connection conn, String userId, FollowPageInfo pi) {
		ArrayList<Follow> list = new ArrayList<Follow>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFollowList");
		
		int startRow = (pi.getCurrentPage()-1)*pi.getFollowLimit()+1;
		int endRow = startRow + pi.getFollowLimit()-1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Follow(rset.getString("FOLLOW_ID")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	public int countId(Connection conn, String userId, String followId) {
		int result = 0;
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("countId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, followId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { 
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


	public int getListCount(Connection conn, String userId) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

}
