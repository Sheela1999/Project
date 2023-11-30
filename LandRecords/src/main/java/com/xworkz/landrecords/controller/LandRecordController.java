package com.xworkz.landrecords.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.xworkz.landrecords.dto.LandRecordsDto;
import com.xworkz.landrecords.dto.UserDto;
import com.xworkz.landrecords.service.LandRecordService;
import com.xworkz.landrecords.service.UserService;

@Controller
public class LandRecordController {

	@Autowired
	private LandRecordService service;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveRecords(LandRecordsDto dto, Model model, @RequestParam ("imagePath") MultipartFile imagePath) throws IllegalStateException, IOException {
		
		String uploadPath = "C:\\Users\\india\\Desktop\\ProjectImage\\";
		String orgFileName = imagePath.getOriginalFilename().substring(imagePath.getOriginalFilename().lastIndexOf("."),
				imagePath.getOriginalFilename().length());
		String uniqueName = dto.getOwnerName() + orgFileName;
		imagePath.transferTo(new File (uploadPath + uniqueName));
		
		dto.setImage(uploadPath + uniqueName);
		
		boolean status = service.addRecords(dto, model);
		System.out.println(status);

		if (status) {
			model.addAttribute("Saved", "Land Records Saved Successfully");
			return "Save";
		} else {
			model.addAttribute("Saved", "LandRecords Not Saved");
			return "Save";
		}
	}

	@RequestMapping(value = "/check", method = RequestMethod.POST)
	public String searchRecords(@RequestParam String hobli, @RequestParam String village, Model model) {
		List<LandRecordsDto> found = service.findByHobliAndVillage(hobli, village, model);
		System.out.println(found);

		if (found != null) {
			model.addAttribute("found", found);
			return "Read";
		} else {
			model.addAttribute("NotFound", "Searching records are not found");
			return "Read";
		}
	}

	@PostMapping(value = "/edit")
	public String editRecords(@RequestParam String ownerName, @RequestParam Long mobileNumber,
			@RequestParam String aadharNumber, @RequestParam("hissaNumber") Integer hissaNumber,
			@RequestParam("surveyNumber") Integer surveyNumber, Model model) {
		boolean edit = service.updateBySurveyNumber(ownerName, mobileNumber, aadharNumber, hissaNumber, surveyNumber,
				model);
		if (edit) {
			model.addAttribute("Edited", "updated in records");
			return "Read";
		}
		return "Edit";
	}

	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String deleteRecords(@RequestParam("hissaNumber") Integer hissaNumber,
			@RequestParam("surveyNumber") Integer surveyNumber, Model model) {
		boolean statusUpdated = service.updateStatus(hissaNumber, surveyNumber);
		System.out.println(statusUpdated);
		boolean remove = service.deleteRecords(hissaNumber, surveyNumber, model);
		if (remove) {
			model.addAttribute("delete", "records deleted sucessfully");
			return "Read";
		}
		return "Read";
	}

	@RequestMapping(value = "/readAll", method = RequestMethod.GET)
	public String ReadAll(LandRecordsDto dto, Model model) {
		List<LandRecordsDto> readData = service.readAll();
		if (readData != null) {
			model.addAttribute("readList", readData);
			System.out.println("Reading All the records");
			return "ViewAll";
		} else {
			model.addAttribute("Reading", "No Records Found");
			return "ViewAll";
		}
	}

	@GetMapping(value = "/updateRecords")
	public String edit(Model model, @RequestParam("hissaNumber") Integer hissaNumber,
			@RequestParam("surveyNumber") Integer surveyNumber) {
		LandRecordsDto edited = service.editRecords(hissaNumber, surveyNumber, model);
		System.out.println(edited);
		return "Edit";
	}

	@RequestMapping(value = "/saveUserRecords", method = RequestMethod.POST)
	public String registration(UserDto dto, Model model) throws Exception {
		boolean saved = userService.saveUserDetails(dto, model);
		System.out.println(saved);

		if (saved) {
			model.addAttribute("Registration", "Registered Successfully");
			return "ViewUser";
		} else {
			model.addAttribute("NotRegistration", "Not Registered, Please give proper details");
			return "UserSignUp";
		}

	}

	@RequestMapping(value = "/userLogin", method = RequestMethod.POST)
	public String userLogin(@RequestParam String email, @RequestParam String password, Model model) {
		UserDto logIn = userService.logIn(email, password, model);
		System.out.println(logIn);
		if (logIn != null) {
			model.addAttribute("Login", "Login Successful");
			return "ViewUser";
		}
		model.addAttribute("Login", "Not Login, Check your email and password");
		return "UserSignIn";
	}

	@RequestMapping(value = "/forget", method = RequestMethod.POST)
	public String forgotPassword(@RequestParam String email, Model model, HttpSession session) throws Exception {

		boolean sign = userService.checkotp1(email, model);
		if (sign) {
			session.setAttribute("email", email);
			model.addAttribute("Checking", "Check the Email");
			return "ForgetPwd";
		}
		return "ForgetPwd";
	}

	@RequestMapping(value = "/checksotp", method = RequestMethod.POST)
	public String verifyOtp(@RequestParam String otp, Model model,  HttpSession session) {
		String email = (String) session.getAttribute("email");
		System.out.println(email);
		if(email != null) {
			UserDto foundMail = userService.findByMail(email, model);
			if(foundMail != null) {
				String dcOtp = userService.decryptPWD(foundMail.getOtp(), "EncryptOtp");
				if(otp.equals(dcOtp)) {
					return "UpdatePwd";
				}
				System.out.println("otp error");
				return "ForgetPwd";
			}
			System.out.println("dto error");
			return "ForgetPwd";
		}

		System.out.println("dto  missed");
		return "ForgetPwd";
	}

	@RequestMapping(value = "/updatePwd", method = RequestMethod.POST)
	public String updatePassword(@RequestParam String email, @RequestParam String password,
			@RequestParam String confirmPassword, Model model) throws Exception {
		boolean updated = userService.updatePassword(password, confirmPassword, email, model);
		if (updated) {
			model.addAttribute("updated", "Password Updated Successfully");
			return "UserSignIn";
		}
		return "UpdatePwd";
	}

	@RequestMapping(value = "/userView", method = RequestMethod.POST)
	public String viewUser(@RequestParam String hobli, @RequestParam String village, Model model) {
		List<LandRecordsDto> viewData = service.findByHobliAndVillage(hobli, village, model);
		System.out.println(viewData);
		
		if (viewData != null) {
			model.addAttribute("view", viewData);
			System.out.println("Data is Present");
			return "ViewUser";
		}
		model.addAttribute("Read", "Records not found");
		return "ViewUser";
	}

	@RequestMapping(value = "/userCard", method = RequestMethod.POST)
	public String userView(@RequestParam Integer hissaNumber, @RequestParam Integer surveyNumber, Model model, HttpSession session) {
		LandRecordsDto data = service.ifExists(hissaNumber, surveyNumber, model);
		if (data != null) {
			session.setAttribute("read", data);
			System.out.println("Data is Present");
			return "UserViewCard";
		}
		model.addAttribute("Reading", "No Records found");
		return "ViewUser";
	}

}
