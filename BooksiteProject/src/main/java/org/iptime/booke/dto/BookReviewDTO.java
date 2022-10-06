package org.iptime.booke.dto;

import java.util.Date;

public class BookReviewDTO {
	private Long id;
	private Long memberId;
	private Long bookId;
	private Short score;
	private String content;
	private Integer likeCount;
	private Date registerDate;
	
	public BookReviewDTO(Long id, Long memberId, Long bookId, Short score, String content, Integer likeCount,
			Date registerDate) {
		this.id = id;
		this.memberId = memberId;
		this.bookId = bookId;
		this.score = score;
		this.content = content;
		this.likeCount = likeCount;
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

	public Long getBookId() {
		return bookId;
	}

	public void setBookId(Long bookId) {
		this.bookId = bookId;
	}

	public Short getScore() {
		return score;
	}

	public void setScore(Short score) {
		this.score = score;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	
}
