package com.dto;

public class ProductDTO {
	private int pCode;
	private String isSold;
	private String userid;
	private int pPrice;
	private String pName;
	private String pContent;
	private String pImage;
	
	public ProductDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductDTO(int pCode, String isSold, String userid, int pPrice, String pName, String pContent,
			String pImage) {
		super();
		this.pCode = pCode;
		this.isSold = isSold;
		this.userid = userid;
		this.pPrice = pPrice;
		this.pName = pName;
		this.pContent = pContent;
		this.pImage = pImage;
	}
	public int getpCode() {
		return pCode;
	}
	public void setpCode(int pCode) {
		this.pCode = pCode;
	}
	public String getIsSold() {
		return isSold;
	}
	public void setIsSold(String isSold) {
		this.isSold = isSold;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public String getpImage() {
		return pImage;
	}
	public void setpImage(String pImage) {
		this.pImage = pImage;
	}
	@Override
	public String toString() {
		return "ProductDTO [pCode=" + pCode + ", isSold=" + isSold + ", userid=" + userid + ", pPrice=" + pPrice
				+ ", pName=" + pName + ", pContent=" + pContent + ", pImage=" + pImage + "]";
	}
	
}
