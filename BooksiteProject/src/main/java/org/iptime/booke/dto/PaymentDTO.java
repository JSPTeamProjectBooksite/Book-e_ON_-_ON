package org.iptime.booke.dto;

public class BookDTO {
	String name;
	String phoneNumber;
	String email;
	String address;
	Long price;
	int orderQuantity;
	String kind;

	public BookDTO() {
	}

	public BookDTO(String image, String title, Long price, int orderQuantity, String kind) {
		this.image = image;
		this.title = title;
		this.price = price;
		this.orderQuantity = orderQuantity;
		this.kind = kind;
		

	}
}