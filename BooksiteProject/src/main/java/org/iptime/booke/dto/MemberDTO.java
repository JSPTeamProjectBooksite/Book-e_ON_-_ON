package org.iptime.booke.dto;

import java.sql.Date;

public class MemberDTO {
	private Long id;
	private String name;
	private String gender;
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

		public MemberDTO(String name, String email, String phoneNum, String address) {
			this.name = name;
			this.email = email;
			this.phoneNum = phoneNum;
			this.address = address;
		}
	
	public MemberDTO(String name, String gender, String password, String phoneNum, String address, String email,
			Date birth) {
		super();
		this.name = name;
		this.gender = gender;
		this.password = password;
		this.phoneNum = phoneNum;
		this.address = address;
		this.email = email;
		this.birth = birth;
	}

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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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