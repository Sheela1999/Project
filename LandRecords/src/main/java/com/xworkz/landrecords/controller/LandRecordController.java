package com.xworkz.landrecords.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.xworkz.landrecords.dto.LandRecordsDto;
import com.xworkz.landrecords.service.LandRecordService;

@Controller
public class LandRecordController {

	@Autowired
	private LandRecordService service;

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
			model.addAttribute("NotFound", "Searching records not found");
			return "Read";
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String editRecords(@RequestParam String ownerName, @RequestParam Long mobileNumber,
			@RequestParam String aadharNumber, @RequestParam Integer hissaNumber, @RequestParam Integer surveyNumber,
			Model model) {
		boolean edit = service.updateBySurveyNumber(ownerName, mobileNumber, aadharNumber, hissaNumber, surveyNumber,
				model);
		if (edit) {
			model.addAttribute("Edited", "updated in records");
			return "Edit";
		}
		return "Edit";
	}

	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String deleteRecords(@RequestParam  Boolean status, @RequestParam Integer hissaNumber, @RequestParam Integer surveyNumber, Model model) {
		boolean statusUpdated = service.updateStatus(status, hissaNumber, surveyNumber);
		System.out.println(statusUpdated);
		boolean remove = service.deleteRecords(hissaNumber, surveyNumber, model);
		if (remove) {
			model.addAttribute("delete", "records deleted sucessfully");
		}
		return "Delete";
	}

	@RequestMapping(value = "/read", method = RequestMethod.POST)
	public String ReadAll(LandRecordsDto dto, Model model) {
		List<LandRecordsDto> readData = service.readAll();
		model.addAttribute("readList", readData);
		System.out.println(readData);
		return "ViewAll";
	}

}
