package com.kh.board.model.vo;

import java.sql.Date;
/*
COMMENT_NO	NUMBER	No		1	댓글번호
NICKNAME	VARCHAR2(30 BYTE)	No		2	댓글작성자
CMT_CONTENT	VARCHAR2(1024 BYTE)	Yes		3	댓글내용
BOARD_NO	NUMBER	Yes		4	글번호
*/
public class Reply {
	private int replyNo;		// 댓글 번호 
	private String replyContent;// 댓글 내용 
	private int replyBoardNo;		// 게시글 번호 
	private String replyWriter; // 조회시 : 작성자 이름,  댓글작성시 : 회원번호로 쓰일 것!!
	
	
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
