package org.iptime.booke.dto;

import java.time.LocalDateTime;

public class OrderDTO {
	private Long id;
	private String paymentId;
	private Long bookId;
	private Integer quantity;
	private LocalDateTime registerDate;
	
	
	public OrderDTO() {}

	public OrderDTO(Long id, String paymentId, Long bookId, Integer quantity, LocalDateTime registerDate) {
		this.id = id;
		this.paymentId = paymentId;
		this.bookId = bookId;
		this.quantity = quantity;
		this.registerDate = registerDate;
	}
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	public Long getBookId() {
		return bookId;
	}

	public void setBookId(Long bookId) {
		this.bookId = bookId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public LocalDateTime getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(LocalDateTime registerDate) {
		this.registerDate = registerDate;
	}
}
