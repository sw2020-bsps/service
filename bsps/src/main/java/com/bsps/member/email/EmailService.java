package com.bsps.member.email;

import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service
public interface EmailService {
	public MimeMessage createMessage(String emailAddress, String authCode);
	public String createAuthCode();	
	public void sendMail(String emailAddress, String authCode);
	public boolean checkAuthCode(String authCode, String targetCode);
	public boolean checkDuplicate(String emailAddress);
}
