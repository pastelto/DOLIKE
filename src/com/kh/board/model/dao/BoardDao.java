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

import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.PageInfo;
import com.kh.board.model.vo.Reply;

public class BoardDao {

	private Properties prop = new Properties();
	
	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();  
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

	public int getListCount(Connection conn, int cno) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
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

	public ArrayList<Board> selectList(Connection conn, PageInfo pi, int cno) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow = startRow + pi.getBoardLimit()-1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO"),
									rset.getString("TAG"),
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
		
		return list;
	}
	public int insertBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		System.out.println("dao : " + b);
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getNickName());
			pstmt.setString(2, b.getTagName());
			pstmt.setString(3, b.getBoardTitle());
			pstmt.setString(4, b.getBoardContent());
			pstmt.setInt(5, b.getCategoryNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("result" + result);
		return result;
	}
	public int increaseCount(Connection conn, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public Board selectBoard(Connection conn, int bno) {
		Board b = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			System.out.println(" bno dao??? ?????? : "+ bno );
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board( rset.getInt("BOARD_NO"),
							rset.getString("NICKNAME"),
							rset.getString("TAG"),
							rset.getString("BOARD_TITLE"),
							rset.getDate("BOARD_DATE"),
							rset.getString("BOARD_CONTENT"),
							rset.getInt("VIEWS"),
							rset.getInt("CATEGORY_NO")
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
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getTagName());
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());
			pstmt.setInt(4, b.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int updateAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getChangeName());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int insertNewAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getRefBoardNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
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
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
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
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	finally {
			close(rset);
			close(pstmt);
		}
		
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
		System.out.println("?????????dao : "+findBoard);
		String sql = prop.getProperty("searchBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, findBoard );

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

	public ArrayList<Board> findBoard(Connection conn, String findBoard) {
		ArrayList<Board> blist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findBoard");
	
		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt.setInt(1, startRow);
			//pstmt.setInt(2, endRow);
			pstmt.setString(1, findBoard);
			//pstmt.setString(1, findBoard );
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				blist.add(new Board(rset.getInt("BOARD_NO"),
									rset.getString("TAG"),
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

	
}
