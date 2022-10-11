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
	
	//기본생성자
	public AuthorDTO() {}
	
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
	
	//메서드(개발단계의 편의성을 위해 만듬 나중에 제거 할 것!!)
	//dto 객체에 저장된 값을 모두 출력하는 메소드(dto 확인용)
	public void printOut() {
		System.out.println("[ 작가 DTO 저장 내용 ]");
		System.out.println("memberId \t: " + memberId);
		System.out.println("profileImg \t: " + profileImg);
		System.out.println("name \t\t: " + name);
		System.out.println("nationality \t: " + nationality);
		System.out.println("profileContents : " + profileContents);
		System.out.println("registerDate \t: " + registerDate);
		System.out.println("updateDate \t: " + updateDate);
	}
	
	//캡슐화
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
