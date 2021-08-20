package com.kh.challenge.model.vo;

public class PageInfo {
	
	private int rpCount;			// 총 게시글 갯수
	private int currentPage;		// 현재 페이지 (즉, 요청한 페이지)
	private int startPage;			// 현재 페이지에 하단에 보여지는 페이징 바의 시작 수 
	private int endPage;			// 현재 페이지에 하단에 보여지는 페이징 바의 끝 수
	private int maxPage;			// 전체 페이지에서의 가장 마지막 페이지
	private int pageLimit;			// 한 페이지 하단에 보여질 페이지 최대 갯수
	private int rpLimit;			// 한 페이지에 보여질 게시글 최대 갯수
	
	public PageInfo() {
		
	}

	public PageInfo(int rpCount, int currentPage, int startPage, int endPage, int maxPage, int pageLimit,
			int rpLimit) {
		super();
		this.rpCount = rpCount;
		this.currentPage = currentPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.maxPage = maxPage;
		this.pageLimit = pageLimit;
		this.rpLimit = rpLimit;
	}

	public int getRpCount() {
		return rpCount;
	}

	public void setRpCount(int rpCount) {
		this.rpCount = rpCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getRpLimit() {
		return rpLimit;
	}

	public void setRpLimit(int rpLimit) {
		this.rpLimit = rpLimit;
	}

	@Override
	public String toString() {
		return "PageInfo [rpCount=" + rpCount + ", currentPage=" + currentPage + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", maxPage=" + maxPage + ", pageLimit=" + pageLimit + ", rpLimit="
				+ rpLimit + "]";
	}
	
	

}