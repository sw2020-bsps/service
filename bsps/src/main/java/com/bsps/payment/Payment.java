package com.bsps.payment;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Component;

import com.bsps.cart.Product;

@Component
public class Payment implements Serializable {
	private String name;
	private String emailAddress;
	private String phoneNo;
	private String zipCode;
	private String address;
	private String detailAddress;
	private List<Product> productList;
	private int totalPrice;
	
	public Payment() {}

	public Payment(String name, String emailAddress, String phoneNo, String zipCode, String address,
			String detailAddress, List<Product> productList, int totalPrice) {
		this.name = name;
		this.emailAddress = emailAddress;
		this.phoneNo = phoneNo;
		this.zipCode = zipCode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.productList = productList;
		this.totalPrice = totalPrice;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
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

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
}