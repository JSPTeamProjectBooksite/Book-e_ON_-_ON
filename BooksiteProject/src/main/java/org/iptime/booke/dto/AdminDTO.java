package org.iptime.booke.dto;

import java.util.Date;

public class AdminDTO {
	private Long memberId;
	private String jobPosition;
	private Date registerDate;
	
	
	public AdminDTO(Long memberId, String jobPosition, Date registerDate) {
		super();
		this.memberId = memberId;
		this.jobPosition = jobPosition;
		this.registerDate = registerDate;
	}
	
	public Long getMemberId() {
		return memberId;
	}
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	public String getJobPosition() {
		return jobPosition;
	}
	public void setJobPosition(String jobPosition) {
		this.jobPosition = jobPosition;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	
}
