package com.kh.follow.model.vo;

public class Follow {
	
	private int followNo;			//	FOLLOW_NO	NUMBER
	private String userId;			//	USER_ID	VARCHAR2(100 BYTE)
	private String followId;		//	FOLLOW_ID	VARCHAR2(100 BYTE)
	private String followStatus;	//	FOLLOW_STATUS	VARCHAR2(1 BYTE)
	
	public Follow() {
		// TODO Auto-generated constructor stub
	}

	public Follow(int followNo, String userId, String followId, String followStatus) {
		super();
		this.followNo = followNo;
		this.userId = userId;
		this.followId = followId;
		this.followStatus = followStatus;
	}
	
	public Follow(int followNo, String userId, String followId) {
		super();
		this.followNo = followNo;
		this.userId = userId;
		this.followId = followId;
	}

	public Follow(String userId, String followId) {
		super();
		this.userId = userId;
		this.followId = followId;
	}
	
	public Follow(String followId) {
		super();
		this.followId = followId;
	}

	public int getFollowNo() {
		return followNo;
	}

	public void setFollowNo(int followNo) {
		this.followNo = followNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFollowId() {
		return followId;
	}

	public void setFollowId(String followId) {
		this.followId = followId;
	}

	public String getFollowStatus() {
		return followStatus;
	}

	public void setFollowStatus(String followStatus) {
		this.followStatus = followStatus;
	}

	@Override
	public String toString() {
		return "Follow [followNo=" + followNo + ", userId=" + userId + ", followId=" + followId + ", followStatus="
				+ followStatus + "]";
	}
	
}
