package com.kh.board.model.dao;

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
import com.kh.board.model.vo.PageInfo;

public class BoardDao {

	private Board board = new Board();
	private Connection conn;
	private Properties prop = new Properties();
	
	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath(); //MemberDao 참조 ? 
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
  
	public Date getDate() {
		String sql = prop.getProperty("getDate");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getDate(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
  
	public int getNext() {
		String sql = prop.getProperty("getNext");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫번째 게시물인 경우 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return -1; //데이터베이스 오류 
	}
  
	public int write(String boardTitle, String nickName, String boardContent) {
		String sql = prop.getProperty("write");
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, nickName);
			pstmt.setString(3, board.getTagName());
			pstmt.setString(4, boardTitle);
			pstmt.setDate(5, getDate());
			pstmt.setString(6, boardContent);
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return -1;
	}
  
	public ArrayList<Board> getList(int pageNumber){
		String sql = prop.getProperty("getList");
		ArrayList<Board> list = new ArrayList<Board>();
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10); 
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setBoardNo(rs.getInt(1));
				board.setNickName(rs.getString(2));
				board.setTagName(rs.getString(3));
				board.setBoardTitle(rs.getString(4));
				board.setBoardDate(rs.getDate(5));
				board.setBoardContent(rs.getString(6));
				list.add(board);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list; //데이터베이스 오류 
		
	}
  
	public boolean nextPage(int pageNumber) {
		String sql = prop.getProperty("nextPage");
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10); 
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false; 
	}
  
	public Board getBoard(int boardNo) {
		String sql = prop.getProperty("getBoard");
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo); 
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Board board = new Board();
				board.setBoardNo(rs.getInt(1));
				board.setNickName(rs.getString(2));
				board.setTagName(rs.getString(3));
				board.setBoardTitle(rs.getString(4));
				board.setBoardDate(rs.getDate(5));
				board.setBoardContent(rs.getString(6));
				return board;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null; 
		
	}
  
	public int boardUpdate(int boardNo, String boardTitle, String boardContent) {
		String sql = prop.getProperty("boardUpdate");
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardTitle);
			pstmt.setString(2, boardContent);
			pstmt.setInt(3, boardNo);
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return -1;
	}
	public int boardDelete(int boardNo) {
		String sql = prop.getProperty("boardDelete");
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			return pstmt.executeUpdate();
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return -1;
	}

	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}

	public ArrayList<Board> selectList(Connection conn, PageInfo pi) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow = startRow + pi.getBoardLimit()-1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO"),
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
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
}
