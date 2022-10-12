package org.iptime.booke.dto;

public class PaymentDTO {


	private Long id; //BID
	private String coverImg;
	private String title;
	private Integer price;
	private Integer bookCategoryId;
	private Integer quantity;
	//여기까지 책(prodinfo)정보
	
	private String name;
	private String phoneNum;
	private String address; //로그인ID
	private String email;
	private Integer point;
	//여기까지 주문자(delinfo)정보
	

	public PaymentDTO() {
	}
	
	//결제페이지_배송정보
	public PaymentDTO(String name, String phoneNum, String address, String email) {
		this.name = name;
		this.phoneNum = phoneNum;
		this.address = address;
		this.email = email;
	}
	
	public PaymentDTO(Long id, String coverImg, String title, Integer price, Integer bookCategoryId, Integer quantity) {
		this.id = id;
		this.coverImg = coverImg;
		this.title = title;
		this.price = price;
		this.bookCategoryId = bookCategoryId;
		this.quantity = quantity;
	}
	
	

	public PaymentDTO(Long id, String coverImg, String title, Integer price, Integer bookCategoryId, Integer quantity,
			String name, String phoneNum, String address, String email, Integer point) {
		super();
		this.id = id;
		this.coverImg = coverImg;
		this.title = title;
		this.price = price;
		this.bookCategoryId = bookCategoryId;
		this.quantity = quantity;
		this.name = name;
		this.phoneNum = phoneNum;
		this.address = address;
		this.email = email;
		this.point = point;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCoverImg() {
		return coverImg;
	}

	public void setCoverImg(String coverImg) {
		this.coverImg = coverImg;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getBookCategoryId() {
		return bookCategoryId;
	}

	public void setBookCategoryId(Integer bookCategoryId) {
		this.bookCategoryId = bookCategoryId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}	
}
