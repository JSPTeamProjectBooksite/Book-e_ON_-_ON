package org.iptime.booke.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
//<<<<<<< Updated upstream
import java.util.List;
//=======
//>>>>>>> Stashed changes
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iptime.booke.dao.BookDAO;
import org.iptime.booke.dao.MemberDAO;
import org.iptime.booke.dto.BookDTO;
import org.iptime.booke.dto.MemberDTO;

@WebServlet("/payment")
public class PaymentPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int totalPrice = 0;
		int deliveryFee = 0;
//		int point = 0;
		
		
		HttpSession session = req.getSession();
		// 새션에서 로그인 정보 가져옴
		Long UserId = (Long)session.getAttribute("LoginID"); //memberId
		
		System.out.println("결제페이지 로그인 유저 : " + UserId);
		
		if(UserId == null) {
			req.getRequestDispatcher("LogoutSendMain.jsp").forward(req, resp);
			return;
		}
		
		//유저
		
		MemberDAO memberDao = new MemberDAO();
		MemberDTO member = memberDao.userInfo(UserId);
		memberDao.close();
		
		//책
		String[] id = req.getParameterValues("selectedBooks"); //{"1","2","3","4"} (bid)
		String[] select = req.getParameterValues("bookCount"); //{"1","1","4","5"} (select)
		
		//선택수량 Long으로 변경
		Long[] selectCount = new Long[id.length];
		for(int i = 0; i < selectCount.length; i++) {
			selectCount[i] = Long.parseLong(select[i]);
		}
		
		System.out.println("책 선택배열 확인");
		System.out.println(java.util.Arrays.toString(id));
		System.out.println(java.util.Arrays.toString(select));
		
		
		BookDAO bookDao = new BookDAO();
		List<BookDTO> bookList = new ArrayList<>();
		
		for(int i = 0, n = id.length; i < n; i++) {
			BookDTO bdto = bookDao.readBook(Long.parseLong(id[i]));
			bookList.add(bdto);
			
			totalPrice += bdto.getPrice() * selectCount[i];
			
			if(deliveryFee < bdto.getDeliveryFee()) {
				deliveryFee = bdto.getDeliveryFee();
			}
		}
		bookDao.close();
		
		
		
		//가격 정보 전송
		Map<String, Integer> priceInfo = new HashMap<>();
		priceInfo.put("totalPrice", totalPrice);
		priceInfo.put("deliveryFee", deliveryFee);
		priceInfo.put("finalPrice", totalPrice + deliveryFee);
		
		
		
		
		req.setAttribute("delinfo", member); // 유저정보
		req.setAttribute("prodinfo", bookList); // 도서 선택 정보
		req.setAttribute("selectCount", selectCount); // 도서 선택 수량
		req.setAttribute("priceInfo", priceInfo); // 가격정보
		
		req.getRequestDispatcher("paymentPage.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
