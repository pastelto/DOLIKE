package com.kh.message.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.message.model.dao.MessageDao;
import com.kh.message.model.vo.Message;

public class MessageService {

	public ArrayList<Message> selectList(){
		Connection conn = getConnection();
		
		ArrayList<Message> list = new MessageDao().selectList(conn);
		close(conn);
		
		return list;
	}
	
	
}
