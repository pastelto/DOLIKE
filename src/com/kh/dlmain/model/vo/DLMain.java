package com.kh.dlmain.model.vo;

public class DLMain {
	
	private int boardNo; // 게시글번호
	private String boardTitle; // 게시글제목
	private String writer; // 작성자
	private int views; // 조회수
	private int cNo; // 카테고리번호
	private String cName; // 카테고리이름
	private int fNo; // 파일번호
	private String oFileName; // 파일원본이름
	private String nFileName; // 파일새이름

	public DLMain() {
		// TODO Auto-generated constructor stub
	}

	public DLMain(int boardNo, String boardTitle, String writer, int views, int cNo, int fNo,
			String oFileName, String nFileName) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.writer = writer;
		this.views = views;
		this.cNo = cNo;
		this.fNo = fNo;
		this.oFileName = oFileName;
		this.nFileName = nFileName;
	}

	public DLMain(int boardNo, String boardTitle, String writer, int views, int cNo, String cName) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.writer = writer;
		this.views = views;
		this.cNo = cNo;
		this.cName = cName;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public String getoFileName() {
		return oFileName;
	}

	public void setoFileName(String oFileName) {
		this.oFileName = oFileName;
	}

	public String getnFileName() {
		return nFileName;
	}

	public void setnFileName(String nFileName) {
		this.nFileName = nFileName;
	}

	@Override
	public String toString() {
		return "DLMain [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", writer=" + writer + ", views=" + views
				+ ", cNo=" + cNo + ", cName=" + cName + ", fNo=" + fNo + ", oFileName=" + oFileName + ", nFileName="
				+ nFileName + "]";
	}
	
	
	
}
