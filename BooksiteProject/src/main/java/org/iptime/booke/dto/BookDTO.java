package org.iptime.booke.dto;

public class BookDTO {
	Long bid;
	String image;
	String title;
	String author;
	String translator;
	Long price;
	Long deliveryFee;
	Long estimatedDeliveryDate;
	Long total_pages;
	Long weight;
	Long isbn;
	String bookCategoryId;
	String introduce;
	String introduceImage;
	String publisher;
	String publisherReview;
	String contents;
	Long visit;
	String publicationDate;
	String registDate;
	String updateDate;
	String ad;

	
	//리스트 페이지
	public BookDTO(Long bid, String title, String image, String author, String publisher, Long price, String ad,
			String introduce) {
		this.bid = bid;
		this.title = title;
		this.image = image;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.ad = ad;
		this.introduce = introduce;
	}
	
	//리스트페이지 (슬라이드목록)
	public BookDTO(Long bid, String title, String image, String author, String ad) {
		this.bid = bid;
		this.title = title;
		this.image = image;
		this.author = author;
		this.ad = ad;
	}

	// 장바구니페이지
	public BookDTO(String image, String title, Long price, Long estimatedDeliveryDate) {
		super();
		this.image = image;
		this.title = title;
		this.price = price;
		this.estimatedDeliveryDate = estimatedDeliveryDate;
	}

	public BookDTO(String image, String title, Long price) {
		this.image = image;
		this.title = title;
		this.price = price;
	
	}

	public Long getBid() {
		return bid;
	}

	public void setBid(Long bid) {
		this.bid = bid;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTranslator() {
		return translator;
	}

	public void setTranslator(String translator) {
		this.translator = translator;
	}

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	public Long getDeliveryFee() {
		return deliveryFee;
	}

	public void setDeliveryFee(Long deliveryFee) {
		this.deliveryFee = deliveryFee;
	}

	public Long getEstimatedDeliveryDate() {
		return estimatedDeliveryDate;
	}

	public void setEstimatedDeliveryDate(Long estimatedDeliveryDate) {
		this.estimatedDeliveryDate = estimatedDeliveryDate;
	}

	public Long getTotal_pages() {
		return total_pages;
	}

	public void setTotal_pages(Long total_pages) {
		this.total_pages = total_pages;
	}

	public Long getWeight() {
		return weight;
	}

	public void setWeight(Long weight) {
		this.weight = weight;
	}

	public Long getIsbn() {
		return isbn;
	}

	public void setIsbn(Long isbn) {
		this.isbn = isbn;
	}

	public String getBookCategoryId() {
		return bookCategoryId;
	}

	public void setBookCategoryId(String bookCategoryId) {
		this.bookCategoryId = bookCategoryId;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getIntroduceImage() {
		return introduceImage;
	}

	public void setIntroduceImage(String introduceImage) {
		this.introduceImage = introduceImage;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getPublisherReview() {
		return publisherReview;
	}

	public void setPublisherReview(String publisherReview) {
		this.publisherReview = publisherReview;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Long getVisit() {
		return visit;
	}

	public void setVisit(Long visit) {
		this.visit = visit;
	}

	public String getPublicationDate() {
		return publicationDate;
	}

	public void setPublicationDate(String publicationDate) {
		this.publicationDate = publicationDate;
	}

	public String getRegistDate() {
		return registDate;
	}

	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getAd() {
		return ad;
	}

	public void setAd(String ad) {
		this.ad = ad;
	}
	
	
}