package com.kh.challenge.model.vo;

import java.util.Date;

public class Challenge {
	
	private int chNo;
	private String chTitle;
	private int voteCount;
	private String start;
	private String end;
	private char status;
	private String content;
	private int userCount;
	private int categoryNo;
	private String categoryTitle;
	
	private String user;
	private int rpCount;
	private String achieve;
	private String nickname;
	
	private String atTitle;
	
	public Challenge() {
		// TODO Auto-generated constructor stub
	}
	// select challenge
	public Challenge(int chNo, String chTitle, int voteCount, String start, String end, char status, String content,
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
	public Challenge(String user,int chNo, int rpCount, String achieve) {
		super();
		this.user = user;
		this.chNo = chNo;
		this.rpCount = rpCount;
		this.achieve = achieve;
		
	}
	
	// insert_category
	public Challenge(int chNo, String chTitle, int voteCount, String start, String end, char status, String content,
			int userCount, int categoryNo) {
		super();
		this.chNo = chNo;
		this.chTitle = chTitle;
		this.voteCount = voteCount;
		this.start = start;
		this.end = end;
		this.status = status;
		this.content = content;
		this.userCount = userCount;
		this.categoryNo = categoryNo;
	}
	
	public Challenge(String chTitle, String content, String categoryTitle) {
		super();
		this.chTitle = chTitle;
		this.content = content;
		this.categoryTitle = categoryTitle;
	}
	
	public Challenge(int chNo, String chTitle, int rpCount, String achieve, String nickname) {
		super();
		this.chNo = chNo;
		this.chTitle = chTitle;
		this.rpCount = rpCount;
		this.achieve = achieve;
		this.nickname = nickname;
	}

	
	
	public Challenge(int chNo, String chTitle, String start, String end,  String categoryTitle) {
		super();
		this.chNo = chNo;
		this.chTitle = chTitle;
		this.start = start;
		this.end = end;
		this.categoryTitle = categoryTitle;
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

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
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

	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}

	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
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
	public String getAchieve() {
		return achieve;
	}
	public void setAchieve(String achieve) {
		this.achieve = achieve;
	}
	
	public String getAtTitle() {
		return atTitle;
	}
	public void setAtTitle(String atTitle) {
		this.atTitle = atTitle;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	
	@Override
	public String toString() {
		return "Challenge [chNo=" + chNo + ", chTitle=" + chTitle + ", voteCount=" + voteCount + ", start=" + start
				+ ", end=" + end + ", status=" + status + ", content=" + content + ", userCount=" + userCount
				+ ", categoryNo=" + categoryNo + ", categoryTitle=" + categoryTitle + ", user=" + user + ", rpCount="
				+ rpCount + ", achieve=" + achieve + ", nickname=" + nickname + ", atTitle=" + atTitle + "]";
	}
	
	
	
	
	
	
	
		

}
