package org.iptime.booke.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iptime.booke.dao.MemberDAO;
import org.iptime.booke.dto.MemberDTO;

@WebServlet("/changepassword")
public class UserInfoUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String userNewPw = request.getParameter("newPassword");
		
		Long uid = (Long) session.getAttribute("LoginID");

		MemberDTO dto = new MemberDTO();
		dto.setPassword(userNewPw);
		dto.setId(uid);

		MemberDAO dao = new MemberDAO();
		int iResult = dao.updateUserEdit(dto);
		dao.close();

		if (iResult == 1) {
			System.out.println("회원정보 수정 성공!!!");
			System.out.println("비밀번호가 성공적으로 변경되었습니다. 다시 로그인 해주세요.");
			response.sendRedirect("./login");
		} else {
			System.out.println("회원정보 수정 실패!!!");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
