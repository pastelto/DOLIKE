package com.kh.member.model.vo;

import java.sql.Date;

public class Member {

	private String userId;
	private String userName;
	private String userPwd;
	private String birthDate;
	private String phone;
	private String email;
	private String nickName;
	private String interests1;
	private String interests2;
	private String interests3;
	private Date userCreateDate;
	private String userStatus;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}
	

	public Member(String userId, String userName, String userPwd, String birthDate, String phone, String email,
			String nickName, String interests1, String interests2, String interests3, Date userCreateDate, String userStatus) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.birthDate = birthDate;
		this.phone = phone;
		this.email = email;
		this.nickName = nickName;
		this.interests1 = interests1;
		this.interests2 = interests2;
		this.interests3 = interests3;
		this.userCreateDate = userCreateDate;
		this.userStatus = userStatus;
	}
	
	public Member(String userId, String userName, String userPwd, String birthDate, String phone, String email,
			String nickName, String interests1, String interests2, String interests3) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.birthDate = birthDate;
		this.phone = phone;
		this.email = email;
		this.nickName = nickName;
		this.interests1 = interests1;
		this.interests2 = interests2;
		this.interests3 = interests3;
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

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
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

	public String getInterests1() {
		return interests1;
	}

	public void setInterests1(String interests1) {
		this.interests1 = interests1;
	}
	
	public String getInterests2() {
		return interests2;
	}

	public void setInterests2(String interests2) {
		this.interests2 = interests2;
	}
	
	public String getInterests3() {
		return interests3;
	}

	public void setInterests3(String interests3) {
		this.interests3 = interests3;
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
	
}
