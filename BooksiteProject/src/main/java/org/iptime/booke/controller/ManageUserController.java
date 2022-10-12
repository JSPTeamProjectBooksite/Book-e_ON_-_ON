package org.iptime.booke.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.MemberDAO;
import org.iptime.booke.dto.MemberDTO;

@WebServlet("/MANAGE/USER")
public class ManageUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberDAO dao = new MemberDAO();

		ArrayList<Map<String, Object>> memberList = dao.ManagerUserInfo("userInfo");

		request.setAttribute("memberList", memberList);
		request.getRequestDispatcher("../ManageUser.jsp").forward(request, response);
		dao.close();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
