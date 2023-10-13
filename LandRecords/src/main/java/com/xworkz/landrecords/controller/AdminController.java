package com.xworkz.landrecords.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.xworkz.landrecords.dto.AdminDto;
import com.xworkz.landrecords.dto.LandRecordsDto;
import com.xworkz.landrecords.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginData(@RequestParam String email, Model model) {
		boolean status = service.signIn(email, model);
		if (status) {
			System.out.println("Email Verified");
			return "SignIn";
		} else {
			model.addAttribute("IsAccountExist", "Account Not Exist");
			return "SignIn";
		}
	}

	@RequestMapping(value = "/sendOTP", method = RequestMethod.POST)
	public String otpVerification(@RequestParam String otp, Model model) {
		AdminDto sentData = service.otpValidation(otp, model);

		if (sentData != null) {
			System.out.println("otp verified");
			model.addAttribute("dto", sentData);
			return "Main";
		} else {
			System.out.println("Invalid OTP, Please enter correct OTP");
			return "SignIn";
		}
	}

}
