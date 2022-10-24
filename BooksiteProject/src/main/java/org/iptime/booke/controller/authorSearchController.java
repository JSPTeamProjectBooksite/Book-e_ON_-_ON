package org.iptime.booke.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.AuthorDAO;
import org.iptime.booke.dto.AuthorDTO;

@WebServlet("/authorSearch")
public class authorSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public authorSearchController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String doWhat = request.getParameter("do");
		
		System.out.println(doWhat);
		
		if(doWhat.equals("authorSearchFrom")) {
			System.out.println("작가검색페이지 요청됨");
			request.getRequestDispatcher("/authorSearchForm.jsp").forward(request, response);
		}
		else if(doWhat.equals("searchAuthorName")) {
			System.out.println("작가 검색 요청됨");
			
			String authorName = request.getParameter("authorName");
			
			System.out.println("'" + authorName + "'을 검색합니다");
			
			List<AuthorDTO> authorList = null;
			
			if(authorName!=null) {
				AuthorDAO dao = new AuthorDAO();
				authorList = dao.findAuthor(authorName);
				dao.close();
			}
			
			request.setAttribute("authorList", authorList);
			request.getRequestDispatcher("/authorSearchForm.jsp").forward(request, response);
		}
		else if(doWhat.equals("authorForm")) {
			System.out.println("작가 추가 요청됨");
			
			AuthorDTO dto = new AuthorDTO();
			dto.setNationality("국적 미상");
			dto.setProfileContents("[소개글 없음]");
			
			
			request.setAttribute("author", dto);
			request.getRequestDispatcher("/authorForm.jsp").forward(request, response);
		}
		else if(doWhat.equals("addAuthor")) {
			System.out.println("작가정보를 입력받음");
			
			AuthorDTO dto = new AuthorDTO();
			dto.setName(request.getParameter("authorName"));
			dto.setProfileImg(request.getParameter("profileImg"));
			dto.setNationality(request.getParameter("nationality"));
			dto.setProfileContents(request.getParameter("profileContents").replace("\r\n", "<br>"));
			if(!request.getParameter("birth").equals(""))
				dto.setBirth(LocalDate.parse(request.getParameter("birth"), DateTimeFormatter.ofPattern("yyyy-MM-dd")));
			if(!request.getParameter("death").equals(""))
				dto.setDeath(LocalDate.parse(request.getParameter("death"), DateTimeFormatter.ofPattern("yyyy-MM-dd")));
			
			
			AuthorDAO dao = new AuthorDAO();
			if(dao.addAuthor(dto))
				System.out.println("작가등록완료");
			dao.close();
			
			
			request.getRequestDispatcher("/authorForm.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
