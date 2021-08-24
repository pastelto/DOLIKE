package com.kh.category.model.vo;

public class Category {
	
	private int categoryNo;
	private String categoryName;
	private String categoryStatus;
	
	public Category() {
		// TODO Auto-generated constructor stub
	}

	public Category(int categoryNo, String categoryName, String categoryStatus) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.categoryStatus = categoryStatus;
	}

	public Category(int categoryNo, String categoryName) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
	}
	
	public Category(String categoryName) {
		super();
		this.categoryName = categoryName;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryStatus() {
		return categoryStatus;
	}

	public void setCategoryStatus(String categoryStatus) {
		this.categoryStatus = categoryStatus;
	}

	@Override
	public String toString() {
		return "Category [categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", categoryStatus="
				+ categoryStatus + "]";
	}
	
	
	
}
