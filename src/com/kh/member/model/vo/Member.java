package com.kh.member.model.vo;

import java.sql.Date;

public class Member {

	private String userId;
	private String userName;
	private String userPwd;
	private Date birthDate;
	private String phone;
	private String email;
	private String nickName;
	private int interests;
	private Date userCreateDate;
	private String userStatus;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getInterests() {
		return interests;
	}

	public void setInterests(int interests) {
		this.interests = interests;
	}

	public Date getUserCreateDate() {
		return userCreateDate;
	}

	public void setUserCreateDate(Date userCreateDate) {
		this.userCreateDate = userCreateDate;
	}
	
	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	public Member(String userId, String userName, String userPwd, Date birthDate, String phone, String email,
			String nickName, int interests, Date userCreateDate, String userStatus) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.birthDate = birthDate;
		this.phone = phone;
		this.email = email;
		this.nickName = nickName;
		this.interests = interests;
		this.userCreateDate = userCreateDate;
		this.userStatus = userStatus;
	}
	
}
