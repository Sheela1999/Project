package com.xworkz.landrecords.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "login_info")
@Entity
@NamedQuery(name = "FindByEmail", query = "select dto from AdminDto dto where dto.email=:em")
@NamedQuery(name = "updateOtpByEmail", query = "update AdminDto dto set dto.otp=:otp where dto.email=:email")
@NamedQuery(name = "findByOtp", query = "select dto from AdminDto dto where dto.otp=:otp")
public class AdminDto {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String adminName;
	private String email;
	private String otp;

	public AdminDto() {
		super();
	}

	public AdminDto(Integer id, String adminName, String email, String otp) {
		super();
		this.id = id;
		this.adminName = adminName;
		this.email = email;
		this.otp = otp;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getAdminName() {
		return adminName;
	}
	
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOtp() {
		return otp;
	}

	public void setOtp(String otp) {
		this.otp = otp;
	}

	@Override
	public String toString() {
		return "AdminDto [id=" + id + ", adminName=" + adminName + ", email=" + email + ", otp=" + otp + "]";
	}

}
