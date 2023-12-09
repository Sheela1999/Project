package com.xworkz.landrecords.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.xworkz.landrecords.dto.AdminDto;
import com.xworkz.landrecords.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	
	@RequestMapping(value="/uploadImage", method = RequestMethod.POST)
	public String save(AdminDto dto, Model model , @RequestParam ("file") MultipartFile file) throws IllegalStateException, IOException {	
		String uploadPath = "C:\\Users\\india\\Desktop\\ProjectImage\\";
		String orgFileName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."),
				file.getOriginalFilename().length());
		String uniqueName = dto.getAdminName() + orgFileName;
		file.transferTo(new File (uploadPath + uniqueName));
		
		dto.setAdminImagePath(uploadPath + uniqueName);
		
		boolean savedData = service.saveAdminInfo(dto, model);
		System.out.println(savedData);
		return "Admin";
	}

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
			
			String decrypted = service.decryptOtp(found.getOtp(), "encrypting");
			System.out.println(decrypted);
			if(otp.equals(decrypted)) {
				return "Main";
			}
			model.addAttribute("IsOTPvalid", "Invalid OTP, Please enter correct OTP");
		}
        return "SignIn";
		
	}

}
