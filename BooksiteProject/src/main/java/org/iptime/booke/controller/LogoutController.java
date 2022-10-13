package org.iptime.booke.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String referer = request.getHeader("Referer").substring(23);
		System.out.println("로그아웃을 요청한 페이지 : " + referer);
		System.out.println("'" + session.getAttribute("LoginName") + "'님("+session.getAttribute("LoginID")+")이 로그아웃합니다.");
		
		session.removeAttribute("LoginID");
		session.removeAttribute("LoginName");

		response.sendRedirect(referer);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
