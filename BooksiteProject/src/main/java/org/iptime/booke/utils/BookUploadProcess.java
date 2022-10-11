package org.iptime.booke.utils;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.BookDAO;
import org.iptime.booke.dto.BookDTO;

import com.oreilly.servlet.MultipartRequest;


@WebServlet("/BookUploadProcess")
public class BookUploadProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BookUploadProcess() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String saveDirectory = "E:\\GitCloneRepository\\Book-e_ON_-_ON\\BooksiteProject\\src\\main\\webapp\\uploads";
		//String saveDirectory = "E:\\GitCloneRepository\\Book-e_ON_-_ON\\BooksiteProject\\src\\main\\webapp\\uploads";
		int maxPostSize = 30 * 1024 * 1000; //파일최대크기 (30mb)
		String encoding = "UTF-8";

		try{
			MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
			
			String fileName = mr.getFilesystemName("coverImg");
			String newFileName = mr.getParameter("imageFileName") + ".png";
			
			File oldFile = new File(saveDirectory + File.separator + fileName);
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);
			
			String title = mr.getParameter("title");
			String imageFileName = mr.getParameter("imageFileName");
			//String author = mr.getParameter("author");
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
			String catchphrase = mr.getParameter("catchphrase");
			
			BookDTO dto = new BookDTO();
			
			//dto.setId(rs.getLong(1));
			dto.setCoverImg("./uploads/" + imageFileName + ".png");
			dto.setTitle(title);
			dto.setAuthorId(1L);
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
			
			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
			
			dto.setPublicationDate(fm.parse(publicationDate));
			
			BookDAO dao = new BookDAO();
			dao.insertBook(dto);
			dao.close();
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("책 등록 오류");
			
			request.setAttribute("errorMessage", "책등록오류");
			request.getRequestDispatcher("BookAddForm.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
