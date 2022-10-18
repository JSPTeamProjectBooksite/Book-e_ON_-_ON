package org.iptime.booke.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InquireController
 */
@WebServlet("/inquire")
public class InquireController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InquireController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String whatDo = request.getParameter("do");
		
		System.out.println("실행할 컨트롤러 : " + whatDo);
		//1:1문의 작성
		if(whatDo.equals("writeInquiry")) {
			System.out.println("1:1문의작성 요청됨");
			request.getRequestDispatcher("/UserInquiryWrite.jsp").forward(request, response);
		}
		else if(whatDo.equals("userInquiryList")) {
			
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
