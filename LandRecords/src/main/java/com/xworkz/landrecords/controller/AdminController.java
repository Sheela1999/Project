package com.xworkz.landrecords.controller;

import javax.servlet.http.HttpSession;

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
	public String loginData(@RequestParam String email, Model model,HttpSession session) throws Exception {
		boolean status = service.signIn(email, model);
		if (status) {
			session.setAttribute("email1", email);
			System.out.println("Email Verified");
			return "SignIn";
		} else {
			model.addAttribute("IsAccountExist", "Account Not Exist");
			return "SignIn";
		}
	}

	@RequestMapping(value = "/sendOTP", method = RequestMethod.POST)
	public String otpVerification(@RequestParam String otp, Model model, HttpSession session) {
		String email = (String) session.getAttribute("email1");
		System.out.println(email);
		if (email != null) {
			AdminDto found = service.findByEmail(email, model);
			session.setAttribute("Admin", found);
			
			String decrypted = service.decryptPWDAndOtp(found.getOtp(), "encrypting");
			System.out.println(decrypted);
			if(otp.equals(decrypted)) {
				return "Main";
			}
			model.addAttribute("IsOTPvalid", "Invalid OTP, Please enter correct OTP");
			return null;
		}
        return "SignIn";
		
	}

}
