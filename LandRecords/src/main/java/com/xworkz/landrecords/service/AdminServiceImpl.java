package com.xworkz.landrecords.service;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Base64;
import java.util.Properties;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.persistence.NoResultException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.xworkz.landrecords.dto.AdminDto;
import com.xworkz.landrecords.repository.AdminRepo;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminRepo repo;

	@Override
	public boolean validate(AdminDto dto, Model model) {
		boolean valid = true;
		if (dto == null) {
			model.addAttribute("dtoValidate", "Dto is Null");
			System.out.println("dto is null");
		}
		if (dto.getEmail() == null || dto.getEmail().length() <= 3 || dto.getEmail().isEmpty()) {
			model.addAttribute("IsEmailValidated", "Email is not valid");
			System.out.println("Email is not valid");
			valid = false;
		}
		if (dto.getOtp() == null || dto.getOtp().length() !=4  ) {
			model.addAttribute("IsOTPvalid", "Invalid OTP, Please enter correct OTP");
			System.out.println("Invalid OTP, Please enter correct OTP");
			valid = false;
		}
		return valid;
	}
	
	@Override
	public boolean saveAdminInfo(AdminDto dto, Model model) {
		boolean validated = validate(dto, model);
		if (validated == true) {
			boolean saved = repo.saveAdmin(dto);
			System.out.println(saved);
			return true;
		}
		return false;
		
	}

	@Override
	public AdminDto findByEmail(String email, Model model) {
		if (email != null && !email.isEmpty()) {
			try {
				return repo.findByEmail(email);
			} catch (Exception e) {
				System.out.println("No Result Found");
				return null;
			}
		}
		model.addAttribute("IsEmailValid", "Invalid Email");
		return null;
	}

	@Override
	public String generateOTP() {
		int randomNo = (int) (Math.random() * 9000) + 1000;
		String otp = String.valueOf(randomNo);
		return otp;
	}

	@Override
	public boolean signIn(String email, Model model) throws Exception {
		if (email != null && !email.isEmpty()) {
			AdminDto found = findByEmail(email, model);
			if (found != null) {
				System.out.println("Email is Verified");
				System.out.println(found);
				String generatedOTP = generateOTP();
				System.out.println(generatedOTP);
			String enc=	encryptOTP( generatedOTP, "encrypting");
				boolean updated = repo.updateOtpByEmail(enc, email);
				System.out.println(updated);
				boolean sent = SendOtpToEmail(generatedOTP, email, model);
				System.out.println(sent);
				return true;
			}
			System.out.println("not updated");
			return false;
		}
		model.addAttribute("IsEmailValid", "Invalid Email, Please enter correct email");
		return false;
	}

	@Override
	public boolean SendOtpToEmail(String otp, String email, Model model) {

		String senderEmail = "sheela.xworkz@outlook.com";
		String senderPassword = "Sheela@23";
		String recipientEmail = email;
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

			System.out.println("OTP sent to your email successfully!");
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public AdminDto findByOtp(String otp, Model model) {
		try {
			if (otp != null) {
				AdminDto list = repo.findByOtp(otp);
				if (list.getOtp().equals(otp)) {
					return list;
				} else {
					model.addAttribute("findotp2", "otp not matched");
					return null;
				}

			}
		} catch (NoResultException e) {

			System.out.println("dto null");
			model.addAttribute("findotp1", "wrong otp");
			return null;
		}
		model.addAttribute("findotp", "notfound");
		return null;
	}

	@Override
	public String encryptOTP(String otp, String Secretkey) throws Exception {
		SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
		KeySpec spec = new PBEKeySpec(Secretkey.toCharArray(), Secretkey.getBytes(), 65536, 256);
		SecretKey secret = new SecretKeySpec(factory.generateSecret(spec).getEncoded(), "AES");

		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		cipher.init(Cipher.ENCRYPT_MODE, secret);
		byte[] iv = cipher.getParameters().getParameterSpec(IvParameterSpec.class).getIV();

		byte[] encryptedPassword = cipher.doFinal(otp.getBytes("UTF-8"));
		byte[] combined = new byte[iv.length + encryptedPassword.length];
		System.arraycopy(iv, 0, combined, 0, iv.length);
		System.arraycopy(encryptedPassword, 0, combined, iv.length, encryptedPassword.length);

		return Base64.getEncoder().encodeToString(combined);

	}

	@Override
	public String decryptOtp(String encryptOtp, String Secretkey) throws NegativeArraySizeException{

		byte[] combined = Base64.getDecoder().decode(encryptOtp);

		byte[] iv = new byte[16];
		byte[] encrypted = new byte[combined.length - 16];
		System.arraycopy(combined, 0, iv, 0, 16);
		System.arraycopy(combined, 16, encrypted, 0, encrypted.length);

		SecretKeyFactory factory;
		try {
			factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");

			KeySpec spec = new PBEKeySpec(Secretkey.toCharArray(), Secretkey.getBytes(), 65536, 256);
			SecretKey secret;

			secret = new SecretKeySpec(factory.generateSecret(spec).getEncoded(), "AES");
			Cipher cipher;

			cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");

			cipher.init(Cipher.DECRYPT_MODE, secret, new IvParameterSpec(iv));

			return new String(cipher.doFinal(encrypted), "UTF-8");

		} catch (UnsupportedEncodingException | IllegalBlockSizeException | BadPaddingException
				| InvalidKeySpecException | NoSuchPaddingException | InvalidKeyException
				| InvalidAlgorithmParameterException | NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return null;

	}

}
