package com.kh.myFavBoard.model.vo;

public class myFavBoard {
	
	private int fbNo;
	private String userId;
	private int categoryNo;
	private String fbTitle;
	private String fbStatus;
	
	public myFavBoard() {
		// TODO Auto-generated constructor stub
	}

	public myFavBoard(int fbNo, String userId, int categoryNo, String fbTitle, String fbStatus) {
		super();
		this.fbNo = fbNo;
		this.userId = userId;
		this.categoryNo = categoryNo;
		this.fbTitle = fbTitle;
		this.fbStatus = fbStatus;
	}

	public myFavBoard(int categoryNo, String fbTitle) {
		this.categoryNo = categoryNo;
		this.fbTitle = fbTitle;
	}

	public int getFbNo() {
		return fbNo;
	}

	public void setFbNo(int fbNo) {
		this.fbNo = fbNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getFbTitle() {
		return fbTitle;
	}

	public void setFbTitle(String fbTitle) {
		this.fbTitle = fbTitle;
	}

	public String getFbStatus() {
		return fbStatus;
	}

	public void setFbStatus(String fbStatus) {
		this.fbStatus = fbStatus;
	}

	@Override
	public String toString() {
		return "myFavBoard [fbNo=" + fbNo + ", userId=" + userId + ", categoryNo=" + categoryNo + ", fbTitle=" + fbTitle
				+ ", fbStatus=" + fbStatus + "]";
	}

	
	
}