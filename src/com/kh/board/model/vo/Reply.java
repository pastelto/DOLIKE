package com.kh.board.model.vo;

import java.sql.Date;

public class Reply {
	private int replyNo;		
	private String replyContent; 
	private int replyBoardNo;		
	private String replyWriter; 
	
	
	public Reply() {
		
	}
	
	
	public Reply(int replyNo, String replyContent, String replyWriter) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyWriter = replyWriter;
		
	}



	public Reply(int replyNo, String replyContent, int replyBoardNo, String replyWriter) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyBoardNo = replyBoardNo;
		this.replyWriter = replyWriter;
	}


	public int getReplyNo() {
		return replyNo;
	}


	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}


	public String getReplyContent() {
		return replyContent;
	}


	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}


	public int getReplyBoardNo() {
		return replyBoardNo;
	}


	public void setReplyBoardNo(int replyBoardNo) {
		this.replyBoardNo = replyBoardNo;
	}


	public String getReplyWriter() {
		return replyWriter;
	}


	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}


	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyBoardNo=" + replyBoardNo
				+ ", replyWriter=" + replyWriter + "]";
	}

	
	
}
