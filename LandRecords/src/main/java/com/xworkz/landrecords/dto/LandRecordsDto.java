package com.xworkz.landrecords.dto;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
public class LandRecordsDto implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@NotBlank
	@NotEmpty
	@Size(min = 5, max = 30, message = "Check the OwnerName")
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
	private Integer hissaNumber;
	private Integer surveyNumber;
	@NotBlank
	@NotEmpty
	@Size(min = 0, max = 10, message = "Year is not valid")
	private String year;

}
