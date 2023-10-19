package com.xworkz.landrecords.repository;

import java.util.List;

import org.springframework.ui.Model;

import com.xworkz.landrecords.dto.LandRecordsDto;

public interface LandRecordRepo {

	public boolean addRecords(LandRecordsDto dto);

	public List<LandRecordsDto> findByHobliAndVillage(String hobli, String village) throws Exception;

	public List<LandRecordsDto> readAll();

	public boolean updateBySurveyNumber(String ownerName, Long mobileNumber, String aadharNumber, Integer hissaNumber,
			Integer surveyNumber, Model model);

	public boolean deleteRecords(Integer hissaNumber, Integer surveyNumber);

	public LandRecordsDto ifExists(Integer hissaNumber, Integer surveyNumber);
	
	public boolean updateStatus(Integer hissaNumber, Integer surveyNumber);
}
