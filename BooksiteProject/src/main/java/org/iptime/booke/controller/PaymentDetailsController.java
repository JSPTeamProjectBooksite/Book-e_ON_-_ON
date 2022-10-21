package org.iptime.booke.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.MemberDAO;
import org.iptime.booke.dao.OrderDAO;
import org.iptime.booke.dao.PaymentDAO;
import org.iptime.booke.dto.MemberDTO;
import org.iptime.booke.dto.PaymentDTO;

@WebServlet("/payment/detail")
public class PaymentDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 

    public PaymentDetailsController() {
    	super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");

		System.out.println("결제정보 아이디:"+id);
		
		//결제 정보 가져오기
		PaymentDAO pdao = new PaymentDAO();
		PaymentDTO pdto = pdao.orderInfo(id);
		pdao.close();
		
		//주문자 정보가져오기
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.userInfo(pdto.getMemberId());
		mdao.close();
		
		
		
		//주문 내역 가져오기(안에 책정보있음)
		OrderDAO odao = new OrderDAO();
		List<Map<String, Object>> orderList = odao.orderdetailinfo(id);
		odao.close();
		
		request.setAttribute("payInfo", pdto);
		request.setAttribute("userInfo", mdto);
		request.setAttribute("orderInfoList", orderList);
		
		request.getRequestDispatcher("/PaymentDetails.jsp").forward(request, response);
		
		
		
		
//		//로그인 정보
//		HttpSession session = request.getSession();
//		Long UserId = (Long)session.getAttribute("LoginID");
//		
//		System.out.println("주문자ID: "+UserId);
//
//		MemberDAO memberDao = new MemberDAO();
//		MemberDTO delinfo = memberDao.userInfo(UserId); 
//		memberDao.close();
//		
//		//결제정보
//		String id = request.getParameter("id");
//		PaymentDAO paymentDao = new PaymentDAO();
//		PaymentDTO orderinfo = paymentDao.orderInfo(id);
//		paymentDao.close();
//		
//		//책정보(bookid, 구매수량) 요거 뺴고 잘 나옴,,,!!!!!
//		
//		Long ID = Long.parseLong(request.getParameter("id"));
//		BookDAO dao = new BookDAO();
//		ArrayList<BookDTO> payinfoList = dao.paybookinfo(ID);
//		dao.close();
//		
//	
//	
//		request.setAttribute("payinfoList", payinfoList);
//		request.setAttribute("delinfo", delinfo);
//		request.setAttribute("orderinfo", orderinfo);
//		request.getRequestDispatcher("PaymentDetails.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
