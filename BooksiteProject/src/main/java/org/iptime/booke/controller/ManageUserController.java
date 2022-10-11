package org.iptime.booke.controller;

import java.io.IOException;
import java.util.ArrayList;

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

	public ManageUserController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberDAO dao = new MemberDAO();

		ArrayList<MemberDTO> userInfo = dao.ManagerUserInfo("userInfo");
		for (MemberDTO item : userInfo) {
			System.out.println(item);
		}
		dao.close();

		request.setAttribute("userInfo", userInfo);
		request.getRequestDispatcher("../ManageUser.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
