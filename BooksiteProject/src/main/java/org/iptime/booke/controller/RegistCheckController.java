package org.iptime.booke.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.MemberDAO;

@WebServlet("/register/check.do")
public class RegistCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegistCheckController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String what = request.getParameter("what");
		String name = request.getParameter("name");
		String email = request.getParameter("email");

		System.out.println(what);
		System.out.println(name);
		System.out.println(email);
		
		boolean result = false;
		
		//이름 중복확인
		if(what.equals("name")) {
			
			System.out.println(name + "0");
			
			MemberDAO dao = new MemberDAO();
			result = dao.checkName(name);
			dao.close();
		}else if(what.equals("email")) {
			
			System.out.println(email + "0");
			
			MemberDAO dao = new MemberDAO();
			result = dao.checkEmail(email);
			dao.close();
		}
		
		System.out.println("controllerResult : "+result);
		
		request.setAttribute("result", result+"");
		request.getRequestDispatcher("/resultColor.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
