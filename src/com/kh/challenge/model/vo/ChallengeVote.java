package com.kh.challenge.model.vo;

import java.util.Date;

public class ChallengeVote {

	private String chTitle;
	private String content;
	private int apNo;
	private String start;
	private String end;
	private int voteCount;
	private int categoryNo;
	private String categoryName;
	
	public ChallengeVote() {
		// TODO Auto-generated constructor stub
	}

	
	
	public ChallengeVote(String chTitle, String content, int apNo, String start, String end, int voteCount, int categoryNo,
			String categoryName) {
		super();
		this.chTitle = chTitle;
		this.content = content;
		this.apNo = apNo;
		this.start = start;
		this.end = end;
		this.voteCount = voteCount;
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
	}


	public ChallengeVote(String chTitle,String content, String start, String end, String categoryName) {
		super();
		this.chTitle = chTitle;
		this.content = content;
		this.start = start;
		this.end = end;
		this.categoryName = categoryName;
	}

	public String getChTitle() {
		return chTitle;
	}

	public void setChTitle(String chTitle) {
		this.chTitle = chTitle;
	}
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getApNo() {
		return apNo;
	}

	public void setApNo(int apNo) {
		this.apNo = apNo;
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

	public int getVoteCount() {
		return voteCount;
	}

	public void setVoteCount(int voteCount) {
		this.voteCount = voteCount;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}	

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}



	@Override
	public String toString() {
		return "ChallengeVote [chTitle=" + chTitle + ", content=" + content + ", apNo=" + apNo + ", start=" + start
				+ ", end=" + end + ", voteCount=" + voteCount + ", categoryNo=" + categoryNo + ", categoryName="
				+ categoryName + "]";
	}



	


	
}
