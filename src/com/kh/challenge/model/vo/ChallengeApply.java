package com.kh.challenge.model.vo;

import java.util.Date;

public class ChallengeApply {

	private int apNo;
	private String content;
	private Date apDate;
	private String apUser;
	private String categoryNo;
	
	public ChallengeApply() {
		// TODO Auto-generated constructor stub
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

	public String getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}

	@Override
	public String toString() {
		return "ChallengeApply [apNo=" + apNo + ", content=" + content + ", apDate=" + apDate + ", apUser=" + apUser
				+ ", categoryNo=" + categoryNo + "]";
	}
	
	

}
