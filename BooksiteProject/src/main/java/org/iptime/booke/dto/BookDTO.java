package org.iptime.booke.dto;

public class BookDTO{
	int BID;


	String title;
	String image;
	String author;
	String publisher;
	int price;
	String ad;
	String introduce;
	
	// 장바구니페이지
	String img;
	int money; // <- title로 바꾸죠
	int deliveryTime;
//	String name; 

	// 결제페이지 
	String name;
	String adress;
		
	
	public BookDTO( int BID, String title, String image, String author, String publisher, int price, String ad, String introduce) {
		this.BID = BID;
		this.title = title;
		this.image = image;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.ad = ad;
		this.introduce = introduce;
	}
	
	// 장바구니페이지 
	public BookDTO(String img, String title, int money, int deliveryTime) {
		super();
		this.img = img;
		this.title = title;
		this.money = money;
		this.deliveryTime = deliveryTime;
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
	
	
	public String getImg() {
		return img;
	}
	
	
	public void setImg(String img) {
		this.img = img;
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
	
	
	public String getName() {
		return name;
	}
	
	
	public void setName(String name) {
		this.name = name;
	}
	
	
	public String getAdress() {
		return adress;
	}
	
	
	public void setAdress(String adress) {
		this.adress = adress;
	}
}