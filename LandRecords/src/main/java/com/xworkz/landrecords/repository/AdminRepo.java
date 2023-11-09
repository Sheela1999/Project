package com.xworkz.landrecords.repository;

import com.xworkz.landrecords.dto.AdminDto;

public interface AdminRepo {
	
	public AdminDto findByEmail(String email) throws Exception;
	
	public boolean updateOtpByEmail(String otp, String email);
	
	public AdminDto findByOtp(String otp);

}
