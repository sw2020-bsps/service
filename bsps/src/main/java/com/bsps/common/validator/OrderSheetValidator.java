package com.bsps.common.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.bsps.order.ordersheet.OrderSheet;

public class OrderSheetValidator implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		return OrderSheet.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		OrderSheet orderSheet = (OrderSheet) target;
		if (orderSheet.getEmailAddress().trim().isEmpty()) {
			errors.rejectValue("emailAddress", "required");
		}
		if (orderSheet.getOrderDate().toString().trim().isEmpty()) {
			errors.rejectValue("orderDate", "required");
		}
	}

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(new OrderSheetValidator());
	}
}
