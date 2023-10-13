package com.xworkz.landrecords.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xworkz.landrecords.dto.LandRecordsDto;
import com.xworkz.landrecords.service.LandRecordService;

@Controller
public class LandRecordController {

	@Autowired
	private LandRecordService service;

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveRecords(LandRecordsDto dto, Model model) {
		boolean status = service.addRecords(dto);
		System.out.println(status);

		if (status) {
			model.addAttribute("Saved", "Land Records Saved Successfully");
			return "Save";
		} else {
			model.addAttribute("Saved", "LandRecords Not Saved");
			return "Save";
		}
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchRecords(LandRecordsDto dto, Model model) {
		return "Read";
		
	}

}
