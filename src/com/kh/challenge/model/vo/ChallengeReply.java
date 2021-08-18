package com.kh.challenge.model.vo;

import java.util.Date;

public class ChallengeReply {
	
	private int rpNo;
	private int chNo;
	private String rpWriter;
	private Date writeDate;
	private String content;
	private String originName;
	private String newName;
	private String location;
	private int rpLike;
	private char status;
	
	public ChallengeReply() {
		// TODO Auto-generated constructor stub
	}

	public ChallengeReply(int rpNo, int chNo, String rpWriter, Date writeDate, String content, String originName,
			String newName, String location, int rpLike, char status) {
		super();
		this.rpNo = rpNo;
		this.chNo = chNo;
		this.rpWriter = rpWriter;
		this.writeDate = writeDate;
		this.content = content;
		this.originName = originName;
		this.newName = newName;
		this.location = location;
		this.rpLike = rpLike;
		this.status = status;
	}

	public int getRpNo() {
		return rpNo;
	}

	public void setRpNo(int rpNo) {
		this.rpNo = rpNo;
	}

	public int getChNo() {
		return chNo;
	}

	public void setChNo(int chNo) {
		this.chNo = chNo;
	}

	public String getRpWriter() {
		return rpWriter;
	}

	public void setRpWriter(String rpWriter) {
		this.rpWriter = rpWriter;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getNewName() {
		return newName;
	}

	public void setNewName(String newName) {
		this.newName = newName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getRpLike() {
		return rpLike;
	}

	public void setRpLike(int rpLike) {
		this.rpLike = rpLike;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ChallengeReply [rpNo=" + rpNo + ", chNo=" + chNo + ", rpWriter=" + rpWriter + ", writeDate=" + writeDate
				+ ", content=" + content + ", originName=" + originName + ", newName=" + newName + ", location="
				+ location + ", rpLike=" + rpLike + ", status=" + status + "]";
	}
	
	
	

}
