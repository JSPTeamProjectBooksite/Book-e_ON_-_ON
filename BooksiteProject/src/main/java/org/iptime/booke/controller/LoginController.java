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

		HttpSession session = request.getSession();

		String userId = request.getParameter("user_id");
		String userPwd = request.getParameter("user_pw");
		
//		String oracleDriver = application.getInitParameter("OracleDriver");
//		String oracleURL = application.getInitParameter("OracleURL");
//		String oracleId = application.getInitParameter("OracleId");
//		String oraclePwd = application.getInitParameter("OraclePwd");

//		MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
		MemberDAO dao = new MemberDAO();
		MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
		dao.close();

		if (memberDTO.getId() != null) {
			session.setAttribute("UserId", memberDTO.getId());
			session.setAttribute("UserName", memberDTO.getName());
			response.sendRedirect("./main");
			System.out.println("로그인 성공");	
			return;
		} else {
//			request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
//			request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
			System.out.println("로그인 실패");
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("./LoginPage.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
