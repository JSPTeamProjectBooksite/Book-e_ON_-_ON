package org.iptime.booke.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.InquiryDAO;
import org.iptime.booke.dto.InquiryDTO;

@WebServlet("/UserInquiryWrite.do")
/* inquiryWrite.do */
public class InquiryWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InquiryWriteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿 호출");
		
		request.setCharacterEncoding("UTF-8");
		
		String inquireTitle = request.getParameter("title");
		String inquireContent = request.getParameter("content");
		String inquireCategory = request.getParameter("category");
		
		System.out.println(inquireTitle);
		System.out.println(inquireContent);
		System.out.println(inquireCategory);

		InquiryDTO inquiryDTO = new InquiryDTO();
		inquiryDTO.setTitle(inquireTitle);
		inquiryDTO.setContent(inquireContent);
		inquiryDTO.setCategroy(inquireCategory);

		InquiryDAO dao = new InquiryDAO();
		int iResult = dao.InquireRegister(inquiryDTO);
		dao.close();

		if (iResult == 1) {
			System.out.println("등록 성공");
			response.sendRedirect("./main");
			return;
		}
		System.out.println("등록 실패");
//		resp.sendRedirect("./WriteInquiry");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
