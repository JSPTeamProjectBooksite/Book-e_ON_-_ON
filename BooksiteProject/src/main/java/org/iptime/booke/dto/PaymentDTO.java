package org.iptime.booke.dto;

import java.time.LocalDateTime;

public class PaymentDTO {
	private String id;
	private Long memberId;
	private Integer totalAmount;
	private Integer pointAmount;
	private Integer actualAmount;
	private String shippingState;
	private String paymentMethod;
	private String shippingMessage;
	private LocalDateTime registerDate;
	
	
	public PaymentDTO() {}
	
	public PaymentDTO(String id, Long memberId, Integer totalAmount, Integer pointAmount,
			Integer actualAmount, String shippingState, String paymentMethod, String shippingMessage,
			LocalDateTime registerDate) {
		this.id = id;
		this.memberId = memberId;
		this.totalAmount = totalAmount;
		this.pointAmount = pointAmount;
		this.actualAmount = actualAmount;
		this.shippingState = shippingState;
		this.paymentMethod = paymentMethod;
		this.shippingMessage = shippingMessage;
		this.registerDate = registerDate;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public Integer getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Integer getPointAmount() {
		return pointAmount;
	}

	public void setPointAmount(Integer pointAmount) {
		this.pointAmount = pointAmount;
	}

	public Integer getActualAmount() {
		return actualAmount;
	}

	public void setActualAmount(Integer actualAmount) {
		this.actualAmount = actualAmount;
	}

	public String getShippingState() {
		return shippingState;
	}

	public void setShippingState(String shippingState) {
		this.shippingState = shippingState;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getShippingMessage() {
		return shippingMessage;
	}

	public void setShippingMessage(String shippingMessage) {
		this.shippingMessage = shippingMessage;
	}

	public LocalDateTime getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(LocalDateTime registerDate) {
		this.registerDate = registerDate;
	}
}
