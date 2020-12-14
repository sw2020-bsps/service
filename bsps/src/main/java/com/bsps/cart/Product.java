package com.bsps.cart;

import java.io.Serializable;

public class Product implements Serializable {
	private int beansNo;
	private int categoryNo;
	private int orderSheetNo;
	private int pictureNo;
	private String name;
	private int stockWeight;
	private int selectWeight;
	private int beansPrice;
	private int price;
	private String orderType;
	
	public Product() { }

	public Product(int beansNo, int categoryNo, int orderSheetNo, int pictureNo, String name, int stockWeight,
			int selectWeight, int beansPrice, int price, String orderType) {
		this.beansNo = beansNo;
		this.categoryNo = categoryNo;
		this.orderSheetNo = orderSheetNo;
		this.pictureNo = pictureNo;
		this.name = name;
		this.stockWeight = stockWeight;
		this.selectWeight = selectWeight;
		this.beansPrice = beansPrice;
		this.price = price;
		this.orderType = orderType;
	}

	public int getBeansNo() {
		return beansNo;
	}

	public void setBeansNo(int beansNo) {
		this.beansNo = beansNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getOrderSheetNo() {
		return orderSheetNo;
	}

	public void setOrderSheetNo(int orderSheetNo) {
		this.orderSheetNo = orderSheetNo;
	}

	public int getPictureNo() {
		return pictureNo;
	}

	public void setPictureNo(int pictureNo) {
		this.pictureNo = pictureNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStockWeight() {
		return stockWeight;
	}

	public void setStockWeight(int stockWeight) {
		this.stockWeight = stockWeight;
	}

	public int getSelectWeight() {
		return selectWeight;
	}

	public void setSelectWeight(int selectWeight) {
		this.selectWeight = selectWeight;
	}

	public int getBeansPrice() {
		return beansPrice;
	}

	public void setBeansPrice(int beansPrice) {
		this.beansPrice = beansPrice;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
}
