package com.xworkz.landrecords.service;

import java.util.Properties;
import java.util.Random;
import java.util.Set;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.persistence.NoResultException;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.xworkz.landrecords.dto.UserDto;
import com.xworkz.landrecords.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepo;

	@Override
	public boolean saveUserDetails(UserDto dto, Model model) {
		if (dto.getMobileNumber() > 999999999) {
			if (dto.getPassword().equals(dto.getConfirmPassword())) {

				ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
				Validator validator = factory.getValidator();
				Set<ConstraintViolation<UserDto>> violation = validator.validate(dto);

				if (violation.isEmpty()) {
					UserDto exist = ifExist(dto.getEmail(), dto.getPassword(), model);
					if (exist != null) {
						System.out.println("Your Account Already Exist");
						return false;
					}

					boolean save = userRepo.saveUserDetails(dto);
					System.out.println(save);
					System.out.println("Data Validated");
					return true;
				} else {
					System.out.println("Data Not Validated");
					System.out.println(violation);
				}
			} else {
				model.addAttribute("ConfirmPassword", "Invalid Password, Check your password");
				System.out.println("Invalid Password, Check your password");
				return false;
			}

		} else {
			model.addAttribute("MobileNumber", "Invalid Mobile Number");
			System.out.println("Mobile Number is not valid");
			return false;
		}
		return false;
	}

	@Override
	public UserDto ifExist(String email, String password, Model model) {
		try {
			UserDto list = userRepo.ifExist(email, password, model);
			if (list != null) {
				model.addAttribute("Exist", "Already Exist");
				return list;
			}

		} catch (Exception e) {
			System.out.println("Data not present");
			return null;
		}
		return null;
	}

	@Override
	public UserDto logIn(String email, String password, Model model) {
		try {
			if (email != null) {
				if (password != null) {
					UserDto reg = userRepo.ifExist(email, password, model);
					if (reg != null) {
						return reg;
					}
					model.addAttribute("Account", "Account not Found");
					return null;
				}
				model.addAttribute("Password", "Invalid Password");
				return null;
			}
			model.addAttribute("Email", "Invalid Email, Please Check Email");
			return null;

		} catch (NoResultException e) {
			System.out.println("exception occured");
		}
		return null;
	}

	@Override
	public String randomotp(int length) {
		String numbers = "0123456789";
		Random rndm_method = new Random();
		char[] otp = new char[length];
		for (int i = 0; i < length; i++) {
			otp[i] = numbers.charAt(rndm_method.nextInt(numbers.length()));
		}
		return new String(otp);
	}

	@Override
	public boolean checkotp1(String mail, Model model) {
		UserDto found = findByMail(mail, model);
		if (found != null) {
			String otp = randomotp(4);
			System.out.println(otp);

			boolean up = userRepo.updateOtpByEmail(otp, mail);
			System.out.println(up);
			boolean sendMail = sendMail1(otp, mail);
			System.out.println(sendMail);
			model.addAttribute("otpsent", "OTP sent");
		}
		System.out.println("no dto for otp");
		return false;
	}

	@Override
	public UserDto findByOtp1(String otp, Model models) {
		try {
			if (otp != null) {
				UserDto list = userRepo.findByOtp1(otp);
				if (list.getOtp().equals(otp)) {
					return list;
				} else {
					models.addAttribute("Foundotp", "otp not matched");
					return null;
				}

			}
		} catch (NoResultException e) {

			System.out.println("dto null");
			models.addAttribute("Findotp1", "wrong otp ");
			return null;
		}
		models.addAttribute("Findotp", "not found");
		return null;
	}

	@Override
	public boolean sendMail1(String otp, String email) {
		String senderEmail = "sheela.xworkz@outlook.com";
		String senderPassword = "Sheela@23";

		// Recipient's email address
		String recipientEmail = email;

		// Generate a random OTP (You should implement your OTP generation logic here)

		// Outlook SMTP server settings
		String host = "smtp.office365.com";
		int port = 587;

		// Create properties for the SMTP session
		Properties properties = new Properties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", port);
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");

		// Create a session with the SMTP server
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(senderEmail, senderPassword);
			}
		});

		try {
			// Create a message
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(senderEmail));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
			message.setSubject("Your OTP Code");
			message.setText("Your OTP code is: " + otp + " this  otp is valid for 10 minutes only");

			// Send the message
			Transport.send(message);
			System.out.println("OTP sent successfully to " + recipientEmail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return true;
	}

	@Override
	public UserDto findByMail(String email, Model model) {
		try {
			UserDto reg = userRepo.mailExists(email);
			if (reg != null) {
				return reg;
			}

		} catch (NoResultException e) {
			System.out.println("This Email is not Exist");
		}
		return null;
	}

	@Override
	public boolean updatePassword(String password, String cPassword, String mail, Model model) {
		if (password != null && password.length() > 7 && password.length() < 16) {
			if (password.equals(cPassword)) {
				return userRepo.updatePassword(password, cPassword, mail);
			}
			model.addAttribute("Mismatch", "The password and confirm password must be same");
			return false;
		}
		model.addAttribute("Validpwd", "Please give the password minimum length 8 to maximum 15");
		return false;
	}

}
