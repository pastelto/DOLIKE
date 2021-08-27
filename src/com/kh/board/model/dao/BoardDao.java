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
<<<<<<< HEAD
=======
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public int insertBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getNickName());
			pstmt.setString(2, b.getTagName());
			pstmt.setString(3, b.getBoardTitle());
			pstmt.setString(4, b.getBoardContent());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
		}
		
		return null;
	}
<<<<<<< HEAD
  
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
=======
	public int increaseCount(Connection conn, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
			
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
<<<<<<< HEAD
		
		return -1; //데이터베이스 오류 
	}
  
	public int write(String boardTitle, String nickName, String boardContent) {
		String sql = prop.getProperty("write");
=======
		return result;
	}
	public Board selectBoard(Connection conn, int bno) {
		Board b = null;
		
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
<<<<<<< HEAD
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, nickName);
			pstmt.setString(3, board.getTagName());
			pstmt.setString(4, boardTitle);
			pstmt.setDate(5, getDate());
			pstmt.setString(6, boardContent);
			
			return pstmt.executeUpdate();
=======
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			System.out.println(" bno dao값 확인 : "+ bno );
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board( rset.getInt("BOARD_NO"),
							rset.getString("NICKNAME"),
							rset.getString("TAG"),
							rset.getString("BOARD_TITLE"),
							rset.getDate("BOARD_DATE"),
							rset.getString("BOARD_CONTENT"),
							rset.getInt("VIEWS")
							);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}
	public int deleteBoard(Connection conn, int bid) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return -1;
	}
<<<<<<< HEAD
  
	public ArrayList<Board> getList(int pageNumber){
		String sql = prop.getProperty("getList");
		ArrayList<Board> list = new ArrayList<Board>();
=======
	
	public int updateBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateBoard");
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
		
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
<<<<<<< HEAD
  
	public boolean nextPage(int pageNumber) {
		String sql = prop.getProperty("nextPage");
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10); 
=======
	public Attachment selectAttachment(Connection conn, int bno) {
		Attachment at = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				at.setFileNo(rset.getInt("B_FILENO"));
				at.setOriginName(rset.getString("B_ORIGIN"));
				at.setChangeName(rset.getString("B_NEWNAME"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("at : " + at);
		return at;
	}
	public int insertAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getChangeName());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
			
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
<<<<<<< HEAD
  
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
=======
	public int deleteAttachment(Connection conn, int bid) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public ArrayList<Reply> selectRList(Connection conn, int bId) {
		ArrayList<Reply> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRlist");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bId);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			
			while(rset.next()) {
				list.add(new Reply(rset.getInt("REPLY_NO"),
								   rset.getString("REPLY_CONTENT"),
								   rset.getInt("REPLY_BNO"),
								   rset.getString("NICKNAME")));
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
<<<<<<< HEAD
		return null; 
		
	}
  
	public int boardUpdate(int boardNo, String boardTitle, String boardContent) {
		String sql = prop.getProperty("boardUpdate");
=======
		return list;      
	}
	public int insertReply(Connection conn, Reply r) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, r.getReplyWriter());
			pstmt.setString(2, r.getReplyContent());
			pstmt.setInt(3, r.getReplyBoardNo());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int searchBoard(Connection conn, String findBoard) {
		int result = 0;
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		System.out.println("검색어dao : "+findBoard);
		String sql = prop.getProperty("searchBoard");
		
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardTitle);
			pstmt.setString(2, boardContent);
			pstmt.setInt(3, boardNo);
<<<<<<< HEAD
			
<<<<<<< HEAD
			return pstmt.executeUpdate();
=======
			pstmt.setString(1, findBoard );
					
			//pstmt.setString(1, findBoard );
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
			
=======
			
<<<<<<< HEAD
			return pstmt.executeUpdate();
			
>>>>>>> parent of 6ceba06 (Merge branch 'master' of https://github.com/pastelto/DOLIKE)
=======
			if(rset.next()) { 
				result = rset.getInt(1); 
			}
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<Board> findBoard(Connection conn, String findBoard) {
		ArrayList<Board> blist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
<<<<<<< HEAD
		return -1;
	}
	public int boardDelete(int boardNo) {
		String sql = prop.getProperty("boardDelete");
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
=======
		String sql = prop.getProperty("findBoard");
		
		//int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		//int endRow = startRow + pi.getBoardLimit()-1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt.setInt(1, startRow);
			//pstmt.setInt(2, endRow);
			pstmt.setString(1, findBoard);
			//pstmt.setString(1, findBoard );
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				blist.add(new Board(rset.getInt("BOARD_NO"),
									rset.getInt("CATEGORY_NO"),
									rset.getString("BOARD_TITLE"),
									rset.getString("NICKNAME"),
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
		System.out.println("blist :" + blist);
		return blist;
	
	}

	public Attachment searchAttachment(Connection conn, String findBoard) {
		Attachment at = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, findBoard);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				at.setFileNo(rset.getInt("B_FILENO"));
				at.setOriginName(rset.getString("B_ORIGIN"));
				at.setChangeName(rset.getString("B_NEWNAME"));
			}
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
			
			return pstmt.executeUpdate();
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
<<<<<<< HEAD
		
		return -1;
=======
		System.out.println("at : " + at);
		return at;
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
	}

	
}
