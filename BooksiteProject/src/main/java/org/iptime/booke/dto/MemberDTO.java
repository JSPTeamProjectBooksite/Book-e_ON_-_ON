package org.iptime.booke.dto;

public class MemberDTO {
	private String name;
	private int gender;
	private String id;
	private String password;
	private int phoneNumber;
	private String address;
	
//	public MemberDTO(String id, String password) {
//		this.id = id;
//		this.password = password;
//	}

	public MemberDTO(String name, int gender, String id, String password, int phoneNumber, String address) {
		super();
		this.name = name;
		this.gender = gender;
		this.id = id;
		this.password = password;
		this.phoneNumber = phoneNumber;
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(int phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
