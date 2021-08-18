package com.kh.notice.model.vo;

import java.util.Date;

public class Notice {

	private int noticeNo;			//	NOTICE_NO	NUMBER
	private String noticeTitle;		//	NOTICE_TITLE	VARCHAR2(100 BYTE)
	private String noticeContent;	//	NOTICE_CONTENT	VARCHAR2(4000 BYTE)
	private String noticeWriter;	//	NOTICE_WRITER	VARCHAR2(20 BYTE)
	private int count;				//	COUNT	NUMBER
	private Date createDate;		//	CREATE_DATE	DATE
	private String noticeStatus;	//	NOTICE_STATUS	VARCHAR2(1 BYTE)
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(int noticeNo, String noticeTitle, String noticeContent, String noticeWriter, int count,
			Date createDate, String noticeStatus) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
		this.count = count;
		this.createDate = createDate;
		this.noticeStatus = noticeStatus;
	}

	public Notice(String noticeTitle, String noticeContent, String noticeWriter) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
	}

	public Notice(int noticeNo, String noticeTitle, int count, Date createDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.count = count;
		this.createDate = createDate;
	}
	

	public Notice(int noticeNo, String noticeTitle, String noticeWriter, int count, Date createDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.count = count;
		this.createDate = createDate;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getNoticeStatus() {
		return noticeStatus;
	}

	public void setNoticeStatus(String noticeStatus) {
		this.noticeStatus = noticeStatus;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeWriter=" + noticeWriter + ", count=" + count + ", createDate=" + createDate
				+ ", noticeStatus=" + noticeStatus + "]";
	}

	
}
