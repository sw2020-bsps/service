package com.bsps.payment.paymenthistory;

import java.io.Serializable;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class PaymentHistory implements Serializable {
	private String impUid;
	private int paymentNo;
	private int orderSheetNo;
	private Date paymentDate;
	private int paymentPrice;

	private int itemStart;
	private int itemSizePerPage;

	public PaymentHistory() { }

	public PaymentHistory(String impUid, int paymentNo, int orderSheetNo, Date paymentDate, int paymentPrice,
			int itemStart, int itemSizePerPage) {
		this.impUid = impUid;
		this.paymentNo = paymentNo;
		this.orderSheetNo = orderSheetNo;
		this.paymentDate = paymentDate;
		this.paymentPrice = paymentPrice;
		this.itemStart = itemStart;
		this.itemSizePerPage = itemSizePerPage;
	}

	public String getImpUid() {
		return impUid;
	}

	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public int getOrderSheetNo() {
		return orderSheetNo;
	}

	public void setOrderSheetNo(int orderSheetNo) {
		this.orderSheetNo = orderSheetNo;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public int getPaymentPrice() {
		return paymentPrice;
	}

	public void setPaymentPrice(int paymentPrice) {
		this.paymentPrice = paymentPrice;
	}

	public int getItemStart() {
		return itemStart;
	}

	public void setItemStart(int itemStart) {
		this.itemStart = itemStart;
	}

	public int getItemSizePerPage() {
		return itemSizePerPage;
	}

	public void setItemSizePerPage(int itemSizePerPage) {
		this.itemSizePerPage = itemSizePerPage;
	}
}