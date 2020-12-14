package com.bsps.beans;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
@SuppressWarnings("serial")
public class Beans implements Serializable {
	private int beansNo;
	private int categoryNo;
	private int pictureNo;
	private String name;
	private String description;
	private int stockWeight;
	private int price;
	private char displayStatus;

	public Beans() {
	}
	
	public Beans(int beansNo) {
		this.beansNo = beansNo;
	}
	
	public Beans(int beansNo, int categoryNo) {
		this.beansNo = beansNo;
		this.categoryNo = categoryNo;
	}

	public Beans(int beansNo, int categoryNo, int pictureNo, String name, String description, int stockWeight,
			int price, char displayStatus) {
		this.beansNo = beansNo;
		this.categoryNo = categoryNo;
		this.pictureNo = pictureNo;
		this.name = name;
		this.description = description;
		this.stockWeight = stockWeight;
		this.price = price;
		this.displayStatus = displayStatus;
	}

	public void setBeansNo(int beansNo) {
		this.beansNo = beansNo;
	}

	public int getBeansNo() {
		return this.beansNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getCategoryNo() {
		return this.categoryNo;
	}

	public void setPictureNo(int pictureNo) {
		this.pictureNo = pictureNo;
	}

	public int getPictureNo() {
		return this.pictureNo;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return this.description;
	}

	public void setStockWeight(int stockWeight) {
		this.stockWeight = stockWeight;
	}

	public int getStockWeight() {
		return this.stockWeight;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPrice() {
		return this.price;
	}

	public void setDisplayStatus(char displayStatus) {
		this.displayStatus = displayStatus;
	}

	public char getDisplayStatus() {
		return this.displayStatus;
	}
}
