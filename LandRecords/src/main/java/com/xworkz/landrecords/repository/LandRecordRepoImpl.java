package com.xworkz.landrecords.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.xworkz.landrecords.dto.LandRecordsDto;

@Repository
public class LandRecordRepoImpl implements LandRecordRepo {

	@Autowired
	private EntityManagerFactory emf;

	@Override
	public boolean addRecords(LandRecordsDto dto) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(dto);
		try {
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false;
		} finally {
			em.close();
		}
	}

	@Override
	public List<LandRecordsDto> findByHobliAndVillage(String hobli, String village) throws Exception {
		EntityManager em = emf.createEntityManager();
		TypedQuery<LandRecordsDto> query = em.createNamedQuery("findByHobliAndVillage", LandRecordsDto.class);
		query.setParameter("hobli", hobli);
		query.setParameter("village", village);
		List<LandRecordsDto> list = query.getResultList();
		return list;
	}

	@Override
	public List<LandRecordsDto> readAll() {
		EntityManager em = emf.createEntityManager();
		Query query = em.createNamedQuery("readAll");
		List<LandRecordsDto> list = query.getResultList();
		return list;
	}

	@Override
	public boolean updateBySurveyNumber(String ownerName, Long mobileNumber, String aadharNumber, Integer hissaNumber,
			Integer surveyNumber, Model model) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("Edit").setParameter("on", ownerName).setParameter("pn", mobileNumber)
				.setParameter("an", aadharNumber).setParameter("hn", hissaNumber).setParameter("sn", surveyNumber);
		query.executeUpdate();
		em.getTransaction().commit();
		return true;
	}

	@Override
	public boolean deleteRecords(Integer hissaNumber, Integer surveyNumber) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("Delete").setParameter("hissa", hissaNumber).setParameter("survey",
				surveyNumber);
		query.executeUpdate();
		em.getTransaction().commit();
		return true;
	}

	@Override
	public LandRecordsDto ifExists(Integer hissaNumber, Integer surveyNumber) {
		EntityManager em = emf.createEntityManager();
		Query query = em.createNamedQuery("ifExist").setParameter("hn", hissaNumber).setParameter("sn", surveyNumber);
		LandRecordsDto dto = (LandRecordsDto) query.getSingleResult();
		return dto;
	}

	@Override
	public boolean updateStatus(Integer hissaNumber, Integer surveyNumber) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("updateStatus").setParameter("hissa", hissaNumber)
				.setParameter("survey", surveyNumber);
		query.executeUpdate();
		em.getTransaction().commit();
		return true;
	}

}
