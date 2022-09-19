package org.iptime.booke.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShopBasketController
 */
@WebServlet("/shopcart")
public class ShopCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		List<Book> bookList = new ArrayList<Book>();
		
		bookList.add(new Book("source/book/기분이_태도가_되지_않으려면.png", "기분이 태도가 되지 않으려면", 14000, 2));
		bookList.add(new Book("source/book/기분이_태도가_되지_않으려면.png", "기분이 태도가 되지 않으려면", 14000, 2));
		bookList.add(new Book("source/book/기분이_태도가_되지_않으려면.png", "기분이 태도가 되지 않으려면", 14000, 2));
		
		
		request.setAttribute("bookList", bookList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("./ShopCart.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}

class Book{
	String img;
	String title;
	int money;
	int deliveryTime;
	
	public Book(String img, String title, int money, int deliveryTime) {
		super();
		this.img = img;
		this.title = title;
		this.money = money;
		this.deliveryTime = deliveryTime;
	}
	
}