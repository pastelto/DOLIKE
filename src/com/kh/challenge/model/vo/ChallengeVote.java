package com.kh.challenge.model.vo;

import java.util.Date;

public class ChallengeVote {

	private String chTitle;
	private int apNo;
	private Date start;
	private Date end;
	private int voteCount;
	private int CategoryNo;
	
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
		CategoryNo = categoryNo;
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
		return CategoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		CategoryNo = categoryNo;
	}

	@Override
	public String toString() {
		return "ChallengeVote [chTitle=" + chTitle + ", apNo=" + apNo + ", start=" + start + ", end=" + end
				+ ", voteCount=" + voteCount + ", CategoryNo=" + CategoryNo + "]";
	}


	
}
