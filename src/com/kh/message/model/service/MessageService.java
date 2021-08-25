package com.kh.message.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Attachment;
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

	public Message msgReadStatus(int mno, String userId) {
		Connection conn = getConnection();
		
		int result = new MessageDao().msgReadStatus(conn, mno, userId);
		Message m = null;
		System.out.println("서비스 : msgReadStatus = " + result);
		if(result > 0) {
			commit(conn);
			m = new MessageDao().selectMessage(conn, mno, userId);
		}else {
			m = new MessageDao().selectMessage(conn, mno, userId);
		}
		
		close(conn);
		
		return m;
	}

	public int getSendMessageCount(String userId) { // 보낸 쪽지 목록 개수 
		Connection conn = getConnection();
		
		int count = new MessageDao().getSendMessageCount(conn, userId);
		close(conn);
		
		return count;
	}

	public ArrayList<Message> selectSendList(MsgPageInfo pi, String userId) {
		Connection conn = getConnection();
		
		ArrayList<Message> list = new MessageDao().selectSendList(conn, pi, userId);
		close(conn);
		
		return list;
	}

	public int getDeleteMessageCount(String userId) { // 받은 삭제 쪽지 목록 개수
		Connection conn = getConnection();
		
		int count = new MessageDao().getDeleteMessageCount(conn, userId);
		close(conn);
		
		return count;
	}

	// 휴지통 리스트
	public ArrayList<Message> selectDeleteList(MsgPageInfo pi, String userId) {
		Connection conn = getConnection();
		
		ArrayList<Message> list = new MessageDao().selectDeleteList(conn, pi, userId);
		close(conn);
		
		return list;
	}
	
	// 첨부파일 선택 조회
	public MsgAttachment selectMsgAttachment(int mno) {
		Connection conn = getConnection();
		
		MsgAttachment mat = new MessageDao().selectMsgAttachment(conn, mno);
		close(conn);
		
		return mat;
	}
	
	// 보낸 쪽지 선택 조회
	public Message selectSendMsg(int mno, String userId) {
		Connection conn = getConnection();

		Message m = new MessageDao().selectSendMsg(conn, mno, userId);
		close(conn);
		
		return m;
	}

	// 받은 쪽지 삭제
	public int deleteRecvMsg(int mno) {
		Connection conn = getConnection();
		
		int result1 = new MessageDao().deleteRecvMsg(conn, mno);
		int result2 = new MessageDao().deleteRecvAttachment(conn, mno);
		
		// 첨부파일 유무에 따라
		if(result1 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result1;
	}

	// 보낸 쪽지 삭제
	public int deleteSendMsg(int mno, String userId) {
		Connection conn = getConnection();
		
		int result1 = new MessageDao().deleteSendMsg(conn, mno, userId);
		int result2 = new MessageDao().deleteSendAttachment(conn, mno);
		
		// 첨부파일 유무에 따라
		if(result1 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result1;
	}
	
	// 새 쪽지 개수
	public int getNewMessageCount(String userId) {
		Connection conn = getConnection();
		
		int count = new MessageDao().getNewMessageCount(conn, userId);
		close(conn);
		
		return count;
	}


	
	
}
