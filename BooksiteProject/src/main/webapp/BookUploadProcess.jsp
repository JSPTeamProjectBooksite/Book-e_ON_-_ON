<%@ page import="org.iptime.booke.dto.BookDTO" %>
<%@ page import="org.iptime.booke.dao.ManageBookAddDAO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String saveDirectory = ".";
int maxPostSize = 30 * 1024 * 1000; //파일최대크기 (30mb)
String encoding = "UTF-8";

try{
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	
	System.out.println(saveDirectory);
	String path = FileTest.class.getResource("").getPath(); // 현재 클래스의 절대 경로를 가져온다.
    System.out.println(path); 
	//System.out.println("맞나" + request.getContentType().indexOf("multipart/form-data"));
	
	String fileName = mr.getFilesystemName("coverImg");
	String newFileName = mr.getParameter("imageFileName") + ".png";
	
	File oldFile = new File(saveDirectory + File.separator + fileName);
	File newFile = new File(saveDirectory + File.separator + newFileName);
	oldFile.renameTo(newFile);
	
	String title = mr.getParameter("title");
	String imageFileName = mr.getParameter("imageFileName");
	String author = mr.getParameter("author");
	String translator = mr.getParameter("translator");
	String price = mr.getParameter("price");
	String deliveryFee = mr.getParameter("deliveryFee");
	String totalPages = mr.getParameter("totalPages");
	String weight = mr.getParameter("weight");
	String isbn13 = mr.getParameter("isbn13");
	String isbn10 = mr.getParameter("isbn10");
	String categoryId = mr.getParameter("categoryId");
	String introduce = mr.getParameter("introduce");
	String introduceImageUrl = mr.getParameter("introduceImageUrl");
	String publisher = mr.getParameter("publisher");
	String publisherReview = mr.getParameter("publisherReview");
	String contents = mr.getParameter("contents");
	String publicationDate = mr.getParameter("publicationDate");
	String updateDate = mr.getParameter("updateDate");
	String catchphrase = mr.getParameter("catchphrase");
	
	BookDTO dto = new BookDTO();
	
	//dto.setId(rs.getLong(1));
	dto.setCoverImg("./source/book/" + imageFileName + ".png");
	dto.setTitle(title);
	dto.setAuthorId(123132L);
	dto.setTranslator(translator);
	dto.setPrice(Integer.parseInt(price));
	dto.setDeliveryFee(Integer.parseInt(deliveryFee));
	dto.setTotalPages(Integer.parseInt(totalPages));
	dto.setWeight(Integer.parseInt(weight));
	dto.setIsbn13(Long.parseLong(isbn13));
	dto.setIsbn10(Long.parseLong(isbn10));
	dto.setBookCategoryId(Integer.parseInt(categoryId));
	dto.setIntroduce(introduce);
	dto.setIntroduceImg(introduceImageUrl);
	dto.setPublisher(publisher);
	dto.setPublisherReview(publisherReview);
	dto.setContents(contents);
	dto.setCatchphrase(catchphrase);
	//dto.setPublicationDate(publicationDate);
	//dto.setUpdateDate(updateDate);
	
	dto.DTOPrintOut();
	
	System.out.println(publicationDate);
	
}catch(Exception e){
	e.printStackTrace();
	System.out.println("책 등록 오류");
	
	request.setAttribute("errorMessage", "책등록오류");
	request.getRequestDispatcher("BookAddForm.jsp").forward(request, response);
}
%>