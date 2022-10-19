package org.iptime.booke.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iptime.booke.dao.MemberDAO;
import org.iptime.booke.dto.MemberDTO;

@WebServlet("/OrderDetails")
public class OrderDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	int totalPrice = 0;
	int point = 0;	

    public OrderDetailsController() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Long UserId = (Long)session.getAttribute("LoginID");
		
		System.out.println("주문 상세내역 로그인 사용자 : "+UserId);
		
		MemberDAO memberDao = new MemberDAO();
		MemberDTO member = memberDao.userInfo(UserId);
		memberDao.close();
		
		request.setAttribute("delinfo", member);
		request.getRequestDispatcher("OrerDetails.jsp").forward(request, response);
	}
	
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
