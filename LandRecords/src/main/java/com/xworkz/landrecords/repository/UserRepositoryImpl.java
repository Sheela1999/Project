package com.xworkz.landrecords.repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.xworkz.landrecords.dto.UserDto;

@Repository
public class UserRepositoryImpl implements UserRepository {

	@Autowired
	private EntityManagerFactory emf;

	@Override
	public boolean saveUserDetails(UserDto dto) {
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
	public UserDto ifExist(String email, String password, Model model) {
		EntityManager em = emf.createEntityManager();
		Query query = em.createNamedQuery("IfExist").setParameter("email", email).setParameter("password", password);
		UserDto dto = (UserDto) query.getSingleResult();
		return dto;
	}

}
