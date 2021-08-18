package com.kh.challenge.model.vo;

public class ChallengeAttachment {

	private int atNo;
	private String newName;
	private String originName;
	private String location;
	private int chNo;
	
	public ChallengeAttachment() {
		// TODO Auto-generated constructor stub
	}

	public ChallengeAttachment(int atNo, String newName, String originName, String location, int chNo) {
		super();
		this.atNo = atNo;
		this.newName = newName;
		this.originName = originName;
		this.location = location;
		this.chNo = chNo;
	}

	public int getAtNo() {
		return atNo;
	}

	public void setAtNo(int atNo) {
		this.atNo = atNo;
	}

	public String getNewName() {
		return newName;
	}

	public void setNewName(String newName) {
		this.newName = newName;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getChNo() {
		return chNo;
	}

	public void setChNo(int chNo) {
		this.chNo = chNo;
	}

	@Override
	public String toString() {
		return "ChallengeAttachment [atNo=" + atNo + ", newName=" + newName + ", originName=" + originName
				+ ", location=" + location + ", chNo=" + chNo + "]";
	}  
	
	
	
}
