package org.iptime.booke.dto;

import java.time.LocalDateTime;

public class InquiryDTO {
	private Long id;
	private Long memberId;
	private String title;
	private String content;
	private String categroy;
	private LocalDateTime rigisterDate;

	
	public InquiryDTO() {}
	
	public InquiryDTO(Long id, Long memberId, String title, String content, String categroy,
			LocalDateTime rigisterDate) {
		this.id = id;
		this.memberId = memberId;
		this.title = title;
		this.content = content;
		this.categroy = categroy;
		this.rigisterDate = rigisterDate;
	}
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getMemberId() {
		return memberId;
	}
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
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
	public String getCategroy() {
		return categroy;
	}
	public void setCategroy(String categroy) {
		this.categroy = categroy;
	}
	public LocalDateTime getRigisterDate() {
		return rigisterDate;
	}
	public void setRigisterDate(LocalDateTime rigisterDate) {
		this.rigisterDate = rigisterDate;
	}
}
