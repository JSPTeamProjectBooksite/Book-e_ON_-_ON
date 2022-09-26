package org.iptime.booke.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.MemberDAO;
import org.iptime.booke.dto.MemberDTO;

@WebServlet("/findPassword")
public class FindPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("user_name");
		String userId = request.getParameter("user_id");
		String userAddress = request.getParameter("user_address");

		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setName(userName);
		memberDTO.setId(userId);
		memberDTO.setAddress(userAddress);

		MemberDAO dao = new MemberDAO();
		String iResult = dao.findPassword(userName, userId, userAddress);
		dao.close();

		// 성공 or 실패?
		if (iResult != null) {
			System.out.println("비밀번호 찾기 성공!");
			System.out.println(iResult);
			PrintWriter out = response.getWriter();
			out.println("<script> alert('" + iResult + "'); </script>");
			out.println("<script> history.back(); </script>");
		} else {
			System.out.println("비밀번호 찾기 실패!");
			RequestDispatcher dispatcher = request.getRequestDispatcher("./FindPassword.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
