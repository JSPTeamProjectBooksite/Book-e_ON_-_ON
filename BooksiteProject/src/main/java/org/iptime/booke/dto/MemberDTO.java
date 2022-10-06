package org.iptime.booke.dto;

import java.sql.Date;

public class MemberDTO {
	private Long id;
	private String name;
	private Short genderId;
	private String password;
	private String phoneNum;
	private String address;
	private String email;
	private Date birth;
	private Integer point;
	private Short memberStateId;
	private Date registerDate;
	
	public MemberDTO() {}
	
	//결제페이지
	
	public MemberDTO(String name, Long id, String phoneNum, String address) {
		this.name = name;
		this.id = id;
		this.phoneNum = phoneNum;
		this.address = address;
		
	}
	
	public MemberDTO(String name, Long id, String password, String phoneNum, String address) {
		this.name = name;
		this.id = id;
		this.password = password;
		this.phoneNum = phoneNum;
		this.address = address;
	}

//	public MemberDTO(String name, int gender, String id, String password, int phoneNumber, String address) {
//		super();
//		this.name = name;
//		this.gender = gender;
//		this.id = id;
//		this.password = password;
//		this.phoneNumber = phoneNumber;
//		this.address = address;
//	}
	
	public MemberDTO(String name, Long id) {
		this.name = name;
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Short getGenderId() {
		return genderId;
	}

	public void setGenderId(Short genderId) {
		this.genderId = genderId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	public Short getMemberStateId() {
		return memberStateId;
	}

	public void setMemberStateId(Short memberStateId) {
		this.memberStateId = memberStateId;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	
}