package com.xworkz.landrecords.repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xworkz.landrecords.dto.AdminDto;

@Repository
public class AdminRepoImpl implements AdminRepo{
	
	@Autowired
	private EntityManagerFactory emf;

	@Override
	public AdminDto findByEmail(String email) throws Exception{
		EntityManager em = emf.createEntityManager();
		TypedQuery<AdminDto> query = em.createNamedQuery("FindByEmail", AdminDto.class)
				.setParameter("em", email);
		AdminDto dto = query.getSingleResult();
		System.out.println(dto);
		return dto;
	}

	@Override
	public boolean updateOtpByEmail(String otp, String email) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("updateOtpByEmail");
		query.setParameter("otp", otp);
		query.setParameter("email", email);
		query.executeUpdate();
		try {
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
		finally {
			em.close();
		}
	}

	@Override
	public AdminDto findByOtp(String otp) throws Exception{
		EntityManager em = emf.createEntityManager();
		TypedQuery<AdminDto> query = em.createNamedQuery("findByOtp", AdminDto.class)
				.setParameter("otp", otp);
		AdminDto dto = query.getSingleResult();
		System.out.println(dto);
		return dto;
	}

}
