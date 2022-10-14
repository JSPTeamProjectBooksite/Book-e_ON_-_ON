package org.iptime.booke.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.MemberDAO;
import org.iptime.booke.dto.MemberDTO;
import org.iptime.booke.utils.LocalDateABC;

@WebServlet("/ManageUserEdit")
public class ManageUserEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idx = request.getParameter("chooseUser");
		Long temp = Long.parseLong(idx);

		MemberDAO dao = new MemberDAO();

		MemberDTO result = dao.userInfo(temp);
		dao.close();

		request.setAttribute("result", result);
		request.getRequestDispatcher("./ManegeUserEdit.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String idx = request.getParameter("id");
		Long temp = Long.parseLong(idx);
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String birth = request.getParameter("birth");
		LocalDate date = null;
		date = LocalDateABC.stringToLocalDate(birth);
		String gender = request.getParameter("gender");
		String phoneNum = request.getParameter("phoneNum");
		String address = request.getParameter("address");
		String point = request.getParameter("point");
		int p = Integer.parseInt(point);
		String memberStateId = request.getParameter("memberStateId");
		short s = Short.parseShort(memberStateId);
		String registerDate = request.getParameter("registerDate"); 

		MemberDTO dto = new MemberDTO();
		dto.setId(temp);
		dto.setName(name);
		dto.setEmail(email);
		dto.setPassword(password);
		dto.setBirth(date);
		dto.setGender(gender);
		dto.setPhoneNum(phoneNum);
		dto.setAddress(address);
		dto.setPoint(p);
		dto.setMemberStateId(s);
		dto.setRegisterDate(LocalDateABC.stringToLocalDateTime(registerDate));

		MemberDAO dao = new MemberDAO();
		int result = dao.updateUserInfo(dto);
		dao.close();

		if (result == 1) {
			System.out.println("회원 정보 수정 성공!!!");
		} else {
			System.out.println("회원 정보 수정 실패!!!");
		}
	}

}
