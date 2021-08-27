package com.kh.message.model.vo;

import java.util.Date;

public class Message {

	private int msgNo;
	private String recvId;
	private String senderId;
	private String msgTitle;
	private String msgContent;
	private String recvtime;
	private String msgStatus;
	private String msgDel;
	private String msgFile;
	
	public Message() {
		// TODO Auto-generated constructor stub
	}
	
	public Message(int msgNo, String recvId, String senderId, String msgTitle, String msgContent,
			String recvtime, String msgStatus, String msgDel) {
		super();
		this.msgNo = msgNo;
		this.recvId = recvId;
		this.senderId = senderId;
		this.msgTitle = msgTitle;
		this.msgContent = msgContent;
		this.recvtime = recvtime;
		this.msgStatus = msgStatus;
		this.msgDel = msgDel;
	}
	
	public Message(int msgNo, String recvId, String senderId, String msgTitle, String msgContent,
			String recvtime, String msgStatus, String msgDel, String msgFile) {
		super();
		this.msgNo = msgNo;
		this.recvId = recvId;
		this.senderId = senderId;
		this.msgTitle = msgTitle;
		this.msgContent = msgContent;
		this.recvtime = recvtime;
		this.msgStatus = msgStatus;
		this.msgDel = msgDel;
		this.msgFile = msgFile;
	}
	
	
	public Message(int msgNo, String recvId, String senderId, String msgTitle, String recvtime, String msgStatus) {
		super();
		this.msgNo = msgNo;
		this.recvId = recvId;
		this.senderId = senderId;
		this.msgTitle = msgTitle;
		this.recvtime = recvtime;
		this.msgStatus = msgStatus;
	}
<<<<<<< HEAD
=======
	
	public Message(int msgNo, String recvId, String senderId, String msgTitle, String msgContent, String recvtime, String msgStatus) {
		super();
		this.msgNo = msgNo;
		this.recvId = recvId;
		this.senderId = senderId;
		this.msgTitle = msgTitle;
		this.msgContent = msgContent;
		this.recvtime = recvtime;
		this.msgStatus = msgStatus;
	}
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
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

	public String getRecvtime() {
		return recvtime;
	}

	public void setRecvtime(String recvtime) {
		this.recvtime = recvtime;
	}

	public String getMsgStatus() {
		return msgStatus;
	}

	public void setMsgStatus(String msgStatus) {
		this.msgStatus = msgStatus;
	}

	public String getMsgDel() {
		return msgDel;
	}

	public void setMsgDel(String msgDel) {
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
		return "Message [msgNo=" + msgNo + ", recvId=" + recvId + ", senderId=" + senderId
				+ ", msgTitle=" + msgTitle + ", msgContent=" + msgContent + ", recvtime=" + recvtime + ", msgStatus="
				+ msgStatus + ", msgDel=" + msgDel + ", msgFile=" + msgFile + "]";
	} 
	
	
	
}
