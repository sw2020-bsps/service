package com.bsps.member.email;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/email")
public class EmailController {
	@Autowired
	private EmailServiceImpl emailService;
	@Autowired
	private HttpSession session;
	
	@PostMapping
	public void requestEmailAuth(@RequestBody String emailAddress) {
		try {
			if (null != emailAddress && "" != emailAddress) {				
				String authCode = emailService.createAuthCode();
				session.setAttribute("authCode", authCode);
				emailService.sendMail(emailAddress, authCode);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("/authcode")
	public boolean doCheckEmailAuth(@RequestBody String authCode) {
		String targetCode = (String) session.getAttribute("authCode");
		boolean	result = emailService.checkAuthCode(authCode, targetCode);
		
		if (result) {
			session.removeAttribute("authCode");
		}
		
		return result;
	}
	
	@PostMapping("/duply")
	public boolean doCheckDuplicate(@RequestBody String emailAddress) {
		return emailService.checkDuplicate(emailAddress);
	}
}
