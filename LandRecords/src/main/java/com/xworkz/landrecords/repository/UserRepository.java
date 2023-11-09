package com.xworkz.landrecords.repository;

import org.springframework.ui.Model;

import com.xworkz.landrecords.dto.UserDto;

public interface UserRepository {

	public boolean saveUserDetails(UserDto dto);

	public UserDto ifExist(String email, String password, Model model);

	public UserDto passwordExists(String password);

	public UserDto mailExists(String mail);

	public boolean updateOtpByEmail(String otp, String mail);

	public UserDto findByOtp1(String otp);

	public boolean updatePassword(String password, String confirmPassword, String mail);

}
