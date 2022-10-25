package org.iptime.booke.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.InquiryDAO;
import org.iptime.booke.dao.MemberDAO;
import org.iptime.booke.dto.InquiryDTO;

@WebServlet("/MANAGE/INQUIRY")
public class ManageinquireController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		InquiryDAO dao = new InquiryDAO();
		MemberDAO mdao = new MemberDAO();

		ArrayList<InquiryDTO> inquiryList = dao.Manamgeinquiryinfo();
		dao.close();
		
		String [] nameList = new String[inquiryList.size()];
		
		for(int i=0; i<inquiryList.size();i++) {
			long memberId = inquiryList.get(i).getMemberId();
			nameList[i] = mdao.NameSearch(memberId);
			System.out.println(nameList[i]);
		}
		mdao.close();
		
		Long Id =  inquiryList.get(1).getMemberId();
		System.out.println(Id);

		req.setAttribute("inquiryList", inquiryList);
		req.setAttribute("nameList", nameList);
		req.getRequestDispatcher("../Manageinquire.jsp").forward(req, resp);
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);

	}
}
