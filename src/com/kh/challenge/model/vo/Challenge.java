package com.kh.challenge.model.vo;

import java.util.Date;

public class Challenge {
	
	private int chNo;
	private String chTitle;
	private int voteCount;
	private Date start;
	private Date end;
	private char status;
	private String content;
	private int userCount;
	private String categoryTitle;
	
	private String user;
	private int rpCount;
	private char achieve;
	
	private String atTitle;
	
	public Challenge() {
		// TODO Auto-generated constructor stub
	}
	// select challenge
	public Challenge(int chNo, String chTitle, int voteCount, Date start, Date end, char status, String content,
			int userCount, String categoryTitle) {
		super();
		this.chNo = chNo;
		this.chTitle = chTitle;
		this.voteCount = voteCount;
		this.start = start;
		this.end = end;
		this.status = status;
		this.content = content;
		this.userCount = userCount;
		this.categoryTitle = categoryTitle;
	}	
	// ch_user
	public Challenge(String user,int chNo, int rpCount, char achieve) {
		super();
		this.user = user;
		this.chNo = chNo;
		this.rpCount = rpCount;
		this.achieve = achieve;
	}

	public int getChNo() {
		return chNo;
	}

	public void setChNo(int chNo) {
		this.chNo = chNo;
	}

	public String getChTitle() {
		return chTitle;
	}

	public void setChTitle(String chTitle) {
		this.chTitle = chTitle;
	}

	public int getVoteCount() {
		return voteCount;
	}

	public void setVoteCount(int voteCount) {
		this.voteCount = voteCount;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getUserCount() {
		return userCount;
	}

	public void setUserCount(int userCount) {
		this.userCount = userCount;
	}

	public String getCategoryTitle() {
		return categoryTitle;
	}

	public void setCategoryTitle(String getCategoryTitle) {
		this.categoryTitle = categoryTitle;
	}
	
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public int getRpCount() {
		return rpCount;
	}
	public void setRpCount(int rpCount) {
		this.rpCount = rpCount;
	}
	public char getAchieve() {
		return achieve;
	}
	public void setAchieve(char achieve) {
		this.achieve = achieve;
	}
	
	
	public String getAtTitle() {
		return atTitle;
	}
	public void setAtTitle(String atTitle) {
		this.atTitle = atTitle;
	}
	
	
	@Override
	public String toString() {
		return "Challenge [chNo=" + chNo + ", chTitle=" + chTitle + ", voteCount=" + voteCount + ", start=" + start
				+ ", end=" + end + ", status=" + status + ", content=" + content + ", userCount=" + userCount
				+ ", categoryTitle=" + categoryTitle + "]";
	}
		

}
