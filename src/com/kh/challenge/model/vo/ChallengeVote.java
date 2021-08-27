package com.kh.challenge.model.vo;

import java.util.Date;

public class ChallengeVote {

	private String chTitle;
	private String content;
	private int apNo;
	private String start;
	private String end;
	private int voteCount;
	private int CategoryNo;
	
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
<<<<<<< HEAD
		CategoryNo = categoryNo;
=======
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
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
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
		return CategoryNo;
	}

	public void setCategoryNo(int categoryNo) {
<<<<<<< HEAD
		CategoryNo = categoryNo;
=======
		this.categoryNo = categoryNo;
	}	

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
	}



	@Override
	public String toString() {
<<<<<<< HEAD
		return "ChallengeVote [chTitle=" + chTitle + ", apNo=" + apNo + ", start=" + start + ", end=" + end
				+ ", voteCount=" + voteCount + ", CategoryNo=" + CategoryNo + "]";
	}

=======
		return "ChallengeVote [chTitle=" + chTitle + ", content=" + content + ", apNo=" + apNo + ", start=" + start
				+ ", end=" + end + ", voteCount=" + voteCount + ", categoryNo=" + categoryNo + ", categoryName="
				+ categoryName + "]";
	}



	

>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626

	
}
