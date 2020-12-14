package com.bsps.payment.paymenthistory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentHistoryServiceImpl implements PaymentHistoryService {
	@Autowired
	private PaymentHistoryMapper paymentHistoryMapper;
	
	@Override
	public void registerPaymentHistory(PaymentHistory paymentHistory) {
		try {
			paymentHistoryMapper.insert(paymentHistory);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public PaymentHistory searchPaymentHistory(int orderSheetNo) {
		PaymentHistory paymentHistory = new PaymentHistory();
		paymentHistory.setOrderSheetNo(orderSheetNo);
		
		try {
			paymentHistory = paymentHistoryMapper.select(paymentHistory);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return paymentHistory;
	}
}
