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


public class BoardService {

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getListCount(conn);
		
		close(conn);
		return listCount;
	}

	public ArrayList<Board> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Board> listCount = new BoardDao().selectList(conn, pi);
		
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
		
		if(result1 * result2 > 0) {
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
}