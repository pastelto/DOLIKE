package com.kh.challenge.model.vo;

import java.util.Date;

public class ChallengeApply {

	private int apNo;
	private String content;
	private Date apDate;
	private String apUser;
	private int categoryNo;
	private String categoryName;
	
	public ChallengeApply() {
		// TODO Auto-generated constructor stub
	}
	
	
	public ChallengeApply(int apNo, String content, Date apDate, String apUser, int categoryNo) {
		super();
		this.apNo = apNo;
		this.content = content;
		this.apDate = apDate;
		this.apUser = apUser;
		this.categoryNo = categoryNo;
	}


	public ChallengeApply(int apNo, String content, Date apDate, String apUser, String categoryName) {
		super();
		this.apNo = apNo;
		this.content = content;
		this.apDate = apDate;
		this.apUser = apUser;
		this.categoryName = categoryName;
	}


	public int getApNo() {
		return apNo;
	}

	public void setApNo(int apNo) {
		this.apNo = apNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getApDate() {
		return apDate;
	}

	public void setApDate(Date apDate) {
		this.apDate = apDate;
	}

	public String getApUser() {
		return apUser;
	}

	public void setApUser(String apUser) {
		this.apUser = apUser;
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
		return "ChallengeApply [apNo=" + apNo + ", content=" + content + ", apDate=" + apDate + ", apUser=" + apUser
				+ ", categoryNo=" + categoryNo + ", categoryName=" + categoryName + "]";
	}

	

	 
	

}
