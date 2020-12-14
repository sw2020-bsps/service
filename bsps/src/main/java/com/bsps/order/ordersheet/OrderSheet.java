package com.bsps.order.ordersheet;

import java.io.Serializable;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class OrderSheet implements Serializable {
	private int orderSheetNo;
	private String emailAddress;
	private String zipCode;
	private String address;
	private String detailAddress;
	private Date orderDate;
	private Date cancleDate;
	private int orderPrice;
	private char paymentStatus;
	private char displayStatus;

	private int itemStart;
	private int itemSizePerPage;

	public OrderSheet() {}

	public OrderSheet(int orderSheetNo, String emailAddress, String zipCode, String address, String detailAddress,
			Date orderDate, Date cancleDate, int orderPrice, char paymentStatus, char displayStatus, int itemStart,
			int itemSizePerPage) {
		this.orderSheetNo = orderSheetNo;
		this.emailAddress = emailAddress;
		this.zipCode = zipCode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.orderDate = orderDate;
		this.cancleDate = cancleDate;
		this.orderPrice = orderPrice;
		this.paymentStatus = paymentStatus;
		this.displayStatus = displayStatus;

		this.itemStart = itemStart;
		this.itemSizePerPage = itemSizePerPage;
	}

	public int getOrderSheetNo() {
		return orderSheetNo;
	}

	public void setOrderSheetNo(int orderSheetNo) {
		this.orderSheetNo = orderSheetNo;
	}

	
	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getCancleDate() {
		return cancleDate;
	}

	public void setCancleDate(Date cancleDate) {
		this.cancleDate = cancleDate;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public char getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(char paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public char getDisplayStatus() {
		return displayStatus;
	}

	public void setDisplayStatus(char displayStatus) {
		this.displayStatus = displayStatus;
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

	@Override
	public String toString() {
		return "OrderSheet [orderSheetNo=" + orderSheetNo + ", emailAddress=" + emailAddress + ", orderBeansName="
				+ ", zipCode=" + zipCode + ", address=" + address + ", detailAddress=" + detailAddress
				+ ", orderDate=" + orderDate + ", cancleDate=" + cancleDate + ", orderPrice=" + orderPrice
				+ ", paymentStatus=" + paymentStatus + ", displayStatus=" + displayStatus + ", itemStart=" + itemStart
				+ ", itemSizePerPage=" + itemSizePerPage + "]";
	}
}