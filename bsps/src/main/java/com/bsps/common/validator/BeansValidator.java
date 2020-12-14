package com.bsps.common.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.bsps.beans.Beans;

public class BeansValidator implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		return Beans.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Beans beans = (Beans) target;
		if (beans.getName().trim().isEmpty()) {
			errors.rejectValue("name", "required");
		}
	}

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(new BeansValidator());
	}
}
