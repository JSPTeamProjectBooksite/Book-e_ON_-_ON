package org.iptime.booke.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iptime.booke.dao.MemberDAO;
import org.iptime.booke.dto.MemberDTO;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userEmail = request.getParameter("email");
		String userPwd = request.getParameter("password");

//		String oracleDriver = application.getInitParameter("OracleDriver");
//		String oracleURL = application.getInitParameter("OracleURL");
//		String oracleId = application.getInitParameter("OracleId");
//		String oraclePwd = application.getInitParameter("OraclePwd");

//		MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
		MemberDAO dao = new MemberDAO();
		MemberDTO memberDTO = dao.getMemberDTO(userEmail, userPwd);
		dao.close();

		if (memberDTO != null) {
			String recentURI = request.getParameter("from");
			System.out.println(recentURI+"에서 로그인을 요청하였습니다.");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("LoginID", memberDTO.getId());
			session.setAttribute("LoginName", memberDTO.getName());
			System.out.println("LoginID : " + session.getAttribute("LoginID"));
			System.out.println("LoginName : " + session.getAttribute("LoginName"));
			
			response.sendRedirect("/main");
			System.out.println("이전 페이지로 이동합니다.");
			return;
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("./LoginPage.jsp");
			dispatcher.forward(request, response);
			System.out.println("로그인이 되어있지 않습니다. 로그인 페이지로 이동합니다.");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
