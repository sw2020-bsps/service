package com.bsps.common;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ViewController {
	@GetMapping("/main")
	public ModelAndView viewMain() {
		return new ModelAndView("view/main");
	}
}
