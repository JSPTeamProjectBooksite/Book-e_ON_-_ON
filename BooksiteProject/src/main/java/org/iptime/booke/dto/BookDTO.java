package org.iptime.booke.dto;

public class BookDTO {
	Long bid;
	String image;
	String title;
	String author;
	String translator;
	Long price;
	Long deliveryFee;
	String estimatedDeliveryDate;
	Long totalPages;
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
	
	//선택수량
	int select; //DB에 없으나, DTO의 인스턴스로 존재
	
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
	
	public int getSelect() {
		return select;
	}

	public void setSelect(int select) {
		this.select = select;
	}

	// 장바구니 수량 22
	Integer count;

	public BookDTO() {}
	
	public void DTOPrintOut() {
		System.out.println(bid);
		System.out.println(image);
		System.out.println(title);
		System.out.println(author);
		System.out.println(translator);
		System.out.println(price);
		System.out.println(deliveryFee);
		System.out.println(estimatedDeliveryDate);
		System.out.println(totalPages);
		System.out.println(weight);
		System.out.println(isbn);
		System.out.println(bookCategoryId);
		System.out.println(introduce);
		System.out.println(introduceImage);
		System.out.println(publisher);
		System.out.println(publisherReview);
		System.out.println(contents);
		System.out.println(visit);
		System.out.println(publicationDate);
		System.out.println(registDate);
		System.out.println(updateDate);
		System.out.println(ad);
	}
	
	//결제페이지 사용
	public void DTOPrintOut2() {
		System.out.println(bid);
		System.out.println(image);
		System.out.println(title);
		System.out.println(price);
		System.out.println(bookCategoryId);
		System.out.println(select);
	}
	
	
	
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
	public BookDTO(String image, String title, Long price, String estimatedDeliveryDate) {
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

	public String getEstimatedDeliveryDate() {
		return estimatedDeliveryDate;
	}

	public void setEstimatedDeliveryDate(String estimatedDeliveryDate) {
		this.estimatedDeliveryDate = estimatedDeliveryDate;
	}

	public Long getTotal_pages() {
		return totalPages;
	}

	public void setTotal_pages(Long totalPages) {
		this.totalPages = totalPages;
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

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
	
	
}