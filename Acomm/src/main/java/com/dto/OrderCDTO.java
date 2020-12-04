package com.dto;

public class OrderCDTO {
	private int orderNum;
	private String cName;
	private int cCode;
	private int cPrice;
	private String cImage;
	private String cStartDate;
	private String cEndDate;
	private int cTotalDate;
	private String userId;
	private String userName;
	private String phoneNum;
	private String email1;
	private String email2;
	private String payMethod;
	private String oDate;
	public OrderCDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderCDTO(int orderNum, String cName, int cCode, int cPrice, String cImage, String cStartDate,
			String cEndDate, int cTotalDate, String userId, String userName, String phoneNum, String email1,
			String email2, String payMethod, String oDate) {
		super();
		this.orderNum = orderNum;
		this.cName = cName;
		this.cCode = cCode;
		this.cPrice = cPrice;
		this.cImage = cImage;
		this.cStartDate = cStartDate;
		this.cEndDate = cEndDate;
		this.cTotalDate = cTotalDate;
		this.userId = userId;
		this.userName = userName;
		this.phoneNum = phoneNum;
		this.email1 = email1;
		this.email2 = email2;
		this.payMethod = payMethod;
		this.oDate = oDate;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public int getcCode() {
		return cCode;
	}
	public void setcCode(int cCode) {
		this.cCode = cCode;
	}
	public int getcPrice() {
		return cPrice;
	}
	public void setcPrice(int cPrice) {
		this.cPrice = cPrice;
	}
	public String getcImage() {
		return cImage;
	}
	public void setcImage(String cImage) {
		this.cImage = cImage;
	}
	public String getcStartDate() {
		return cStartDate;
	}
	public void setcStartDate(String cStartDate) {
		this.cStartDate = cStartDate;
	}
	public String getcEndDate() {
		return cEndDate;
	}
	public void setcEndDate(String cEndDate) {
		this.cEndDate = cEndDate;
	}
	public int getcTotalDate() {
		return cTotalDate;
	}
	public void setcTotalDate(int cTotalDate) {
		this.cTotalDate = cTotalDate;
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
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getoDate() {
		return oDate;
	}
	public void setoDate(String oDate) {
		this.oDate = oDate;
	}
	@Override
	public String toString() {
		return "OrderCDTO [orderNum=" + orderNum + ", cName=" + cName + ", cCode=" + cCode + ", cPrice=" + cPrice
				+ ", cImage=" + cImage + ", cStartDate=" + cStartDate + ", cEndDate=" + cEndDate + ", cTotalDate="
				+ cTotalDate + ", userId=" + userId + ", userName=" + userName + ", phoneNum=" + phoneNum + ", email1="
				+ email1 + ", email2=" + email2 + ", payMethod=" + payMethod + ", oDate=" + oDate + "]";
	}
	
}
