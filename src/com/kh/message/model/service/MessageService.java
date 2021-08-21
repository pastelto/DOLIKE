package com.kh.message.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.message.model.dao.MessageDao;
import com.kh.message.model.vo.Message;
import com.kh.message.model.vo.MsgAttachment;
import com.kh.message.model.vo.MsgPageInfo;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;

public class MessageService {

	public ArrayList<Message> selectList(MsgPageInfo pi, String userId){
		Connection conn = getConnection();
		
		ArrayList<Message> list = new MessageDao().selectList(conn, pi, userId);
		close(conn);
		
		return list;
	}

	public int insertNewMessage(Message m, MsgAttachment mat) {
		Connection conn = getConnection();
		
		// 쪽지 내용
		int result1 = new MessageDao().insertNewMessage(conn, m);
		
		// 쪽지 첨부파일
		int result2 = 1;
		if(mat != null) {
			result2 = new MessageDao().insertMsgAttachment(conn, mat);
		}
		
		if(result1 * result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}
	
	
	public int getMessageCount(String userId) { // 받은 쪽지 목록 개수
		Connection conn = getConnection();
		
		int count = new MessageDao().getMessageCount(conn, userId);
		close(conn);
		
		return count;
	}

	public Message selectMessage(int mno) {
		Connection conn = getConnection();
		
		int result = new MessageDao().msgReadStatus(conn, mno);
		Message m = null;
		
		if(result > 0) {
			commit(conn);
			m = new MessageDao().selectMessage(conn, mno);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return m;
	}
	
	
}
