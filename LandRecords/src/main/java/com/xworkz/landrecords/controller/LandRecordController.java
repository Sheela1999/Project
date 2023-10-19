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
	public String deleteRecords(@RequestParam("hissaNumber") Integer hissaNumber, @RequestParam("surveyNumber") Integer surveyNumber, Model model) {
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
		if(readData != null) {
		model.addAttribute("readList", readData);
		System.out.println("Reading All the records");
		return "ViewAll";
		}else {
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

}
