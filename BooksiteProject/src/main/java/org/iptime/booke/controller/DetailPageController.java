package org.iptime.booke.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.DetailPageDAO;
import org.iptime.booke.dto.BookDTO;

@WebServlet("/detail")
public class DetailPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Long BID = Long.parseLong(request.getParameter("BID"));

		DetailPageDAO dao = new DetailPageDAO();
		
		BookDTO sendValue = dao.bidSearch(BID);
		dao.close();
		
		// 가격은 표시할때 정수형이 아닌 문자형으로 표시할 예정이다. 따로 저장할 변수를 만든다.
		// 18000 -> 18,000
		long bookPrice = sendValue.getPrice();

		/*
		 * 가격은 정수형으로 정의되어있다. 하지만, 출력시 18,000원 이런식으로 표현하기 위해 3번마다 ','을 찍어둔 문자열을 만들어서 같이
		 * request한다.
		 */
		String price = "";

		for (int i = 0, n = (bookPrice + "").length(); i < n; i++) {
			price = bookPrice % 10 + price;
			bookPrice /= 10;

			if (i != n - 1 && (i + 1) % 3 == 0) {
				price = "," + price;
			}
		}

		request.setAttribute("receivedValue", sendValue);
		request.setAttribute("bookPrice", price);

		request.getRequestDispatcher("/DetailPage.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
