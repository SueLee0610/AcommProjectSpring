package com.dto;

public class ReplyDTO {
	
	private int cCode;
    private int reNO;
    private String reWriter;
    private String reContent;
    private String reDate;
    private String reDeleteFlag;
    private int reParent; // 부모 댓글
    private int reDepth; // 부모 댓글로부터 깊이
    private int reOrder; // 댓글 + 대댓글 포함 순서
    
    public ReplyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReplyDTO(int cCode, int reNO, String reWriter, String reContent, String reDate, String reDeleteFlag,
			int reParent, int reDepth, int reOrder) {
		super();
		this.cCode = cCode;
		this.reNO = reNO;
		this.reWriter = reWriter;
		this.reContent = reContent;
		this.reDate = reDate;
		this.reDeleteFlag = reDeleteFlag;
		this.reParent = reParent;
		this.reDepth = reDepth;
		this.reOrder = reOrder;
	}

	public int getcCode() {
		return cCode;
	}

	public void setcCode(int cCode) {
		this.cCode = cCode;
	}

	public int getReNO() {
		return reNO;
	}

	public void setReNO(int reNO) {
		this.reNO = reNO;
	}

	public String getReWriter() {
		return reWriter;
	}

	public void setReWriter(String reWriter) {
		this.reWriter = reWriter;
	}

	public String getReContent() {
		return reContent;
	}

	public void setReContent(String reContent) {
		this.reContent = reContent;
	}

	public String getReDate() {
		return reDate;
	}

	public void setReDate(String reDate) {
		this.reDate = reDate;
	}

	public String getReDeleteFlag() {
		return reDeleteFlag;
	}

	public void setReDeleteFlag(String reDeleteFlag) {
		this.reDeleteFlag = reDeleteFlag;
	}

	public int getReParent() {
		return reParent;
	}

	public void setReParent(int reParent) {
		this.reParent = reParent;
	}

	public int getReDepth() {
		return reDepth;
	}

	public void setReDepth(int reDepth) {
		this.reDepth = reDepth;
	}

	public int getReOrder() {
		return reOrder;
	}

	public void setReOrder(int reOrder) {
		this.reOrder = reOrder;
	}

	@Override
	public String toString() {
		return "ReplyDTO [cCode=" + cCode + ", reNO=" + reNO + ", reWriter=" + reWriter + ", reContent=" + reContent
				+ ", reDate=" + reDate + ", reDeleteFlag=" + reDeleteFlag + ", reParent=" + reParent + ", reDepth="
				+ reDepth + ", reOrder=" + reOrder + "]";
	}
}
