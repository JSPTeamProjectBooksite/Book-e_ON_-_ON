package org.iptime.booke.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.MemberDAO;
import org.iptime.booke.dao.PaymentDAO;
import org.iptime.booke.dto.BookDTO;
import org.iptime.booke.dto.MemberDTO;

@WebServlet("/payment")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PaymentDAO dao = new PaymentDAO();

		String[] id = req.getParameterValues("selectedBooks");
		for (String i : id) {
			System.out.println(i);
		}

	}
}
