package org.iptime.booke.dto;

public class BookCategoryDTO {
	Long id;
	String name;
	Long parentCategoryId;
	
	public BookCategoryDTO(Long id, String name, Long parentCategoryId) {
		this.id = id;
		this.name = name;
		this.parentCategoryId = parentCategoryId;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getParentCategoryId() {
		return parentCategoryId;
	}
	public void setParentCategoryId(Long parentCategoryId) {
		this.parentCategoryId = parentCategoryId;
	}
	
}