package com.bsps.common.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.bsps.order.orderhistory.OrderHistory;

public class OrderHistoryValidator implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		return OrderHistory.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		OrderHistory orderHistory = (OrderHistory) target;
		if (0 != orderHistory.getWeight()) {
			errors.rejectValue("weight", "required");
		}

		if (0 != orderHistory.getPrice()) {
			errors.rejectValue("price", "required");
		}
	}

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(new OrderHistoryValidator());
	}
}
