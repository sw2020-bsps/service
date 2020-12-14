package com.bsps.payment;

import org.springframework.stereotype.Service;

import com.bsps.order.ordersheet.OrderSheet;
import com.bsps.payment.paymenthistory.PaymentHistory;

@Service
public interface PaymentService {
	public OrderSheet payment(Payment payment);
	public boolean refund(int orderSheetNo);
	public int requestPaymentInfo(String impUid);
	public boolean requestRefund(int orderSheetNo);
	public String requestToken();
	public boolean authPayment(boolean result, PaymentHistory paymentHistory);
}
