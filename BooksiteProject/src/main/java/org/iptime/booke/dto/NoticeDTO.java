package org.iptime.booke.dto;

import java.util.Date;

public class NoticeDTO {
	private Long id;
	private Long memberId;
	private String title;
	private String category;
	private String Content;
	private Date registerDate;
	
	
	public NoticeDTO(Long id, Long memberId, String title, String category, String content, Date registerDate) {
		this.id = id;
		this.memberId = memberId;
		this.title = title;
		this.category = category;
		Content = content;
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
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
}
