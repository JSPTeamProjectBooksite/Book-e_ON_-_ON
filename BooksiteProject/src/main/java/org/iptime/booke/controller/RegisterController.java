package org.iptime.booke.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.MemberDAO;
import org.iptime.booke.dto.MemberDTO;
import org.iptime.booke.utils.LocalDateABC;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 폼값 받기
		String userName = request.getParameter("name");
		String userEmail = request.getParameter("email");
		String userPwd = request.getParameter("password");
		String userBirth = request.getParameter("birthday");
//		String userGender = request.getParameter("gender");
		String userPhoneNumber = request.getParameter("phoneNum");
//		String userAddress = request.getParameter("address");
		
		LocalDate date = null;
		date = LocalDateABC.stringToLocalDate(userBirth);

		// 폼값을 DTO 객체에 저장
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setName(userName);
		memberDTO.setEmail(userEmail);
		memberDTO.setPassword(userPwd);
		memberDTO.setBirth(date);
//		memberDTO.setGender(userGender);
		memberDTO.setPhoneNum(userPhoneNumber);
//		memberDTO.setAddress(userAddress);

		MemberDAO dao = new MemberDAO();
		int iResult = dao.SignUp(memberDTO);
		dao.close();

		// 성공 or 실패?
		if (iResult == 1) {
			System.out.println("회원가입 성공");
			response.sendRedirect("./login");
			return;
		} else if (iResult == 2) {
			System.out.println("중복된 아이디가 있습니다.");
		} else {
			System.out.println("회원가입 실패");
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("./Register.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
