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

@WebServlet("/register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 폼값 받기
		String userName = request.getParameter("user_name");
		String userGender = request.getParameter("gender");
		String userId = request.getParameter("user_id");
		String userPwd = request.getParameter("user_pw");
		String userEmail = request.getParameter("user_email");
		String userPhoneNumber = request.getParameter("user_phoneNumber");
		String userAddress = request.getParameter("user_address");

		// 폼값을 DTO 객체에 저장
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setName(userName);
		memberDTO.setGender(userGender);
		memberDTO.setId(userId);
		memberDTO.setPassword(userPwd);
		memberDTO.setPassword(userEmail);
		memberDTO.setPhoneNumber(userPhoneNumber);
		memberDTO.setAddress(userAddress);

		MemberDAO dao = new MemberDAO();
		int iResult = dao.SignUp(memberDTO);
		dao.close();

		// 성공 or 실패?
		if (iResult == 1) {
			System.out.println("회원가입 성공");
			response.sendRedirect("./login");	
			return;
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
