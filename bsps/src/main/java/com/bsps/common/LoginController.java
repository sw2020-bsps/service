package com.bsps.common;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.bsps.member.Member;

@RestController
public class LoginController {
	@Autowired
	private LoginServiceImpl loginService;
	
	@GetMapping("/login/form")
	public ModelAndView doLogin() {
		return new ModelAndView("common/login");
	}
	
	@PostMapping("/login")
	public ModelAndView doLogin(@ModelAttribute @Valid Member member) {
		loginService.login(member);
		
		return new ModelAndView(new RedirectView("/main"));
	}
	
	@PostMapping("/login/check")
	public ResponseEntity<Boolean> doCheckLogin(@RequestBody @Valid Member member, Errors errors) {
		if (null != member) {
			if (errors.hasErrors()) {
				return ResponseEntity.status(HttpStatus.OK).body(false);
			}
		}
		
		boolean result = loginService.loginCheck(member);
		
		return ResponseEntity.status(HttpStatus.OK).body(result);
	}
	
	@DeleteMapping("/logout")
	public ModelAndView doLogout() {
		loginService.logout();

		return new ModelAndView(new RedirectView("/main"));
	}
}
