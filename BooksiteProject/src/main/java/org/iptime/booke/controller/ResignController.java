package org.iptime.booke.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iptime.booke.dao.MemberDAO;

@WebServlet("/resign")
public class ResignController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String UserId = (String) session.getAttribute("user_id");
		session.setAttribute("user_id", UserId);

		int result = 0;
		if (result == 0) {
			MemberDAO dao = new MemberDAO();
			if (dao.ReSign((String) session.getAttribute("user_id")) > 0) {
				System.out.println("회원탈퇴 되었습니다. 이용해 주셔서 감사합니다.");
				response.sendRedirect("./login");
			} else {
				System.out.println("회원탈퇴 실패하였습니다. 관리자에게 문의해주세요.");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
