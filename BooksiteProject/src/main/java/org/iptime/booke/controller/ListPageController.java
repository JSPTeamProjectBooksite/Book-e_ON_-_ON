package org.iptime.booke.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.ListPageDAO;

/**
 * Servlet implementation class ListPageController
 */
@WebServlet("/list")
public class ListPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		ListPageDAO dao = new ListPageDAO();
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		String searchFeild = request.getParameter("searchFeild");
//		String searchWord = request.getParameter("searchWord");
//		
//		if(searchWord != null) {
//			map.put("searchFeild", searchFeild);
//			map.put("searchWord", searchWord);
//		}
//		int totalCount = dao.selectCount(map);
//		
//		/* 페리지 처리 start */
//		ServletContext application = getServletContext();
//		
//		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
//		int BlockPage = Integer.parseInt(application.getInitParameter("POSTS_PER_BLOCK"));
//		
//		int pageNum = 1; //기본값
//		String pageTemp = request.getParameter("pageNum");
//		if(pageTemp != null && !pageTemp.equals(""))
//			pageNum = Integer.parseInt(pageTemp);
//		
//		int start = (pageNum - 1) * pageSize + 1;
//		int end = pageNum * pageSize;
//		map.put("start", start);
//		map.put("end",end);
//		
//		List<BookDTO> boardLists = dao.selectListPage(map);
//		dao.close();
//		
//		String pagingImg = SearchListPaging.pagingStr(totalCount, pageSize, BlockPage, pageNum, "/list");
//		map.put("pagingImg", pagingImg);
//		map.put("totalCount", totalCount);
//		map.put("pageSize", pageSize);
//		map.put("pageNum", pageNum);
//		
////		List<BookDTO> searchList = searchList();
////		request.setAttribute("searchList", searchList);
//		
//		request.setAttribute("searchList", boardLists);
//		request.setAttribute("map", map);
		
		String searchFeild = request.getParameter("searchFeild");
		String searchWord = request.getParameter("searchWord");
		
		List<Map<String, Object>> bookList = new ArrayList<Map<String, Object>>();
		
		ListPageDAO dao = new ListPageDAO();
		if(searchFeild.equals("title"))
			bookList = dao.searchBookForTitle(searchWord);
		else if(searchFeild.equals("author")) {
			List<Long> list = dao.searchAuthorForName(searchWord);
			bookList = dao.searchBookForAuthor(list);
		}
		dao.close();
		
		
		request.setAttribute("searchFeild", searchFeild);
		request.setAttribute("searchWord", searchWord);
		request.setAttribute("searchList", bookList);
		request.getRequestDispatcher("/ListPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
