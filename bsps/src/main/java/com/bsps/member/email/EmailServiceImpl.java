package com.bsps.member.email;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.bsps.member.Member;
import com.bsps.member.MemberServiceImpl;

@Service
public class EmailServiceImpl implements EmailService {
	@Autowired
	private JavaMailSender emailSender;
	@Autowired
	private MemberServiceImpl memberService;

	@Override
	public MimeMessage createMessage(String emailAddress, String authCode) {
		MimeMessage message = emailSender.createMimeMessage();

		try {
			if (null != emailAddress && null != authCode && "" != emailAddress && "" != authCode) {
				emailAddress = emailAddress.split("=")[1];
				emailAddress = emailAddress.replaceAll("%40", "@");

				message.addRecipient(Message.RecipientType.TO, new InternetAddress(emailAddress));
				message.setSubject("Bieup Cafe 인증코드가 도착했습니다.");
				StringBuilder sendMessage = new StringBuilder();
				sendMessage.append("<div style='margin:100px;'>").append("<h1> Bieup Cafe 메일 인증 서비스입니다. </h1><br>")
						.append("<p> 하단의 인증코드를 입력해 이메일 인증을 완료해주세요.<p><br>")
						.append("<div align='center' style='border:1px solid black; font-family:verdana';>")
						.append("<h3 style='color:blue;'>이메일 인증코드</h3>").append("<div style='font-size:130%'>")
						.append("CODE : <strong>" + authCode + "</strong><div><br/></div>");

				message.setText(sendMessage.toString(), "UTF-8", "html");
				message.setFrom(new InternetAddress("bieupcafe@gmail.com", "Bieup Cafe"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}

	@Override
	public String createAuthCode() {
		StringBuffer authCode = new StringBuffer();
		Random randomNo = new Random();
		for (int i = 0; i < 6; i++) {
			int index = randomNo.nextInt(3);
			switch (index) {
			case 0:
				authCode.append((char) ((int) (randomNo.nextInt(26)) + 97));
				break;
			case 1:
				authCode.append((char) ((int) (randomNo.nextInt(26)) + 65));
				break;
			case 2:
				authCode.append((randomNo.nextInt(10)));
				break;
			}
		}
		return authCode.toString();
	}

	@Override
	public void sendMail(String emailAddress, String authCode) {
		MimeMessage message = this.createMessage(emailAddress, authCode);

		try {
			emailSender.send(message);
		} catch (MailException e) {
			e.printStackTrace();
			throw new IllegalArgumentException();
		}
	}

	@Override
	public boolean checkAuthCode(String authCode, String targetCode) {
		boolean result = false;

		try {
			if (authCode.length() > 7) {
				authCode = authCode.split("=")[1];

				if (targetCode.equals(authCode)) {
					result = true;
				} else {
					result = false;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean checkDuplicate(String emailAddress) {
		boolean isDupli = false;
		List<Member> memberList = new ArrayList<Member>();

		try {
			if (null != emailAddress && "" != emailAddress) {
				emailAddress = emailAddress.split("=")[1];
				emailAddress = emailAddress.replaceAll("%40", "@");

				memberList = memberService.searchAllMember();
				Iterator<Member> iterator = memberList.iterator();
				while (iterator.hasNext()) {
					Member targetMember = iterator.next();

					if ((targetMember.getEmailAddress().toUpperCase()).equals(emailAddress.toUpperCase())) {
						isDupli = true;
						break;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isDupli;
	}
}