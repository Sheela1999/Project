package com.xworkz.landrecords.service;

import org.springframework.ui.Model;

import com.xworkz.landrecords.dto.UserDto;

public interface UserService {
	
	public boolean saveUserDetails(UserDto dto, Model model);
	
	public UserDto ifExist(String email, String password, Model model);
	
	public UserDto logIn(String email, String password, Model model);

}
