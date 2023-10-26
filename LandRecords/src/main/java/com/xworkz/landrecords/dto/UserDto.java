package com.xworkz.landrecords.dto;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Table(name = "user_registration")
@NamedQuery(name = "IfExist", query = "select dto from UserDto dto where dto.email=:email and dto.password=:password")
@NamedQuery(name="pwdExists",query="select dto from UserDto dto where dto.password=:ps ")
@NamedQuery(name="mailExists",query="select dto from UserDto dto where dto.email=:em ")
 
@NamedQuery(name = "updatingotp" , query = " update UserDto dto set dto.otp =: ot where dto.email=:em")
@NamedQuery(name = "findotp" , query = "select dto from UserDto dto where dto.otp=:ot")
@NamedQuery(name = "updatingpwd" , query = " update UserDto dto set dto.password =: pd ,dto.confirmPassword=:cpd  where dto.email=:em")
public class UserDto implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@NotBlank
	@NotEmpty
	@Size(min = 4, max = 30, message = "Check the Your Name")
	private String name;
	@NotBlank
	@NotEmpty
	@Email(message = "Check your Email Id")
	private String email;
	private Long mobileNumber;
	@NotBlank
	@NotEmpty
	@Size(min = 12, max = 12, message = "Adhar Number is not valid")
	private String aadharNumber;
	@NotBlank
	@NotEmpty
	@Size(min = 8, max = 15, message = "Give Strong Password")
	private String password;
	@NotBlank
	@NotEmpty
	@Size(min = 8, max = 15, message = "Check your Password")
	private String confirmPassword;
	private String otp =null;

}
