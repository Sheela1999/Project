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

	@Override
	public UserDto passwordExists(String password) {
		EntityManager em = emf.createEntityManager();
		Query query = em.createNamedQuery("pwdExists").setParameter("ps", password);
		UserDto ref1 = (UserDto) query.getSingleResult();
		return ref1;

	}

	@Override
	public UserDto mailExists(String mail) {
		EntityManager em = emf.createEntityManager();
		Query query = em.createNamedQuery("mailExists").setParameter("em", mail);
		UserDto ref1 = (UserDto) query.getSingleResult();
		return ref1;
	}

	@Override
	public boolean updateOtpByEmail(String otp, String mail) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("updatingotp").setParameter("ot", otp).setParameter("em", mail);
		query.executeUpdate();
		em.getTransaction().commit();
		return true;
	}

	@Override
	public UserDto findByOtp1(String otp) {
		EntityManager em = emf.createEntityManager();
		Query query = em.createNamedQuery("findotp").setParameter("ot", otp);
		UserDto reg = (UserDto) query.getSingleResult();
		return reg;
	}

	@Override
	public boolean updatePassword(String password, String cPassword, String mail) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNamedQuery("updatingpwd").setParameter("pd", password).setParameter("cpd", cPassword)
				.setParameter("em", mail);
		query.executeUpdate();
		em.getTransaction().commit();
		return true;
	}

}
