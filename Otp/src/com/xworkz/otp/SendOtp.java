package com.xworkz.otp;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendOtp {

	public static void main(String[] args) throws AddressException, MessagingException {
		String otp1 = generatedOTP();
		System.out.println(otp1);

	}

	public static String generatedOTP() throws AddressException, MessagingException {
		int randomNo = (int) (Math.random() * 9000) + 1000;
		String otp = String.valueOf(randomNo);

		String senderEmail = "sheela.xworkz@outlook.com";
		String senderPassword = "Sheela@23";
		String recipientEmail = "sheela.xworkz@gmail.com";
		String subject = "Your OTP Code";
		String messageText = "Your OTP code is: " + otp;
		System.out.println(otp);

		// Set up JavaMail properties
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.office365.com");
		properties.put("mail.smtp.port", "587");

		// Create a session with authentication
		Session session = Session.getInstance(properties, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(senderEmail, senderPassword);
			}
		});

		try {
			// Create a MimeMessage object
			Message message = new MimeMessage(session);

			// Set the sender, recipient, subject, and message body
			message.setFrom(new InternetAddress(senderEmail));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
			message.setSubject(subject);
			message.setText(messageText);

			// Send the email
			Transport.send(message);

			System.out.println("OTP email sent successfully!");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return otp;
	}

}
