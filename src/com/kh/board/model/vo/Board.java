package com.kh.board.model.vo;

import java.sql.Date;

public class Board {

	private int boardNo;			//게시글 고유 번호 
	private String nickName;		//게시글 작성자의 닉네임 
	private String tagName;			//게시글 말머리 
	private String boardTitle;		//게시글 제목 
	private Date boardDate;			//게시글 작성일자 
	private String boardContent;	//게시글 내용 
	private char boardStatus;		//게시글 상태값 (Y이면 공개 N이면 비공개상태) 
	private int views;				//게시글 조회수 
	private int categoryNo;			//게시글 카테고리 번호 
	private String titleImg;		//게시글의 타이틀이미지 
	
	public Board() {
		// TODO Auto-generated constructor stub
	}
	
	public Board(String tagName, String boardTitle, String boardContent, String nickName) {
		//insertBoard
		super();
		this.tagName = tagName;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.nickName = nickName;
	}
	
	public Board(int boardNo,String nickName,String tagName,String boardTitle,Date boardDate,String boardContent,char boardStatus,int views,int categoryNo) {
		// all basic 
		super();
		this.boardNo = boardNo;
		this.nickName = nickName;
		this.tagName = tagName;
		this.boardTitle = boardTitle;
		this.boardDate = boardDate;
		this.boardContent = boardContent;
		this.boardStatus = boardStatus;
		this.views = views;
		this.categoryNo = categoryNo;
	}
	public Board(int boardNo, String tagName,int categoryNo, String boardTitle, String nickName, Date boardDate, int views) {
		//select list 
		super();
		this.boardNo = boardNo;
		this.tagName = tagName;
		this.nickName = nickName;
		this.boardTitle = boardTitle;
		this.boardDate = boardDate;
		this.views = views;
		this.categoryNo = categoryNo;
		
	}
	
	public Board(int boardNo, int categoryNo, String boardTitle, String nickName, Date boardDate, int views, String titleImg) {
		//basic list 
		super();
		this.boardNo = boardNo;
		this.nickName = nickName;
		this.boardTitle = boardTitle;
		this.boardDate = boardDate;
		this.views = views;
		this.categoryNo = categoryNo;
		this.titleImg = titleImg;
	}

	public Board(int boardNo, String nickName, String tagName, String boardTitle, Date boardDate, String boardContent, int views) {
		super();
		this.boardNo = boardNo;
		this.nickName = nickName;
		this.tagName = tagName;
		this.boardTitle = boardTitle;
		this.boardDate = boardDate;
		this.boardContent = boardContent;
		this.views = views;
		
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getBoardStatus() {
		return boardStatus;
	}
	public void setBoardStatus(char boardStatus) {
		this.boardStatus = boardStatus;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", nickName=" + nickName + ", tagName=" + tagName + ", boardTitle=" + boardTitle
          + ", boardDate=" + boardDate + ", boardContent=" + boardContent + ", boardStatus=" + boardStatus + ", views="
				  + views + ", categoryNo=" + categoryNo + "]";
	}
	
	
	
}
