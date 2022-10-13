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

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		String Referer;
		
		String userEmail = request.getParameter("email");
		String userPwd = request.getParameter("password");
		
		
		if(userEmail == null || userPwd == null) {
			
			if (request.getParameter("bntclick") != null) {
				//헤더의 버튼 클릭으로 로그인이 요청될 시 로그인이 요청된 페이지 저장
				
				Referer = (request.getHeader("Referer").substring(8)); //"http://booke.iptime.org"제거 후 주소 저장
				Referer = Referer.substring(Referer.indexOf("/"));
				session.setAttribute("Referer", Referer);
				System.out.println("로그인 시도한 주소 : " + (String)session.getAttribute("Referer"));//[확인완료]
			}
			
			System.out.println("로그인이 되어있지 않습니다. 로그인 페이지로 이동합니다.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/LoginPage.jsp");
			dispatcher.forward(request, response);
		}else {
			
			MemberDAO dao = new MemberDAO();
			MemberDTO memberDTO = dao.getMemberDTO(userEmail, userPwd);
			dao.close();
			
			if (memberDTO != null) {
				
				session.setAttribute("LoginID", memberDTO.getId());
				session.setAttribute("LoginName", memberDTO.getName());
				
				System.out.println("LoginID : " + session.getAttribute("LoginID"));
				System.out.println("LoginName : " + session.getAttribute("LoginName"));
				
				Referer = (String)session.getAttribute("Referer");
				
				if(Referer == null) {
					response.sendRedirect("/main");
					System.out.println("북이온앤온에서의 이동기록이 없습니다. 메인페이지로 이동합니다.");
				}else {
					response.sendRedirect(Referer);
					System.out.println("이전 페이지로 이동합니다. 이동주소 : " + (String)session.getAttribute("Referer"));
					session.removeAttribute("Referer");
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
