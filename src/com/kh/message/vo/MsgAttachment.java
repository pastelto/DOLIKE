package com.kh.message.vo;

public class MsgAttachment {

	private int matNo;
	private String matNewName;
	private String matOrigin;
	private String matLocation;
	private int msgNo;
	
	public MsgAttachment() {
		// TODO Auto-generated constructor stub
	}

	public MsgAttachment(int matNo, String matNewName, String matOrigin, String matLocation, int msgNo) {
		super();
		this.matNo = matNo;
		this.matNewName = matNewName;
		this.matOrigin = matOrigin;
		this.matLocation = matLocation;
		this.msgNo = msgNo;
	}

	public int getMatNo() {
		return matNo;
	}

	public void setMatNo(int matNo) {
		this.matNo = matNo;
	}

	public String getMatNewName() {
		return matNewName;
	}

	public void setMatNewName(String matNewName) {
		this.matNewName = matNewName;
	}

	public String getMatOrigin() {
		return matOrigin;
	}

	public void setMatOrigin(String matOrigin) {
		this.matOrigin = matOrigin;
	}

	public String getMatLocation() {
		return matLocation;
	}

	public void setMatLocation(String matLocation) {
		this.matLocation = matLocation;
	}

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	@Override
	public String toString() {
		return "MsgAttachment [matNo=" + matNo + ", matNewName=" + matNewName + ", matOrigin=" + matOrigin
				+ ", matLocation=" + matLocation + ", msgNo=" + msgNo + "]";
	}
	
	
	
}
