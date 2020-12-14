package com.bsps.beans.category;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
@SuppressWarnings("serial")
public class Category implements Serializable {
	private int categoryNo;
	private String categoryName;

	public Category() {
	}
	
	public Category(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	
	public Category(String categoryName) {
		this.categoryName = categoryName;
	}

	public Category(int categoryNo, String categoryName) {
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getCategoryNo() {
		return this.categoryNo;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryName() {
		return this.categoryName;
	}
}