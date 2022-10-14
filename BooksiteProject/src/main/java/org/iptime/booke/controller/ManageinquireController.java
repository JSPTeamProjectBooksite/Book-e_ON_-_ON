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

@WebServlet("/MANAGE/INQUIRY")
public class ManageinquireController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		InquiryDAO dao = new InquiryDAO();

		ArrayList<Map<String, Object>> inquiryList = dao.Manamgeinquiryinfo();

		req.setAttribute("inquiryList", inquiryList);
		req.getRequestDispatcher("../Manageinquire.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);

	}
}