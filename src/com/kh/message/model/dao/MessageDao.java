 package com.kh.message.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.message.model.vo.Message;
import com.kh.message.model.vo.MsgAttachment;
import com.kh.message.model.vo.MsgPageInfo;


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
	public ArrayList<Message> selectList(Connection conn, MsgPageInfo pi, String userId){ 
		
		ArrayList<Message> list = new ArrayList<Message>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getMessageList");
		int startRow = (pi.getCurrentPage()-1)*pi.getMsgLimit()+1;
		int endRow = startRow + pi.getMsgLimit()-1;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, userId);
			
			rset = pstmt.executeQuery();
			System.out.println("sql? " + sql);
			System.out.println("rset? " + rset);
			while(rset.next()) {
				list.add(new Message(rset.getInt("MSG_NO"),
									 rset.getString("RECV_ID"),
						 			 rset.getString("SENDER_ID"),
						 			 rset.getString("MSG_TITLE"),
						 			 rset.getString("RECVTIME"),
						 			 rset.getString("MSG_STATUS")));
				
				System.out.println("list? " + list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		System.out.println("list dao ? " + list);
		return list;
	}
	
	// 받은 메세지 리스트 - 내용 읽어오기
	public Message selectMessage(Connection conn, int mno, String userId) {
		Message m= null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getMessageContent");
		System.out.println("받은 메세지 리스트!");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mno);
			pstmt.setString(2, userId);
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
			m = new Message(rset.getInt("MSG_NO"),
							rset.getString("RECV_ID"),
							rset.getString("SENDER_ID"),
							rset.getString("MSG_TITLE"),
							rset.getString("MSG_CONTENT"),
							rset.getString("RECVTIME"),
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
	public int msgReadStatus(Connection conn, int mno, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("msgReadStatus");
		System.out.println("dao mno? " + mno);
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, mno);
			
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
			
			System.out.println("mat! 새이름 : " + mat.getMatNewName());
			System.out.println("mat! 원래이름 : " + mat.getMatOrigin());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 받은 메세지 개수
	public int getMessageCount(Connection conn, String userId) {  
		int count = 0;
		PreparedStatement pstmt =  null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getMessageCount");
			
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	// 보낸 쪽지 개수
	public int getSendMessageCount(Connection conn, String userId) {
		int count = 0;
		PreparedStatement pstmt =  null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getSendMessageCount");
			
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	// 보낸 메세지 리스트
	public ArrayList<Message> selectSendList(Connection conn, MsgPageInfo pi, String userId) {
		ArrayList<Message> list = new ArrayList<Message>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getSendMsgList");
		int startRow = (pi.getCurrentPage()-1)*pi.getMsgLimit()+1;
		int endRow = startRow + pi.getMsgLimit()-1;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, userId);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Message(rset.getInt("MSG_NO"),
									 rset.getString("RECV_ID"),
						 			 rset.getString("SENDER_ID"),
						 			 rset.getString("MSG_TITLE"),
						 			 rset.getString("RECVTIME"),
						 			 rset.getString("MSG_STATUS")));
				
				System.out.println("list? " + list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		System.out.println("list dao ? " + list);
		return list;
	}

	// 삭제 쪽지 리스트 개수
	public int getDeleteMessageCount(Connection conn, String userId) {
		int count = 0;
		PreparedStatement pstmt =  null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getDeleteMessageCount");
			
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}

	// 삭제 쪽지 리스트 
	public ArrayList<Message> selectDeleteList(Connection conn, MsgPageInfo pi, String userId) {
		ArrayList<Message> list = new ArrayList<Message>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getDeleteMsgList");
		int startRow = (pi.getCurrentPage()-1)*pi.getMsgLimit()+1;
		int endRow = startRow + pi.getMsgLimit()-1;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, userId);
			
			rset = pstmt.executeQuery();
			System.out.println("sql? " + sql);
			System.out.println("rset? " + rset);
			while(rset.next()) {
				list.add(new Message(rset.getInt("MSG_NO"),
									 rset.getString("RECV_ID"),
						 			 rset.getString("SENDER_ID"),
						 			 rset.getString("MSG_TITLE"),
						 			 rset.getString("RECVTIME"),
						 			 rset.getString("MSG_STATUS")));
				
				System.out.println("list? " + list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		System.out.println("list dao ? " + list);
		return list;
	}
	
	// 첨부파일 선택 불러오기 // 아이디 골라야하나?
	public MsgAttachment selectMsgAttachment(Connection conn, int mno) {
		MsgAttachment mat = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMsgAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,mno);

			rset = pstmt.executeQuery();
			
			if(rset.next()) { 
				mat = new MsgAttachment();
				mat.setMatNo(rset.getInt("MAT_NO"));
				mat.setMatNewName(rset.getString("MAT_NEWNAME"));
				mat.setMatOrigin(rset.getString("MAT_ORIGIN"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return mat;
	}
	
	// 보낸 메세지 리스트 - 내용 읽어오기
	public Message selectSendMsg(Connection conn, int mno, String userId) {
		Message m= null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getSendMessageContent");
		System.out.println("보낸 쪽지 내용?");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mno);
			pstmt.setString(2, userId);
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
			m = new Message(rset.getInt("MSG_NO"),
							rset.getString("RECV_ID"),
							rset.getString("SENDER_ID"),
							rset.getString("MSG_TITLE"),
							rset.getString("MSG_CONTENT"),
							rset.getString("RECVTIME"),
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

	public int deleteRecvMsg(Connection conn, int mno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMessage");
		System.out.println("dao mno? " + mno);
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

	// 받은쪽지 - 첨부파일 상태 삭제로 변경
	public int deleteRecvAttachment(Connection conn, int mno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMsgAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,mno);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 보낸 쪽지 삭제
	public int deleteSendMsg(Connection conn, int mno, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteSendMessage");
		System.out.println("dao mno? " + mno);
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mno);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public int deleteSendAttachment(Connection conn, int mno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMsgAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,mno);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 새 쪽지 개수
	public int getNewMessageCount(Connection conn, String userId) {
		int count = 0;
		PreparedStatement pstmt =  null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getNewMessageCount");
			
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}

	// 휴지통 비우기 
	public int clearMsgBin(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("clearMsgBin");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}


	

	
}
