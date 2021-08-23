package com.kh.message.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.message.model.dao.MessageDao;
import com.kh.message.model.vo.Message;
import com.kh.message.model.vo.MsgAttachment;

public class MessageService {

	public ArrayList<Message> selectList(){
		Connection conn = getConnection();
		
		ArrayList<Message> list = new MessageDao().selectList(conn);
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
	
	
}
