package org.iptime.booke.dto;

import java.util.Date;

public class CustomerInquiryDTO {
	private int id;
	private String name;
	private String memberId; //ID(이메일)
	private String phoneNum;
	private String title; // 문의제목
	private String content;
	private String category;// 문의유형
	private Date registerDate;
	
	public CustomerInquiryDTO(int id, String name, String memberId, String phoneNum, String title, String content,
			String category, Date registerDate) {
		super();
		this.id = id;
		this.name = name;
		this.memberId = memberId;
		this.phoneNum = phoneNum;
		this.title = title;
		this.content = content;
		this.category = category;
		this.registerDate = registerDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	
	
	
	
}

