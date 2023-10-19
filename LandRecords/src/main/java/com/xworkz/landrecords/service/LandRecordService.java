package com.xworkz.landrecords.service;

import java.util.List;

import org.springframework.ui.Model;

import com.xworkz.landrecords.dto.LandRecordsDto;

public interface LandRecordService {
	
	public boolean addRecords(LandRecordsDto dto, Model model);
	
	public List<LandRecordsDto> findByHobliAndVillage(String hobli, String village, Model model);
	
	public List<LandRecordsDto> readAll();
	
	public boolean updateBySurveyNumber(String ownerName,Long mobileNumber,  String aadharNumber,Integer hissaNumber,Integer surveyNumber,Model model);
	
	public boolean deleteRecords(Integer hissaNumber, Integer surveyNumber,Model model);
	
	public LandRecordsDto ifExists(Integer hissaNumber, Integer surveyNumber, Model model);
	
	public boolean updateStatus(Integer hissaNumber, Integer surveyNumber);
	
	public LandRecordsDto editRecords(Integer hissaNumber, Integer surveyNumber, Model model);
	
}
