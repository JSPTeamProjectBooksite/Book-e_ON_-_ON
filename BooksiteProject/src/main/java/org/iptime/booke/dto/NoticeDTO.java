package org.iptime.booke.dto;

import java.time.LocalDateTime;

public class NoticeDTO {
	private Long id;
	private Long memberId;
	private String title;
	private String category;
	private String content;
	private Long targetMemberId;
	private LocalDateTime registerDate;
	
	
	public NoticeDTO() {
	}
	public NoticeDTO(Long id, Long memberId, String title, String category, String content, Long targetMemberId, LocalDateTime registerDate) {
		this.id = id;
		this.memberId = memberId;
		this.title = title;
		this.category = category;
		this.content = content;
		this.targetMemberId = targetMemberId;
		this.registerDate = registerDate;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getTargetMemberId() {
		return targetMemberId;
	}

	public void setTargetMemberId(Long targetMemberId) {
		this.targetMemberId = targetMemberId;
	}

	public LocalDateTime getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(LocalDateTime registerDate) {
		this.registerDate = registerDate;
	}
}
