package com.kh.board.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.Board;

public class BoardDao {

	private Board board = new Board();
	private Connection conn;
	private ResultSet rs;
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
<<<<<<< HEAD
			
			return pstmt.executeUpdate();
			
=======
			
			return pstmt.executeUpdate();
			
>>>>>>> parent of 6ceba06 (Merge branch 'master' of https://github.com/pastelto/DOLIKE)
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

	
}
