package org.iptime.booke.dto;

public class BookDTO{
	String img;
	String title;
	int money;
	int deliveryTime;
	
	public BookDTO(String img, String title, int money, int deliveryTime) {
		super();
		this.img = img;
		this.title = title;
		this.money = money;
		this.deliveryTime = deliveryTime;
	}

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
}