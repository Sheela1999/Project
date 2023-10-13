package com.xworkz.landrecords.repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		}
		finally {
			em.close();
		}
	}

}
