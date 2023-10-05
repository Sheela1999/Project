package com.xworkz.landrecords.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.xworkz.landrecords.dto.AdminDto;
import com.xworkz.landrecords.repository.AdminRepo;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminRepo repo;

	@Override
	public boolean validate(AdminDto dto, Model model) {
		boolean valid = true;
		if(dto == null) {
			model.addAttribute("dtoValidate", "Dto is Null");
			System.out.println("dto is null");
		}
		if(dto.getEmail() == null || dto.getEmail().length() <=3 || dto.getEmail().isEmpty()) {
			model.addAttribute("IsEmailValid", "Email is not valid");
			System.out.println("Email is not valid");
			valid = false;
		}
		if(dto.getOtp() == null || dto.getOtp().length() <=100000 || dto.getOtp().length() >= 1000000) {
			model.addAttribute("IsOTPvalid", "Invalid OTP, Please enter correct OTP");
			System.out.println("Invalid OTP, Please enter correct OTP");
			valid = false;
		}
		return valid;
	}

	@Override
	public AdminDto findByEmail(String email, Model model) {
		if(email != null && !email.isEmpty()) {
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
		int randomNo = (int)(Math.random() * 9000) + 1000;
		String otp = String.valueOf(randomNo);
		return otp;
	}

	@Override
	public boolean signIn(String email, Model model) {
		if(email != null && !email.isEmpty()) {
			AdminDto found = findByEmail(email, model);
			if(found != null) {
				System.out.println("Email is Verified");
				System.out.println(found);
				String generatedOTP = generateOTP();
				System.out.println(generatedOTP);
				boolean updated = repo.updateOtpByEmail(generatedOTP, email);
				System.out.println(updated);
				return true;
			}
			return false;	
		}
		model.addAttribute("IsEmailValid", "Invalid Email");
		return false;
	}

	@Override
	public AdminDto otpValidation(String otp, Model model) {
		try {
			AdminDto dto = repo.findByOtp(otp);
			model.addAttribute("IsOTPvalid", "OTP Verified");
			return dto;
		} catch (Exception e) {
			model.addAttribute("IsOTPvalid", "Invalid OTP, Please enter correct OTP");
			return null;
		}
		
	}

	

}
