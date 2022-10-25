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

		String userPw = request.getParameter("Password"); // 현재 비밀번호
		String userNewPw = request.getParameter("NewPassword"); // 새 비밀번호
		String userPwCheck = request.getParameter("NewPasswordCheck"); // 새 비밀번호 확인

		Long uid = (Long) session.getAttribute("LoginID");

		MemberDTO dto = new MemberDTO();
		dto.setPassword(userNewPw);
		dto.setId(uid);

		MemberDAO dao = new MemberDAO();
		boolean b = dao.PwCheck(uid, userPw);

		if (b == false) {
			System.out.println("현재 비밀번호가 일치하지 않습니다.\n확인 후 다시 시도해주세요.");
		} else if (userPw.equals(userNewPw)) {
			System.out.println("기존 비밀번호와 동일한 비밀번호를 입력하셨습니다.\n다시 입력해주세요.");
		} else if (!userNewPw.equals(userPwCheck)) {
			System.out.println("새 비밀번호와 새 비밀번호 확인이 다릅니다.");
		} else {
			int iResult = dao.updateUserEdit(dto);
			if (iResult == 1) {
				System.out.println("회원정보 수정 성공!!!");
				System.out.println("비밀번호가 성공적으로 변경되었습니다. 다시 로그인 해주세요.");
				request.setAttribute("message", "비밀번호가 성공적으로 변경되었습니다. 다시 로그인 해주세요.");
			}
			request.getRequestDispatcher("/PrintString.jsp").forward(request, response);
		}
		dao.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
