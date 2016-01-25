package com.Angelo.mail;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	
	public static void main(String[] args) {
		Properties props = new Properties();
		
		props.setProperty("mail.host", "smtp.gmail.com");
		props.setProperty("mail.smpt.port", "465");
		props.setProperty("mail.smpt.auth", "true");
		//props.setProperty("mail.smtp.starttls.enable","true");
		
		Authenticator auth = new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("angelosyncwire@gmail.com", "leaderment88");
			}	
		};
		
		Session session = Session.getDefaultInstance(props, auth);
		
		Message msg = new MimeMessage(session);
		
		try {
			msg.setSubject("Welcome");
			msg.setText("This is just a test email.");
			msg.setFrom(new InternetAddress("angelosyncwire@gmail.com"));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress("Aorhymes@gmail.com"));
			
			Transport.send(msg);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("Finished");
	}

}
