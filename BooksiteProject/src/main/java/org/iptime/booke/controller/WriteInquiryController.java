package org.iptime.booke.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.InquiryDAO;
import org.iptime.booke.dto.InquiryDTO;

@WebServlet("/writeInquiry")
public class WriteInquiryController {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("서블릿 호출");
		
		String inquireTitle = req.getParameter("title");
		String inquireContent = req.getParameter("content");
		String inquireCategory = req.getParameter("category");

		InquiryDTO inquiryDTO = new InquiryDTO();
		inquiryDTO.setTitle(inquireTitle);
		inquiryDTO.setContent(inquireContent);
		inquiryDTO.setcategory(inquireCategory);

		InquiryDAO dao = new InquiryDAO();
		int iResult = dao.InquireRegister(inquiryDTO);
		dao.close();

		if (iResult == 1) {
			System.out.println("등록 성공");
			resp.sendRedirect("./main");
			return;
		}
		System.out.println("등록 실패");
		resp.sendRedirect("./WriteInquiry");
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);

	}
}