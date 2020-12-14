package com.bsps.order.orderhistory;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class OrderHistory implements Serializable {
	private int orderHistoryNo;
	private int orderSheetNo;
	private int beansNo;
	private int weight;
	private int price;
	private String beansName;

	private int itemStart;
	private int itemSizePerPage;

	public OrderHistory() {
	}

	public OrderHistory(int orderHistoryNo, int orderSheetNo, int beansNo, int weight, int price, int itemStart,
			int itemSizePerPage, String beansName) {
		this.orderHistoryNo = orderHistoryNo;
		this.orderSheetNo = orderSheetNo;
		this.beansNo = beansNo;
		this.weight = weight;
		this.price = price;

		this.itemStart = itemStart;
		this.itemSizePerPage = itemSizePerPage;
	}

	public int getOrderHistoryNo() {
		return orderHistoryNo;
	}

	public void setOrderHistoryNo(int orderHistoryNo) {
		this.orderHistoryNo = orderHistoryNo;
	}

	public int getOrderSheetNo() {
		return orderSheetNo;
	}

	public void setOrderSheetNo(int orderSheetNo) {
		this.orderSheetNo = orderSheetNo;
	}

	public int getBeansNo() {
		return beansNo;
	}

	public void setBeansNo(int beansNo) {
		this.beansNo = beansNo;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setItemStart(int itemStart) {
		this.itemStart = itemStart;
	}

	public int getItemStart() {
		return this.itemStart;
	}

	public void setItemSizePerPage(int itemSizePerPage) {
		this.itemSizePerPage = itemSizePerPage;
	}

	public int getItemSizePerPage() {
		return this.itemSizePerPage;
	}

	public String getBeansName() {
		return beansName;
	}

	public void setBeansName(String beansName) {
		this.beansName = beansName;
	}
}