package org.iptime.booke.dto;

public class BookDTO {
	// 장바구니페이지
	String img;
	String title;
	int money; // <- title로 바꾸죠
	int deliveryTime;
//	String name; 

	// 결제페이지
	String name;
	String address;
	int orderQuantity;

	// 디테일페이지
	String ad;
	String author;

	// 장바구니페이지
	public BookDTO(String img, String title, int money, int deliveryTime) {
		this.img = img;
		this.title = title;
		this.money = money;
		this.deliveryTime = deliveryTime;
	}

	// 자기가 쓸 생성자 + getter, setter

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getDeliveryTime() {
		return deliveryTime;
	}

	public void setDeliveryTime(int deliveryTime) {
		this.deliveryTime = deliveryTime;
	}

	public BookDTO(String img, String title, int money, String name, String address, int orderQuantity) {
		super();
		this.img = img;
		this.title = title;
		this.money = money;
		this.name = name;
		this.address = address;
		this.orderQuantity = orderQuantity;

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public int getOrderQuantity() {
		return orderQuantity;
	}

	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}

	
}