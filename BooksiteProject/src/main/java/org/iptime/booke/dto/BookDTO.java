package org.iptime.booke.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class BookDTO {
	private Long id;
	private String coverImg;//
	private String title;//
	private Long authorId;//
	private String translator;//
	private Integer price;//
	private Integer totalPages;//
	private Integer weight;//
	private String isbn13;//
	private String isbn10;//
	private Integer bookCategoryId;//
	private String introduce;//
	private String introduceImg;//
	private String publisher;//
	private String publisherReview;//
	private Integer deliveryFee;//
	private Integer estimatedDeliveryDate;
	private String contents;//
	private Integer visit;
	private Integer quantity;
	private String catchphrase;//
	private LocalDate publicationDate;//
	private LocalDateTime registDate;
	private LocalDateTime updateDate;
	
	/* dto 값 받을때 쓰는거 (복사해서 쓰세요.)
	
	BookDTO dto = new BookDTO();
	
	dto.setBid(rs.getLong(1));
	dto.setImage(rs.getString(2));
	dto.setTitle(rs.getString(3));
	dto.setAuthor(rs.getString(4));
	dto.setTranslator(rs.getString(5));
	dto.setPrice(rs.getLong(6));
	dto.setDeliveryFee(rs.getLong(7));
	dto.setEstimatedDeliveryDate(rs.getString(8));
	dto.setTotal_pages(rs.getLong(9));
	dto.setWeight(rs.getLong(10));
	dto.setIsbn(rs.getLong(11));
	dto.setBookCategoryId(rs.getString(12));
	dto.setIntroduce(rs.getString(13));
	dto.setIntroduceImage(rs.getString(14));
	dto.setPublisher(rs.getString(15));
	dto.setPublisherReview(rs.getString(16));
	dto.setContents(rs.getString(17));
	dto.setVisit(rs.getLong(18));
	dto.setPublicationDate(rs.getString(19));
	dto.setRegistDate(rs.getString(20));
	dto.setUpdateDate(rs.getString(21));
	dto.setAd(rs.getString(22));
	
	return dto;
	
	*/

	public BookDTO() {}
	
	public void DTOPrintOut() {
		System.out.println("id : " + id);
		System.out.println("coverImg : " + coverImg);
		System.out.println("title : " + title);
		System.out.println("authorId : " + authorId);
		System.out.println("translator : " + translator);
		System.out.println("price : " + price);
		System.out.println("totalPages : " + totalPages);
		System.out.println("weight : " + weight);
		System.out.println("isbn13 : " + isbn13);
		System.out.println("isbn10 : " + isbn10);
		System.out.println("bookCategoryId : " + bookCategoryId);
		System.out.println("introduce : " + introduce);
		System.out.println("introduceImg : " + introduceImg);
		System.out.println("publisher : " + publisher);
		System.out.println("publisherReview : " + publisherReview);
		System.out.println("deliveryFee : " + deliveryFee);
		System.out.println("estimatedDeliveryDate : " + estimatedDeliveryDate);
		System.out.println("contents : " + contents);
		System.out.println("visit : " + visit);
		System.out.println("quantity : " + quantity);
		System.out.println("catchphrase : " + catchphrase);
		System.out.println("publicationDate : " + publicationDate);
		System.out.println("registDate : " + registDate);
		System.out.println("updateDate : " + updateDate);
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
	
	//매니저 책 정보
	public BookDTO(Long id, String coverImg, String title, Long authorId, String translator, Integer price,
			Integer totalPages, Integer weight, String isbn13, String isbn10, Integer bookCategoryId, String introduce,
			String introduceImg, String publisher, String publisherReview, Integer deliveryFee,
			Integer estimatedDeliveryDate, String contents, Integer visit, Integer quantity, String catchphrase,
			LocalDate publicationDate, LocalDateTime registDate, LocalDateTime updateDate) {
		super();
		this.id = id;
		this.coverImg = coverImg;
		this.title = title;
		this.authorId = authorId;
		this.translator = translator;
		this.price = price;
		this.totalPages = totalPages;
		this.weight = weight;
		this.isbn13 = isbn13;
		this.isbn10 = isbn10;
		this.bookCategoryId = bookCategoryId;
		this.introduce = introduce;
		this.introduceImg = introduceImg;
		this.publisher = publisher;
		this.publisherReview = publisherReview;
		this.deliveryFee = deliveryFee;
		this.estimatedDeliveryDate = estimatedDeliveryDate;
		this.contents = contents;
		this.visit = visit;
		this.quantity = quantity;
		this.catchphrase = catchphrase;
		this.publicationDate = publicationDate;
		this.registDate = registDate;
		this.updateDate = updateDate;
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

	public String getIsbn13() {
		return isbn13;
	}

	public void setIsbn13(String isbn13) {
		this.isbn13 = isbn13;
	}

	public String getIsbn10() {
		return isbn10;
	}

	public void setIsbn10(String isbn10) {
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

	public LocalDate getPublicationDate() {
		return publicationDate;
	}

	public void setPublicationDate(LocalDate publicationDate) {
		this.publicationDate = publicationDate;
	}

	public LocalDateTime getRegistDate() {
		return registDate;
	}

	public void setRegistDate(LocalDateTime registDate) {
		this.registDate = registDate;
	}

	public LocalDateTime getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(LocalDateTime updateDate) {
		this.updateDate = updateDate;
	}
}