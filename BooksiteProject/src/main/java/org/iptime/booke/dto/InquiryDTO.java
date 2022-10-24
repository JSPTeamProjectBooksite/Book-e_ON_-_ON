package org.iptime.booke.dto;

import java.time.LocalDateTime;

public class InquiryDTO {
	private Long id;
	private Long memberId;
	private String title;
	private String mContent;
	private String aContent;
	private String reply;

	private String categroy;
	private String state;
	private LocalDateTime rigisterDate;

	
	public InquiryDTO() {}


	public InquiryDTO(Long id, Long memberId, String title, String mContent, String aContent, String reply,
			String categroy, String state, LocalDateTime rigisterDate) {
		super();
		this.id = id;
		this.memberId = memberId;
		this.title = title;
		this.mContent = mContent;
		this.aContent = aContent;
		this.reply = reply;
		this.categroy = categroy;
		this.state = state;
		this.rigisterDate = rigisterDate;
	}
	
	// 관리자 전용 문의 페이지 호환용
	public InquiryDTO(Long id, Long memberId, String title, String mContent, String reply,
			String categroy, String state, LocalDateTime rigisterDate) {
		super();
		this.id = id;
		this.memberId = memberId;
		this.title = title;
		this.mContent = mContent;
		this.reply = reply;
		this.categroy = categroy;
		this.state = state;
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


	public String getmContent() {
		return mContent;
	}


	public void setmContent(String mContent) {
		this.mContent = mContent;
	}


	public String getaContent() {
		return aContent;
	}


	public void setaContent(String aContent) {
		this.aContent = aContent;
	}


	public String getReply() {
		return reply;
	}


	public void setReply(String reply) {
		this.reply = reply;
	}


	public String getCategroy() {
		return categroy;
	}


	public void setCategroy(String categroy) {
		this.categroy = categroy;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public LocalDateTime getRigisterDate() {
		return rigisterDate;
	}


	public void setRigisterDate(LocalDateTime rigisterDate) {
		this.rigisterDate = rigisterDate;
	}
}
