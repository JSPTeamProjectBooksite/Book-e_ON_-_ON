package org.iptime.booke.controller;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/UserInquiryDetailController")
public class UserInquiryDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserInquiryDetailController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Long UserId = (Long) session.getAttribute("LoginID"); // memberId
		Long id = Long.parseLong(request.getParameter("id"));

		System.out.println("나의 문의페이지 로그인 유저 : " + UserId);
		
		MemberDAO memberDao = new MemberDAO();
		MemberDTO member = memberDao.userInfo(UserId);
		memberDao.close(); //유저정보
		
		InquiryDAO idao = new InquiryDAO();
		InquiryDTO inquiryDetails = idao.Inqinfo(id);
		idao.close();
		
		request.setAttribute("userInfo", member);
		request.setAttribute("Inqinfo", inquiryDetails);
		
		request.getRequestDispatcher("/UserInquiryConfirm.jsp").forward(request, response);
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
