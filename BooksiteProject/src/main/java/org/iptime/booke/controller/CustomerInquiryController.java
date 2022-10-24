package org.iptime.booke.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iptime.booke.dao.InquiryDAO;
import org.iptime.booke.dao.MemberDAO;
import org.iptime.booke.dto.InquiryDTO;
import org.iptime.booke.dto.MemberDTO;
import org.iptime.booke.utils.LocalDateABC;

@WebServlet("/customerinquiry")
public class CustomerInquiryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CustomerInquiryController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Long UserId = (Long) session.getAttribute("LoginID"); // memberId

		System.out.println("문의페이지 로그인 유저 : " + UserId);

		// 유저

		MemberDAO memberDao = new MemberDAO();
		MemberDTO member = memberDao.userInfo(UserId);
		memberDao.close();

		request.setAttribute("delinfo", member);
		request.getRequestDispatcher("UserInquiryWrite.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
