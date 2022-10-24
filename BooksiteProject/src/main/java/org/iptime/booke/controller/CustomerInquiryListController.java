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
import org.iptime.booke.dto.InquiryDTO;

@WebServlet("/customerinquiry/list")
public class CustomerInquiryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CustomerInquiryListController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Long id = (Long)session.getAttribute("LoginID");
		
		System.out.println("1:1문의리스트 요청 아이디 :" + id);
		
		List<InquiryDTO> cinquirylist = null;
		
		if(id != null) {
			InquiryDAO idao = new InquiryDAO();
			cinquirylist = idao.inquiryinfo(id);
			idao.close();		
		}
		request.setAttribute("cinquirylist", cinquirylist);
		request.getRequestDispatcher("/CustomerInquiryList.jsp").forward(request, response);
		/* System.out.println(cinquirylist.get(1)); */
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doGet(request, response);
	}

}
