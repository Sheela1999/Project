package com.xworkz.landrecords.service;

import org.springframework.ui.Model;

import com.xworkz.landrecords.dto.UserDto;

public interface UserService {

	public boolean saveUserDetails(UserDto dto, Model model) throws Exception;

	public UserDto ifExist(String email, String password, Model model);

	public UserDto findByMail(String email, Model model);
	
	public UserDto passwordExists(String password);

	public UserDto mailExists(String mail);

	public UserDto logIn(String email, String password, Model model);

	public String randomotp(int length);

	public boolean checkotp1(String mail, Model model) throws Exception;

	public UserDto findByOtp1(String otp, Model model);

	public boolean sendMail1(String otp, String email);

	public boolean updatePassword(String password, String confirmPassword, String mail, Model model) throws Exception;
	
	public String encryptPWD(String password, String Secretkey)  throws Exception;
	
	public String decryptPWD(String encryptPwd,String Secretkey);

}
