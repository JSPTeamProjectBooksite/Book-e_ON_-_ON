package org.iptime.booke.dto;

import java.util.Date;

public class PostDTO {
	private String category;
	private String title;
	private Date date;
	
	public PostDTO(String category, String title, Date date) {
		this.category = category;
		this.title = title;
		this.date = date;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
}
