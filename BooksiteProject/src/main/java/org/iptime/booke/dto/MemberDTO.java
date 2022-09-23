package org.iptime.booke.dto;

public class MemberDTO {
	private String name;
	private int gender;
	private String id;
	private String password;
	private String phoneNumber;
	private String address;
	
	// 결제페이지
//	String name; // title 아니고 주문자 성명
//	String address;
	int orderQuantity;
	String email;
//	String phoneNumber;
	
	public MemberDTO() {
		
	}
	
	//결제페이지
	public MemberDTO(String name, String address, int orderQuantity, String email,
			String phoneNumber) {
		this.name = name;
		this.address = address;
		this.orderQuantity = orderQuantity;
		this.email = email;
		this.phoneNumber = phoneNumber;
	}
	
	public MemberDTO(String name,String id, String password, String phoneNumber, String address) {
		this.name = name;
		this.id = id;
		this.password = password;
		this.phoneNumber = phoneNumber;
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

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
