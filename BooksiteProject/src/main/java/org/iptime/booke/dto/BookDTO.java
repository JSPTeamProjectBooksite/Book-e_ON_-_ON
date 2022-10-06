package org.iptime.booke.dto;

import java.util.Date;

public class BookDTO {
	private Long id;
	private String coverImg;
	private String title;
	private Long authorId;
	private String translator;
	private Integer price;
	private Integer deliveryFee;
	private Integer estimatedDeliveryDate;
	private Integer totalPages;
	private Integer weight;
	private Long isbn13;
	private Long isbn10;
	private Integer bookCategoryId;
	private String introduce;
	private String introduceImg;
	private String publisher;
	private String publisherReview;
	private String contents;
	private Integer visit;
	private Integer quantity;
	private String catchphrase;
	private Date publicationDate;
	private Date registDate;
	private Date updateDate;
	
	/* dto 값 받을때 쓰는거 (복사해서 쓰세요.)
	
	return dto;
	
	*/

	public BookDTO() {}
	
	public void DTOPrintOut() {
		System.out.println(id);
		System.out.println(coverImg);
		System.out.println(title);
		System.out.println(authorId);
		System.out.println(translator);
		System.out.println(price);
		System.out.println(deliveryFee);
		System.out.println(isbn13);
		System.out.println(isbn10);
		System.out.println(bookCategoryId);
		System.out.println(introduce);
		System.out.println(introduceImg);
		System.out.println(publisher);
		System.out.println(publisherReview);
		System.out.println(contents);
		System.out.println(visit);
		System.out.println(quantity);
		System.out.println(catchphrase);
		System.out.println(publicationDate);
		System.out.println(registDate);
		System.out.println(updateDate);
	}
	
	//결제페이지 사용
	public void DTOPrintOut2() {
		System.out.println(id);
		System.out.println(coverImg);
		System.out.println(title);
		System.out.println(price);
		System.out.println(bookCategoryId);
		System.out.println(quantity);
	}
	
	
	
	//리스트 페이지
	public BookDTO(Long id, String title, String coverImg, Long authorId, String publisher, Integer price, String catchphrase,
			String introduce) {
		this.id = id;
		this.title = title;
		this.coverImg = coverImg;
		this.authorId = authorId;
		this.publisher = publisher;
		this.price = price;
		this.catchphrase = catchphrase;
		this.introduce = introduce;
	}
	
	//리스트페이지 (슬라이드목록)
	public BookDTO(Long id, String title, String coverImg, Long authorId, String catchphrase) {
		this.id = id;
		this.title = title;
		this.coverImg = coverImg;
		this.authorId = authorId;
		this.catchphrase = catchphrase;
	}

	// 장바구니페이지
	public BookDTO(String coverImg, String title, Integer price, Integer estimatedDeliveryDate) {
		this.coverImg = coverImg;
		this.title = title;
		this.price = price;
		this.estimatedDeliveryDate = estimatedDeliveryDate;
	}

	public BookDTO(String coverImg, String title, Integer price) {
		this.coverImg = coverImg;
		this.title = title;
		this.price = price;
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

	public Long getAuthorId() {
		return authorId;
	}

	public void setAuthorId(Long authorId) {
		this.authorId = authorId;
	}

	public String getTranslator() {
		return translator;
	}

	public void setTranslator(String translator) {
		this.translator = translator;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getDeliveryFee() {
		return deliveryFee;
	}

	public void setDeliveryFee(Integer deliveryFee) {
		this.deliveryFee = deliveryFee;
	}

	public Integer getEstimatedDeliveryDate() {
		return estimatedDeliveryDate;
	}

	public void setEstimatedDeliveryDate(Integer estimatedDeliveryDate) {
		this.estimatedDeliveryDate = estimatedDeliveryDate;
	}

	public Integer getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(Integer totalPages) {
		this.totalPages = totalPages;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public Long getIsbn13() {
		return isbn13;
	}

	public void setIsbn13(Long isbn13) {
		this.isbn13 = isbn13;
	}

	public Long getIsbn10() {
		return isbn10;
	}

	public void setIsbn10(Long isbn10) {
		this.isbn10 = isbn10;
	}

	public Integer getBookCategoryId() {
		return bookCategoryId;
	}

	public void setBookCategoryId(Integer bookCategoryId) {
		this.bookCategoryId = bookCategoryId;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getIntroduceImg() {
		return introduceImg;
	}

	public void setIntroduceImg(String introduceImg) {
		this.introduceImg = introduceImg;
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

	public Integer getVisit() {
		return visit;
	}

	public void setVisit(Integer visit) {
		this.visit = visit;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getCatchphrase() {
		return catchphrase;
	}

	public void setCatchphrase(String catchphrase) {
		this.catchphrase = catchphrase;
	}

	public Date getPublicationDate() {
		return publicationDate;
	}

	public void setPublicationDate(Date publicationDate) {
		this.publicationDate = publicationDate;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
}