package com.dto;

public class FreeBoardDTO {
	
	private int num;
	private String title;
	private String userid;
	private String content;
	private String writeday;
	private int readCnt;
	
	public FreeBoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FreeBoardDTO(int num, String title, String userid, String content, String writeday, int readCnt) {
		super();
		this.num = num;
		this.title = title;
		this.userid = userid;
		this.content = content;
		this.writeday = writeday;
		this.readCnt = readCnt;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

	public int getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}

	@Override
	public String toString() {
		return "FreeBoardDTO [num=" + num + ", title=" + title + ", userid=" + userid + ", content=" + content
				+ ", writeday=" + writeday + ", readCnt=" + readCnt + "]";
	}

}
