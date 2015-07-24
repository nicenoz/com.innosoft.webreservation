package com.innosoft.webreservation.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import com.innosoft.webreservation.entity.SysEmail;

@Service
@Transactional
public class EmailServiceImpl implements EmailService {

	@Autowired
	private MailSender mailSender;

	public boolean sendMail(SysEmail email) {
		try {
			String reciever = email.getEMAIL_EMAIL();
			String subj = email.getEMAIL_SUBJECT();
			String msg = email.getEMAIL_MESSAGE();

			SimpleMailMessage message = new SimpleMailMessage();

			message.setTo(reciever);
			message.setSubject(subj);
			message.setText(msg);
			
			mailSender.send(message);

			return true;
		} catch (Exception ex) {
			System.out.println(ex);
			return false;
		}

	}
}
