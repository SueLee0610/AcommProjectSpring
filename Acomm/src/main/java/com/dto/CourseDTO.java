package com.dto;

public class CourseDTO {
	
	private String cName;
	private int cCode;
	private int cPrice;
	private String cStartDate;
	private String cEndDate;
	private int cTotalDate;
	private int cStudNum;
	private String cContent;
	private String cInstructor;
	private String cImage;
	
	public CourseDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CourseDTO(String cName, int cCode, int cPrice, String cStartDate, String cEndDate, int cTotalDate,
			int cStudNum, String cContent, String cInstructor, String cImage) {
		super();
		this.cName = cName;
		this.cCode = cCode;
		this.cPrice = cPrice;
		this.cStartDate = cStartDate;
		this.cEndDate = cEndDate;
		this.cTotalDate = cTotalDate;
		this.cStudNum = cStudNum;
		this.cContent = cContent;
		this.cInstructor = cInstructor;
		this.cImage = cImage;
	}

	@Override
	public String toString() {
		return "CourseDTO [cName=" + cName + ", cCode=" + cCode + ", cPrice=" + cPrice + ", cStartDate=" + cStartDate
				+ ", cEndDate=" + cEndDate + ", cTotalDate=" + cTotalDate + ", cStudNum=" + cStudNum + ", cContent="
				+ cContent + ", cInstructor=" + cInstructor + ", cImage=" + cImage + "]";
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

	public int getcStudNum() {
		return cStudNum;
	}

	public void setcStudNum(int cStudNum) {
		this.cStudNum = cStudNum;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public String getcInstructor() {
		return cInstructor;
	}

	public void setcInstructor(String cInstructor) {
		this.cInstructor = cInstructor;
	}

	public String getcImage() {
		return cImage;
	}

	public void setcImage(String cImage) {
		this.cImage = cImage;
	}
}
