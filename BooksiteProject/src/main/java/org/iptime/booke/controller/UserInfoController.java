package org.iptime.booke.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iptime.booke.dao.MemberDAO;
import org.iptime.booke.dto.MemberDTO;

@WebServlet("/userInfoController")
public class UserInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		String UserId = (String) session.getAttribute("user_id");

		session.setAttribute("user_id", UserId);

		MemberDAO dao = new MemberDAO();

		MemberDTO userInfo = dao.userInfo(session.getId());
		System.out.println(userInfo);
		dao.close();

		request.setAttribute("userInfo", userInfo);
		request.getRequestDispatcher("./test2.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
