package com.xworkz.landrecords.service;

import org.springframework.ui.Model;

import com.xworkz.landrecords.dto.AdminDto;

public interface AdminService {

	public boolean validate(AdminDto dto, Model model);

	public AdminDto findByEmail(String email, Model model);

	public String generateOTP();
	
	public boolean signIn(String email, Model model) throws Exception;
	
	public AdminDto findByOtp(String otp, Model model) throws Exception;
	
	public boolean SendOtpToEmail(String otp, String email, Model model);
	
	public String encryptPWDAndOTP(String password, String Secretkey) throws Exception;
	
	public String decryptPWDAndOtp(String encryptPwd, String Secretkey) throws NegativeArraySizeException;

}
