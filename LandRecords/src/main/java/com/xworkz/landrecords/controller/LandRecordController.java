package com.xworkz.landrecords.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String saveRecords(LandRecordsDto dto, Model model) {
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
	public String registration(UserDto dto, Model model) {
		boolean saved = userService.saveUserDetails(dto, model);
		System.out.println(saved);

		if (saved) {
			model.addAttribute("Registration", "Registered Successfully");
			return "UserSignUp";
		} else {
			model.addAttribute("NotRegistration", "Not Registered, Please give proper details");
			return "UserSignUp";
		}

	}

	@RequestMapping(value = "/userLogin", method = RequestMethod.POST)
	public String userLogin(@RequestParam String email, @RequestParam String password, Model model) {
		UserDto logIn = userService.ifExist(email, password, model);
		System.out.println(logIn);
		if (logIn != null) {
			model.addAttribute("Login", "Login Successful");
			return "ViewUser";
		}
		return "UserSignIn";
	}

	@RequestMapping(value = "/forget", method = RequestMethod.POST)
	public String verify(@RequestParam String email, Model model) {

		boolean sign = userService.checkotp1(email, model);
		if (sign) {
			model.addAttribute("Checking", "Check the Email");
			return "ForgetPwd";
		}
		return "ForgetPwd";
	}

	@RequestMapping(value = "/checksotp", method = RequestMethod.POST)
	public String verifytp(@RequestParam String otp, Model model) {

		UserDto verifiedOTP = userService.findByOtp1(otp, model);
		if (verifiedOTP != null) {
			model.addAttribute("check", verifiedOTP);
			return "UpdatePwd";
		}
		return "ForgetPwd";
	}

	@RequestMapping(value = "/updatePwd", method = RequestMethod.POST)
	public String updatePassword(@RequestParam String email, @RequestParam String password,
			@RequestParam String confirmPassword, Model model) {
		boolean updated = userService.updatePassword(password, confirmPassword, email, model);
		if (updated) {
			model.addAttribute("updated", "Password Updated Successfully");
			return "ViewUser";
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
	public String userView(@RequestParam Integer hissaNumber, @RequestParam Integer surveyNumber, Model model) {
		LandRecordsDto data = service.ifExists(hissaNumber, surveyNumber, model);
		if (data != null) {
			model.addAttribute("read", data);
			System.out.println("Data is Present");
			return "ViewUser";
		}
		model.addAttribute("Reading", "No Records found");
		return "ViewUser";
	}

}
