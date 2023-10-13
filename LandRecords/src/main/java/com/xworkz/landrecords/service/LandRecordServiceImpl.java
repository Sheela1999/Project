package com.xworkz.landrecords.service;

import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xworkz.landrecords.dto.LandRecordsDto;
import com.xworkz.landrecords.repository.LandRecordRepo;

@Service
public class LandRecordServiceImpl implements LandRecordService {

	@Autowired
	private LandRecordRepo repo;

	@Override
	public boolean addRecords(LandRecordsDto dto) {
		if (dto.getMobileNumber() > 999999999) {

			if (dto.getHissaNumber() > 0) {

				if (dto.getSurveyNumber() > 0) {

					ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
					Validator validator = factory.getValidator();
					Set<ConstraintViolation<LandRecordsDto>> violation = validator.validate(dto);

					if (violation.isEmpty()) {
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
				}
			} else {
				System.out.println("Hissa Number is not valid");
			}
		} else {
			System.out.println("Mobile Number is not valid");
		}
		return false;
	}

}
