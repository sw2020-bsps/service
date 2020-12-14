package com.bsps.member;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
@SuppressWarnings("serial")
public class Member implements Serializable {
	private String emailAddress;
	private String password;
	private String name;
	private String phoneNo;
	private String zipCode;
	private String address;
	private String detailAddress;
	private char type;
	private char status;

	public Member() {
	}

	public Member(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	
	public Member(String emailAddress, String password, String name, String phoneNo, String zipCode, String address,
			String detailAddress, char type, char status) {
		this.emailAddress = emailAddress;
		this.password = password;
		this.name = name;
		this.phoneNo = phoneNo;
		this.zipCode = zipCode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.type = type;
		this.status = status;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getEmailAddress() {
		return this.emailAddress;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return this.password;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getPhoneNo() {
		return this.phoneNo;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getZipCode() {
		return this.zipCode;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress() {
		return this.address;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getDetailAddress() {
		return this.detailAddress;
	}

	public void setType(char type) {
		this.type = type;
	}

	public char getType() {
		return this.type;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public char getStatus() {
		return this.status;
	}
}