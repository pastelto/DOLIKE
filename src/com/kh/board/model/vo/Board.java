package com.kh.board.model.vo;

import java.sql.Date;

public class Board {

	private int boardNo;
	private String nickName;
	private String tagName;
	private String boardTitle;
	private Date boardDate;
	private String boardContent;
	private int avliable;
	private int views;
	private int categoryNo;
	
	
	public Board() {
		// TODO Auto-generated constructor stub
		
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
	public int getAvliable() {
		return avliable;
	}
	public void setAvliable(int avliable) {
		this.avliable = avliable;
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
          + ", boardDate=" + boardDate + ", boardContent=" + boardContent + ", avliable=" + avliable + ", views="
				  + views + ", categoryNo=" + categoryNo + "]";
	}
	
	
	
}
