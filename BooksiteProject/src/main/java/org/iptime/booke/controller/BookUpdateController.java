package org.iptime.booke.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.BookDAO;
import org.iptime.booke.dto.BookDTO;

@WebServlet("/BookUpdate.do")
public class BookUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BookUpdateController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String chooseBook = request.getParameter("chooseBook");
		Long id = Long.parseLong(chooseBook);
		
		
		String title = request.getParameter("title");
		String coverImgUrl = request.getParameter("coverImgUrl");
//		System.out.println("coverImgUrl : "+coverImgUrl);
		// String author = mr.getParameter("author");
		String authorId = request.getParameter("author");
		System.out.println("authorId : " + authorId);
		String translator = request.getParameter("translator");
		String price = request.getParameter("price");
		String quantity = request.getParameter("quantity");
//		System.out.println("price:"+price);
		String deliveryFee = request.getParameter("deliveryFee");
		String totalPages = request.getParameter("totalPages");
		String weight = request.getParameter("weight");
		String isbn13 = request.getParameter("isbn13");
		String isbn10 = request.getParameter("isbn10");
		String categoryId = request.getParameter("categoryId");
		String introduce = request.getParameter("introduce");
		String introduceImageUrl = request.getParameter("introduceImageUrl");
		String publisher = request.getParameter("publisher");
		String publisherReview = request.getParameter("publisherReview");
		String contents = request.getParameter("contents");
		String publicationDate = request.getParameter("publicationDate");
		String catchphrase = request.getParameter("catchphrase");

		try {

			BookDTO dto = new BookDTO();

			// dto.setId(rs.getLong(1));
			dto.setCoverImg(coverImgUrl);
			dto.setTitle(title);
			dto.setAuthorId(Long.parseLong(authorId));
			dto.setTranslator(translator);
			dto.setPrice(Integer.parseInt(price));
			dto.setQuantity(Integer.parseInt(quantity));
			dto.setDeliveryFee(Integer.parseInt(deliveryFee));
			
			if (totalPages != null && totalPages.length() > 0)
				dto.setTotalPages(Integer.parseInt(totalPages));
			if (weight != null && weight.length() > 0)
				dto.setWeight(Integer.parseInt(weight));
			if (isbn13 != null && isbn13.length() > 0)
				dto.setIsbn13(isbn13);
			if (isbn10 != null && isbn10.length() > 0)
				dto.setIsbn10(isbn10);
			if (categoryId != null && categoryId.length() > 0)
				dto.setBookCategoryId(Integer.parseInt(categoryId));
			dto.setIntroduce(introduce);
			dto.setIntroduceImg(introduceImageUrl);
			dto.setPublisher(publisher);
			dto.setPublisherReview(publisherReview);
			dto.setContents(contents);
			dto.setCatchphrase(catchphrase);
			// 안됨;;
			dto.setPublicationDate(LocalDate.parse(publicationDate, DateTimeFormatter.ofPattern("yyyy-MM-dd")));

			BookDAO dao = new BookDAO();
			dao.updateBook(dto,id);
			dao.close();

			request.getRequestDispatcher("/WindowClose.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("책 등록 오류");
			request.getRequestDispatcher("BookAddForm.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
