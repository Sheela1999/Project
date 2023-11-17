package com.xworkz.otp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xworkz.otp.ImageEntity;
import com.xworkz.otp.repo.ImageRepo;

@Service
public class ImageService {
	@Autowired
	private ImageRepo imageRepository;

	public void saveImage(byte[] imageData) {
		ImageEntity imageEntity = new ImageEntity();
		imageEntity.setImageData(imageData);
		// Set other fields as needed
		imageRepository.save(imageEntity);
	}

	public byte[] getImageById(Long id) {
		List<ImageEntity> imageEntityOptional = imageRepository.findById(id);
		if (((Object) imageEntityOptional).equals(id)) {
			return imageEntityOptional.get(1).getImageData();
		}
		return null;
	}
}
