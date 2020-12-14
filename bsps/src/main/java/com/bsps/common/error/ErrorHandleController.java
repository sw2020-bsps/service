package com.bsps.common.error;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
@RequestMapping("/error")
public class ErrorHandleController implements ErrorController {
	@Override
	public String getErrorPath() {
		return "/error";
	}

	@GetMapping
	public ModelAndView errorHandler(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		if (status != null) {
			int statusCode = Integer.valueOf(status.toString());
			if (statusCode == HttpStatus.NOT_FOUND.value()) {
				mav.setView(new RedirectView("/error/404"));
			}
			if (statusCode == HttpStatus.FORBIDDEN.value()) {
				mav.setView(new RedirectView("/error/500"));
			}
			if (statusCode == 405 || statusCode == 400) {
				mav.setView(new RedirectView("/error/405"));
			}
			if (statusCode == 500) {
				mav.setView(new RedirectView("/error/500"));
			} else {
				mav.setView(new RedirectView("/error/500"));
			}
		}
		return mav;
	}
	
	@GetMapping("/404")
	public ModelAndView view404ErrorPage() {
		return new ModelAndView("error/404");
	}

	@GetMapping("/405")
	public ModelAndView view405ErrorPage() {
		return new ModelAndView("error/405");
	}
	
	@GetMapping("/500")
	public ModelAndView view500ErrorPage() {
		return new ModelAndView("error/500");
	}
}
