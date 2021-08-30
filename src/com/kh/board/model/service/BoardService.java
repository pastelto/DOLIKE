package com.kh.board.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;
import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.PageInfo;
import com.kh.board.model.vo.Reply;
import com.kh.follow.model.dao.FollowDao;


public class BoardService {

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getListCount(conn);
		
		close(conn);
		return listCount;
	}

	public ArrayList<Board> selectList(PageInfo pi, int cno) {
		Connection conn = getConnection();
		
		ArrayList<Board> listCount = new BoardDao().selectList(conn, pi, cno);
		
		close(conn);
		return listCount;
	}

	public int insertBoard(Board b, Attachment at) {

		Connection conn = getConnection();
		
		int result1 = new BoardDao().insertBoard(conn, b);
		
		int result2 = 1;
		if(at != null) {
			result2 = new BoardDao().insertAttachment(conn, at);
		}
		
		
		
		if(result1 >0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2 ;
		
	}

	public int deleteBoard(int bid) {
		Connection conn = getConnection();
		
		//게시글도 삭제
		int result1 = new BoardDao().deleteBoard(conn, bid);
		
		//첨부파일도 삭제
		int result2 = new BoardDao().deleteAttachment(conn, bid);
		
		//첨부파일은 없을 수도 있어서 리턴은 result1만 하면 된다!!
		if(result1 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1;
	}

	public int updateBoard(Board b, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new BoardDao().updateBoard(conn, b);
		int result2 = 1;
		
		if(at != null) {
			if(at.getFileNo()!=0) {
				result2 = new BoardDao().updateAttachment(conn, at);
			}else {
				result2 = new BoardDao().insertNewAttachment(conn, at);
			}
			
		}
		if(result1 * result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2 ;
	}

	public int insertReply(Reply r) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertReply(conn, r);
		
		if(result >0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<Reply> selectRList(int bId) {
		Connection conn = getConnection();
		ArrayList<Reply> list = new BoardDao().selectRList(conn, bId);
		
		close(conn);
		return list;
	}

	public Board selectBoard(int bno) {
		Connection conn = getConnection();
		
		int result = new BoardDao().increaseCount(conn, bno);
		
		
		Board b = null;
		
		if(result > 0) {
			commit(conn);
			b = new BoardDao().selectBoard(conn, bno);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return b;
	}

	public Attachment selectAttachment(int bno) {
		Connection conn = getConnection();
		
		Attachment at = new BoardDao().selectAttachment(conn, bno);
		
		close(conn);
		return at;
	}

	public Board selectUpdateBoard(int bno) {
		Connection conn = getConnection();
		
		Board b  = new BoardDao().selectBoard(conn, bno);
		
		close(conn);
		
		return b;
	}

	public int searchBoard(String findBoard) {
		Connection conn = getConnection();
		
		int result = new BoardDao().searchBoard(conn, findBoard);
		
		close(conn);
		return result;
	}

	public ArrayList<Board> findBoard(String findBoard) {
		Connection conn = getConnection();
		ArrayList<Board> blist = new BoardDao().findBoard(conn, findBoard);
		
		close(conn);
		return blist;
	}

	public Attachment searchAttachment(String findBoard) {
		Connection conn = getConnection();
		
		Attachment at = new BoardDao().searchAttachment(conn, findBoard);
		
		close(conn);
		return at;
	}
}