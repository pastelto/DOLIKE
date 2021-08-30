package com.kh.follow.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.Board;
import com.kh.category.model.vo.Category;
import com.kh.follow.model.vo.Follow;
import com.kh.follow.model.vo.FollowCategoryPageInfo;
import com.kh.follow.model.vo.FollowPageInfo;
import com.kh.member.model.vo.Member;
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
				list.add(new Follow(rset.getInt("FOLLOW_NO"),
						rset.getString("USER_ID"),
						rset.getString("FOLLOW_ID"),
						rset.getString("FOLLOW_STATUS")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		System.out.println("dao"+list);
		
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


	public int deleteFollow(Connection conn, int fno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFollow");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, fno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}


	public int followCount(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("followCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
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


	public Member selectFollowInfo(Connection conn, String followId) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFollowInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, followId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return m;
	}


	public int deleteFollowVer2(Connection conn, String userId, String followId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFollowVer2");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, followId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<Category> categoryList(Connection conn) {
		ArrayList<Category> catList = new ArrayList<Category>();
		Statement stmt =  null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("categoryList");
		
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				catList.add(new Category(rset.getInt("CATEGORY_NO"), 
								      rset.getString("CATEGORY_NAME")
						));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(stmt);
		}
		return catList;
	}


	public int countFollower(Connection conn, String followId) {
		int result = 0;
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("countFollower");
		
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


	public int countFollowBoard(Connection conn, String followId) {
		int result = 0;
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("countFollowBoard");
		
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


	public int getCatBoardListCount(Connection conn, String followId, String catTitle) {
		int result = 0;
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getCatBoardListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, followId);
			pstmt.setString(2, catTitle);
			
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


	public ArrayList<Board> selectFollowBoardList(Connection conn, String followId, String catTitle,
			FollowCategoryPageInfo pi) {
		ArrayList<Board> list = new ArrayList<Board>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFollowBoardList");
		
		System.out.println("dao(유저 카테고리별게시글 sql): "+sql);
		
		int startRow = (pi.getCurrentPage()-1)*pi.getCatBoardLimit()+1;
		int endRow = startRow + pi.getCatBoardLimit()-1;
		
		System.out.println("dao(유저 카테고리별게시글 followId): "+followId);
		System.out.println("dao(유저 카테고리별게시글 catTitle): "+catTitle);
		System.out.println("dao(유저 카테고리별게시글 startRow): "+startRow);
		System.out.println("dao(유저 카테고리별게시글 endRow): "+endRow);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, followId);
			pstmt.setString(2, catTitle);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board( rset.getInt("BOARD_NO"),
						rset.getString("NICKNAME"),
						rset.getString("TAG"),
						rset.getString("BOARD_TITLE"),
						rset.getDate("BOARD_DATE"),
						rset.getString("BOARD_CONTENT"),
						rset.getInt("VIEWS"),
						rset.getInt("CATEGORY_NO")
						));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		System.out.println("dao: "+list);
		
		return list;
	}


	public ArrayList<Follow> selectFollowTop4User(Connection conn) {
		ArrayList<Follow> flist = new ArrayList<Follow>();
		Statement stmt =  null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFollowTop4User");
		
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				flist.add(new Follow(
						rset.getString("FOLLOW_ID")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(stmt);
		}
		return flist;
	}


	public ArrayList<Follow> selectCategoryTop4User(Connection conn, String categoryName) {
		ArrayList<Follow> catFlTop = new ArrayList<Follow>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCategoryTop4User");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, categoryName);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				catFlTop.add(new Follow(
						rset.getString("FOLLOW_ID")));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return catFlTop;
	}

}
