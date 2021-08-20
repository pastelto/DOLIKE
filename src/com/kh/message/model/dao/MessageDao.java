package com.kh.message.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.message.model.vo.Message;
import com.kh.message.model.vo.MsgAttachment;
import com.kh.message.model.vo.MsgPageInfo;
import com.kh.notice.model.vo.Notice;

public class MessageDao {
	
	private Properties prop = new Properties();
	
	// message 쿼리 연결
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
	
	// 받은 쪽지 목록 가져오기
	public ArrayList<Message> selectList(Connection conn, MsgPageInfo pi){ 
		
		ArrayList<Message> list = new ArrayList<Message>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getMessageList");
		int startRow = (pi.getCurrentPage()-1)*pi.getMsgLimit()+1;
		int endRow = startRow + pi.getMsgLimit()-1;
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			// 쿼리
			// getMessageList=SELECT MSG_NO, SENDER_ID, MSG_TITLE, RECVTIME, MSG_STATUS FROM MESSAGE WHERE USER_ID = ?
			while(rset.next()) {
				list.add(new Message(rset.getInt("MSG_NO"),
									 rset.getString("RECV_ID"),
						 			 rset.getString("SENDER_ID"),
						 			 rset.getString("MSG_TITLE"),
						 			 rset.getDate("RECVTIME"),
						 			 rset.getString("MSG_STATUS")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("list dao ? " + list);
		return list;
	}
	
	// 받은 메세지 리스트 - 내용 읽어오기
	public Message selectMessage(Connection conn, int mno) {
		Message m= null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
			m = new Message(rset.getInt("MSG_NO"),
							rset.getString("RECV_ID"),
							rset.getString("SENDER_ID"),
							rset.getString("MSG_TITLE"),
							rset.getString("MSG_CONTENT"),
							rset.getDate("RECVTIME"),
							rset.getString("MSG_STATUS"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
	
	// 받은 메세지 읽음 처리
	public int msgReadStatus(Connection conn, int mno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("msgReadStatus");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}
	
	// 새 쪽지 작성하기
	public int insertNewMessage(Connection conn, Message m) { 
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertNewMessage");
			
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getRecvId());
			pstmt.setString(2, m.getSenderId());	
			pstmt.setString(3, m.getMsgTitle());
			pstmt.setString(4, m.getMsgContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("쪽지 발송?" + result);
		return result;
	}

	// 새 쪽지 - 첨부파일 첨부하기
	public int insertMsgAttachment(Connection conn, MsgAttachment mat) {
	
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMsgAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mat.getMatOrigin());
			pstmt.setString(2, mat.getMatNewName());
			pstmt.setString(3, mat.getMatLocation());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 받은 메세지 개수
	public int getMessageCount(Connection conn) {  
		int count = 0;
		Statement stmt =  null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getMessageCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return count;
	}


	

	
}
