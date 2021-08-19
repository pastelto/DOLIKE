package com.kh.notice.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;
import com.kh.notice.model.vo.NoticePageInfo;

public class NoticeService {

	public ArrayList<Notice> selectList(NoticePageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(conn, pi);
		close(conn);
		return list;
	}

	public Notice selectNotice(int nno) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().increaseCount(conn, nno);
		Notice n = null;
		
		if(result > 0) {
			commit(conn);
			n = new NoticeDao().selectNotice(conn, nno);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return n;
	}

	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().insertNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new NoticeDao().getListCount(conn);
		
		close(conn);
		return listCount;
	}

	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().updateNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public Notice selectUpdateNotice(int nno) {
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectNotice(conn, nno);
		
		close(conn);
		return n;
	}

	public int deleteNotice(int nno) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().deleteNotice(conn, nno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

}
