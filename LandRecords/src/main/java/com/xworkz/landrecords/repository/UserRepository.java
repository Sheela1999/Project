package com.xworkz.landrecords.repository;

import org.springframework.ui.Model;

import com.xworkz.landrecords.dto.UserDto;

public interface UserRepository {
	
	public boolean saveUserDetails(UserDto dto);
	
	public UserDto ifExist(String email, String password, Model model);

}
