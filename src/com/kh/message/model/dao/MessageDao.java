package com.kh.message.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.message.model.vo.Message;

public class MessageDao {
	
	private Properties prop = new Properties();
	
	public MessageDao() {
		String fileName = MessageDao.class.getResource("/sql/message/message-query.properties").getPath();
		System.out.println("fileName = " + fileName);
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	

	public ArrayList<Message> selectList(Connection conn){
		
		ArrayList<Message> list = new ArrayList<Message>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getMessageList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			// 쿼리
			// getMessageList=SELECT MSG_NO, SENDER_ID, MSG_TITLE, RECVTIME, MSG_STATUS FROM MESSAGE WHERE USER_ID = ?
			while(rset.next()) {
				list.add(new Message(rset.getInt("MSG_NO"),
						 			 rset.getString("SENDER_ID"),
						 			 rset.getString("MSG_TITLE"),
						 			 rset.getDate("RECVTIME"),
						 			 rset.getString("MSG_STATUS")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
}
