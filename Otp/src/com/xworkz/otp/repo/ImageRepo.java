package com.xworkz.otp.repo;

import java.util.List;

import com.xworkz.otp.ImageEntity;

public interface ImageRepo {

	public boolean save(ImageEntity imageEntity);

	public List<ImageEntity> findById(Long id);
	
	

}
