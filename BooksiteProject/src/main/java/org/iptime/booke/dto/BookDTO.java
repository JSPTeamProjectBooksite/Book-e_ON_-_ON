package org.iptime.booke.dto;

public class BookDTO {
	int BID;

	String title;
	String image;
	String author;
	String publisher;
	int price;
	String ad;
	String introduce;

	// 장바구니페이지
	int deliveryTime;

	
	//리스트 페이지
	public BookDTO(int BID, String title, String image, String author, String publisher, int price, String ad,
			String introduce) {
		this.BID = BID;
		this.title = title;
		this.image = image;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.ad = ad;
		this.introduce = introduce;
	}
	
	//리스트페이지 (슬라이드목록)
	public BookDTO(int BID, String title, String image, String author, String ad) {
		this.BID = BID;
		this.title = title;
		this.image = image;
		this.author = author;
		this.ad = ad;
	}

	// 장바구니페이지
	public BookDTO(String image, String title, int price, int deliveryTime) {
		super();
		this.image = image;
		this.title = title;
		this.price = price;
		this.deliveryTime = deliveryTime;
	}

	public BookDTO(String image, String title, int price) {
	
		this.image = image;
		this.title = title;
		this.price = price;
	
	}

	public int getBID() {
		return BID;
	}

	public void setBID(int bID) {
		BID = bID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getAd() {
		return ad;
	}

	public void setAd(String ad) {
		this.ad = ad;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public int getDeliveryTime() {
		return deliveryTime;
	}

	public void setDeliveryTime(int deliveryTime) {
		this.deliveryTime = deliveryTime;
	}
}