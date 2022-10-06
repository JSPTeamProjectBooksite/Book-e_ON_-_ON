package org.iptime.booke.dto;

import java.util.Date;

public class AuthorDTO {
	private Long memberId;
	private String profileImg;
	private String name;
	private String nationality;
	private String profileContents;
	private Date registerDate;
	private Date updateDate;
	
	
	public AuthorDTO(Long memberId, String profileImg, String name, String nationality, String profileContents,
			Date registerDate, Date updateDate) {
		this.memberId = memberId;
		this.profileImg = profileImg;
		this.name = name;
		this.nationality = nationality;
		this.profileContents = profileContents;
		this.registerDate = registerDate;
		this.updateDate = updateDate;
	}
	
	public Long getMemberId() {
		return memberId;
	}
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getProfileContents() {
		return profileContents;
	}
	public void setProfileContents(String profileContents) {
		this.profileContents = profileContents;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
}
