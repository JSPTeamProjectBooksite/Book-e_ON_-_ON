package org.iptime.booke.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iptime.booke.dao.InquiryDAO;
import org.iptime.booke.dao.MemberDAO;
import org.iptime.booke.dto.InquiryDTO;
import org.iptime.booke.dto.MemberDTO;

@WebServlet("/UserInquiryWrite.do")
/* inquiryWrite.do */
public class InquiryWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InquiryWriteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿 호출");
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Long UserId = (Long) session.getAttribute("LoginID"); // memberId

		System.out.println("문의페이지 로그인 유저 : " + UserId);

		// 유저

		MemberDAO memberDao = new MemberDAO();
		MemberDTO member = memberDao.userInfo(UserId);
		memberDao.close();

		String inquireTitle = request.getParameter("title");
		String inquireContent = request.getParameter("content");
		String inquireCategory = request.getParameter("category");
		
		
		System.out.println(inquireTitle);
		System.out.println(inquireContent);
		System.out.println(inquireCategory);

		InquiryDTO inquiryDTO = new InquiryDTO();
		inquiryDTO.setMemberId(UserId);
		inquiryDTO.setTitle(inquireTitle);
		inquiryDTO.setContent(inquireContent);
		inquiryDTO.setCategroy(inquireCategory);

		InquiryDAO dao = new InquiryDAO();
		int iResult = dao.InquireRegister(inquiryDTO);
		dao.close();

		if (iResult == 1) {
			System.out.println("등록 성공");
			response.sendRedirect("/mypage");
			return;
		}
		System.out.println("등록 실패");
//		resp.sendRedirect("./WriteInquiry");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
