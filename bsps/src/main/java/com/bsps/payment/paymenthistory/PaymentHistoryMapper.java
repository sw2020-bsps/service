package com.bsps.payment.paymenthistory;

import org.springframework.stereotype.Repository;

@Repository
public interface PaymentHistoryMapper {
    public PaymentHistory select(PaymentHistory paymentHistory) throws Exception;
    public void insert(PaymentHistory paymentHistory) throws Exception;
    public void update(PaymentHistory paymentHistory) throws Exception;
}