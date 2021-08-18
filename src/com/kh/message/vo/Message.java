package com.kh.message.vo;

import java.util.Date;

public class Message {

	private int msgNo;
	private String userId;
	private String recvId;
	private String senderId;
	private String msgTitle;
	private String msgContent;
	private Date recvtime;
	private char msgStatus;
	private char msgDel;
	private String msgFile;
	
	public Message() {
		// TODO Auto-generated constructor stub
	}
	
	public Message(int msgNo, String userId, String recvId, String senderId, String msgTitle, String msgContent,
			Date recvtime, char msgStatus, char msgDel) {
		super();
		this.msgNo = msgNo;
		this.userId = userId;
		this.recvId = recvId;
		this.senderId = senderId;
		this.msgTitle = msgTitle;
		this.msgContent = msgContent;
		this.recvtime = recvtime;
		this.msgStatus = msgStatus;
		this.msgDel = msgDel;
	}
	
	public Message(int msgNo, String userId, String recvId, String senderId, String msgTitle, String msgContent,
			Date recvtime, char msgStatus, char msgDel, String msgFile) {
		super();
		this.msgNo = msgNo;
		this.userId = userId;
		this.recvId = recvId;
		this.senderId = senderId;
		this.msgTitle = msgTitle;
		this.msgContent = msgContent;
		this.recvtime = recvtime;
		this.msgStatus = msgStatus;
		this.msgDel = msgDel;
		this.msgFile = msgFile;
	}
	
	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRecvId() {
		return recvId;
	}

	public void setRecvId(String recvId) {
		this.recvId = recvId;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getMsgTitle() {
		return msgTitle;
	}

	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public Date getRecvtime() {
		return recvtime;
	}

	public void setRecvtime(Date recvtime) {
		this.recvtime = recvtime;
	}

	public char getMsgStatus() {
		return msgStatus;
	}

	public void setMsgStatus(char msgStatus) {
		this.msgStatus = msgStatus;
	}

	public char getMsgDel() {
		return msgDel;
	}

	public void setMsgDel(char msgDel) {
		this.msgDel = msgDel;
	}

	public String getMsgFile() {
		return msgFile;
	}

	public void setMsgFile(String msgFile) {
		this.msgFile = msgFile;
	}

	@Override
	public String toString() {
		return "Message [msgNo=" + msgNo + ", userId=" + userId + ", recvId=" + recvId + ", senderId=" + senderId
				+ ", msgTitle=" + msgTitle + ", msgContent=" + msgContent + ", recvtime=" + recvtime + ", msgStatus="
				+ msgStatus + ", msgDel=" + msgDel + ", msgFile=" + msgFile + "]";
	} 
	
	
	
}
