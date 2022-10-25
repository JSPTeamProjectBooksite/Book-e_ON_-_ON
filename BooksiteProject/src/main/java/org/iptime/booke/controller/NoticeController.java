package org.iptime.booke.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.NoticeDAO;
import org.iptime.booke.dto.NoticeDTO;

/**
 * Servlet implementation class NoticeController
 */
@WebServlet("/notice")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> param = new HashMap<String, Object>();
		
		NoticeDAO nDao = new NoticeDAO();
		// 페이지 처리 부분
		// 전체 페이지 수 계산
		int totalCount = nDao.totalCount();
		int pageSize = 20;
		int blockPage = 10;
		int totalPage = (int)Math.ceil((double)totalCount / pageSize);	// 페이지 수 = (게시글 전체 개수)/(한 페이지당 보여지는 개수) 반드시 올림해야 됨
		
		// 현재 페이지 확인
		int pageNum = 1;
		String pageTemp = request.getParameter("pageNum");
		if(pageTemp != null && !pageTemp.equals("")) pageNum = Integer.parseInt(pageTemp);
		
		// 목록에 출력할 게시물 범위 계산
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		param.put("start", start);
		param.put("end", end);
		
		List<NoticeDTO> noticeList = nDao.selectListPage(param);
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("blockPage", blockPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageSize", pageSize);

		request.getRequestDispatcher("/NoticePage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
