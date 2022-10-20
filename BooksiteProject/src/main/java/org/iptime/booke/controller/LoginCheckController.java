package org.iptime.booke.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.MemberDAO;

@WebServlet("/loginCheck")
public class LoginCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginCheckController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userEmail = request.getParameter("email");
		String userPwd = request.getParameter("password");
		
		
		
		//로그인 가능 한지 확인 
		MemberDAO mdao = new MemberDAO();
		int state = mdao.checkLoginState(userEmail, userPwd);
		mdao.close();
		
		String message;
		
		switch (state) {
		case -2:
			message = "아이디를 확인해주세요.";
			break;
		case -1:
			message = "비밀번호를 확인해주세요.";
			break;
		case 0:
			message = "로그인 가능한 아이디 입니다.";
			break;
		case 1:
			message = "로그인중인 계정입니다.";
			break;
		case 2:
			message = "삭제유예중인 계정입니다.";
			break;
		case 3:
			message = "정지된 계정입니다.";
			break;
		case 4:
			message = "이 계정은 휴면 상태입니다.";
			break;
		default:
			message = "(관리자 문의)";
			break;
		}
		
		System.out.println("로그인가능 여부 확인:"+message);
		
		request.setAttribute("message", message);
		request.getRequestDispatcher("/PrintString.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
