package org.iptime.booke.dto;

public class BookDTO{
	String bookImg;
	String title;
	int money;
	int deliveryTime;
	
	public BookDTO(String bookImg, String title, int money, int deliveryTime) {
		super();
		this.bookImg = bookImg;
		this.title = title;
		this.money = money;
		this.deliveryTime = deliveryTime;
	}

	public String getBookImg() {
		return bookImg;
	}

	public void setBookImg(String bookImg) {
		this.bookImg = bookImg;
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
}