package com.xworkz.landrecords.service;

import org.springframework.ui.Model;

import com.xworkz.landrecords.dto.AdminDto;

public interface AdminService {

	public boolean validate(AdminDto dto, Model model);

	public AdminDto findByEmail(String email, Model model);

	public String generateOTP();
	
	public boolean signIn(String email, Model model);
	
	public AdminDto otpValidation(String otp, Model model);
	
	public boolean SendOtpToEmail(String otp, String email, Model model);

}
