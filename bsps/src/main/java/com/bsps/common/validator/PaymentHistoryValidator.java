package com.bsps.common.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.bsps.payment.paymenthistory.PaymentHistory;

public class PaymentHistoryValidator implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		return PaymentHistory.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		PaymentHistory paymentHistory = (PaymentHistory) target;
		if (paymentHistory.getPaymentDate().toString().trim().isEmpty()) {
			errors.rejectValue("paymentDate", "required");
		}

		if (0 != paymentHistory.getPaymentPrice()) {
			errors.rejectValue("paymentPrice", "required");
		}
	}

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(new PaymentHistoryValidator());
	}
}
