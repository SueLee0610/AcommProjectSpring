package com.dto;

public class MemberDTO {
	
	private String userID;
	private String userPW;
	private String userName;
	private String phoneNum;
	private String email1;
	private String email2;
	private int cCode;
	private int age;
	private int cScore;
	
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MemberDTO(String userID, String userPW, String userName, String phoneNum, String email1, String email2,
			int cCode, int age, int cScore) {
		super();
		this.userID = userID;
		this.userPW = userPW;
		this.userName = userName;
		this.phoneNum = phoneNum;
		this.email1 = email1;
		this.email2 = email2;
		this.cCode = cCode;
		this.age = age;
		this.cScore = cScore;
	}

	@Override
	public String toString() {
		return "MemberDTO [userID=" + userID + ", userPW=" + userPW + ", userName=" + userName + ", phoneNum="
				+ phoneNum + ", email1=" + email1 + ", email2=" + email2 + ", cCode=" + cCode + ", age=" + age
				+ ", cScore=" + cScore + "]";
	}

	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPW() {
		return userPW;
	}
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public int getcCode() {
		return cCode;
	}
	public void setcCode(int cCode) {
		this.cCode = cCode;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getcScore() {
		return cScore;
	}
	public void setcScore(int cScore) {
		this.cScore = cScore;
	}
}
