package com.bsps.payment.paymenthistory;

public interface PaymentHistoryService {
	public void registerPaymentHistory(PaymentHistory paymentHistory);
	public PaymentHistory searchPaymentHistory(int paymentHistoryNo);
}
