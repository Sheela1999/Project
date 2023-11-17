package com.xworkz.landrecords.dto;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
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
@Getter
@Setter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "landrecords")
@NamedQuery(name = "findByHobliAndVillage", query = "select dto from LandRecordsDto dto where dto.hobli=:hobli and dto.village=:village and dto.status=true")
@NamedQuery(name = "readAll", query = "select dto from LandRecordsDto dto")
@NamedQuery(name = "Edit", query = "update LandRecordsDto dto set dto.ownerName=:on ,dto.mobileNumber=:pn ,dto.aadharNumber =:an "
		+ "where dto.hissaNumber=:hn and dto.surveyNumber=:sn and dto.status=true")
@NamedQuery(name = "updateStatus", query = "update LandRecordsDto dto set dto.status=false where hissaNumber =:hissa and surveyNumber =:survey")
@NamedQuery(name = "ifExist", query = "select dto from LandRecordsDto dto where dto.hissaNumber=:hn and dto.surveyNumber=:sn and dto.status=true")
public class LandRecordsDto implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@NotBlank
	@NotEmpty
	@Size(min = 4, max = 30, message = "Check the OwnerName")
	private String ownerName;
	private Long mobileNumber;
	@NotBlank
	@NotEmpty
	@Size(min = 12, max = 12, message = "Adhar Number is not valid")
	private String aadharNumber;
	@NotBlank
	@NotEmpty
	@Size(min = 5, max = 30, message = "State is not valid")
	private String state;
	@NotBlank
	@NotEmpty
	@Size(min = 5, max = 30, message = "District is not valid")
	private String district;
	@NotBlank
	@NotEmpty
	@Size(min = 5, max = 30, message = "Taluk is not valid")
	private String taluk;
	@NotBlank
	@NotEmpty
	@Size(min = 5, max = 30, message = "Hobli is not valid")
	private String hobli;
	@NotBlank
	@NotEmpty
	@Size(min = 5, max = 30, message = "Village is not valid")
	private String village;
	@NotBlank
	@NotEmpty
	private String totalAcres;
	private Integer hissaNumber;
	private Integer surveyNumber;
	@NotBlank
	@NotEmpty
	@Size(min = 0, max = 10, message = "Year is not valid")
	private String year;
	private Boolean status = true; 
	private String ownerImagePath;

}
