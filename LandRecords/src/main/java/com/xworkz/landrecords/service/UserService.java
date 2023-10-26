package com.xworkz.landrecords.service;

import org.springframework.ui.Model;

import com.xworkz.landrecords.dto.UserDto;

public interface UserService {

	public boolean saveUserDetails(UserDto dto, Model model);

	public UserDto ifExist(String email, String password, Model model);

	public UserDto findByMail(String email, Model model);

	public UserDto logIn(String email, String password, Model model);

	public String randomotp(int length);

	public boolean checkotp1(String mail, Model model);

	public UserDto findByOtp1(String otp, Model models);

	public boolean sendMail1(String otp, String email);

	public boolean updatePassword(String password, String cPassword, String mail, Model model);

}
