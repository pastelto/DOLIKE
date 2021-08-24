package com.kh.challenge.model.vo;

import java.util.Date;

public class ChallengeVote {

	private String chTitle;
	private int apNo;
	private Date start;
	private Date end;
	private int voteCount;
	private int categoryNo;
	private String categoryName;
	
	public ChallengeVote() {
		// TODO Auto-generated constructor stub
	}

	public ChallengeVote(String chTitle, int apNo, Date start, Date end, int voteCount, int categoryNo) {
		super();
		this.chTitle = chTitle;
		this.apNo = apNo;
		this.start = start;
		this.end = end;
		this.voteCount = voteCount;
		this.categoryNo = categoryNo;
	}
	
	public ChallengeVote(String chTitle, Date start, Date end, String categoryName) {
		super();
		this.chTitle = chTitle;
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

	public int getApNo() {
		return apNo;
	}

	public void setApNo(int apNo) {
		this.apNo = apNo;
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
		categoryNo = categoryNo;
	}	

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "ChallengeVote [chTitle=" + chTitle + ", apNo=" + apNo + ", start=" + start + ", end=" + end
				+ ", voteCount=" + voteCount + ", categoryNo=" + categoryNo + ", categoryName=" + categoryName + "]";
	}

	


	
}
