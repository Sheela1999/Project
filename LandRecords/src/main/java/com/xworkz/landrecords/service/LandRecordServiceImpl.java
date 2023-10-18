package com.xworkz.landrecords.service;

import java.util.List;
import java.util.Set;

import javax.persistence.NoResultException;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.xworkz.landrecords.dto.LandRecordsDto;
import com.xworkz.landrecords.repository.LandRecordRepo;

@Service
public class LandRecordServiceImpl implements LandRecordService {

	@Autowired
	private LandRecordRepo repo;

	@Override
	public boolean addRecords(LandRecordsDto dto, Model model) {
		if (dto.getMobileNumber() > 999999999) {

			if (dto.getHissaNumber() > 0) {

				if (dto.getSurveyNumber() > 0) {

					ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
					Validator validator = factory.getValidator();
					Set<ConstraintViolation<LandRecordsDto>> violation = validator.validate(dto);

						if (violation.isEmpty()) {
							LandRecordsDto exist = ifExists(dto.getHissaNumber(), dto.getSurveyNumber(), model);
							if(exist!=null) {
								System.out.println("Already Exist");
								return false;
							}
							
							boolean save = repo.addRecords(dto);
							System.out.println(save);
							System.out.println("Data Validated");
							return true;
						} else {
							System.out.println("Data Not Validated");
							System.out.println(violation);
						}
					

				} else {
					System.out.println("Survey Number is not valid");
					return false;
				}
			} else {
				System.out.println("Hissa Number is not valid");
				return false;
			}
		} else {
			System.out.println("Mobile Number is not valid");
			return false;
		}
		return false;
	}

	@Override
	public List<LandRecordsDto> findByHobliAndVillage(String hobli, String village, Model model) {
		if (hobli != null && hobli.isEmpty()) {
			if (village != null && village.isEmpty()) {
				try {
					List<LandRecordsDto> dtos = repo.findByHobliAndVillage(hobli, village);
					return dtos;
				} catch (Exception e) {
					System.out.println("No result found");
					return null;
				}
			}
			model.addAttribute("IsVillageValid", "Village is not valid");
			return null;
		}
		model.addAttribute("Hobli", "Hobli is not valid");
		return null;
	}

	@Override
	public List<LandRecordsDto> readAll() {
		return repo.readAll();
	}

	@Override
	public boolean updateBySurveyNumber(String ownerName, Long mobileNumber, String aadharNumber, Integer hissaNumber,
			Integer surveyNumber, Model model) {
		if (hissaNumber > 0 && hissaNumber < 21) {
			if (surveyNumber > 0 && surveyNumber < 150) {
				if (aadharNumber.length() == 12) {
					if (mobileNumber > 999999999) {
						if (ownerName.length() > 3) {
							return repo.updateBySurveyNumber(ownerName, mobileNumber, aadharNumber, hissaNumber,
									surveyNumber, model);
						}
						model.addAttribute("nameError", "check the owner name");
						return false;
					}
					model.addAttribute("pnError", "check mobile number");
					return false;
				}
				model.addAttribute("anError", "check Aadhar number");
				return false;
			}
			model.addAttribute("snError", "check survey number");
			return false;
		}
		model.addAttribute("hnError", "check hissa number");
		return false;
	}

	@Override
	public boolean deleteRecords(Integer hissaNumber, Integer surveyNumber, Model model) {
		if (hissaNumber > 0 && hissaNumber < 25) {
			if (surveyNumber > 0 && surveyNumber < 150) {
				return repo.deleteRecords(hissaNumber, surveyNumber);
			}
			model.addAttribute("Errorhissa", " check hissa number");
			return false;
		}
		model.addAttribute("ErrorSurvey", " check survey number");
		return false;
	}

	@Override
	public LandRecordsDto ifExists(Integer hissaNumber, Integer surveyNumber, Model model) {
		
		try {
			LandRecordsDto list =	repo.ifExists(hissaNumber, surveyNumber);
			if(list!=null) {
				model.addAttribute("Exist", "Already Exist");
				return list;
			}
			
			
		} catch (Exception e) {
			System.out.println("Data not present");
			return null;
		}
		return null;
		
	}
		
			
				
					
					
					
					
					
					
	@Override
	public boolean updateStatus(Boolean status, Integer hissaNumber, Integer surveyNumber) {
		if (hissaNumber > 0 && hissaNumber < 25) {
			if (surveyNumber > 0 && surveyNumber < 150) {
				repo.updateStatus(status, hissaNumber, surveyNumber);
				return true;
			}
			System.out.println("Survey is not valid");
			return false;
		}
		System.out.println("hissaNumber is not valid");
		return false;
	}

}
