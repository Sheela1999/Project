package com.xworkz.landrecords.service;

import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.xworkz.landrecords.dto.LandRecordsDto;
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
					if(exist!=null) {
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
		if(email != null) {
			if(password != null) {
				UserDto dto = userRepo.ifExist(email, password, model);
				if(dto != null) {
					return dto;
				}
				model.addAttribute("Account", "Account not Found");
				return null;
				
			}
			model.addAttribute("Password", "Invalid Password");
			return null;
		}
		model.addAttribute("Email", "Invalid Email, Please Check Email");
		return null;
	}

}
