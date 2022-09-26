package org.iptime.booke.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dao.ListPageDAO;
import org.iptime.booke.dto.BookDTO;

/**
 * Servlet implementation class ListPageController
 */
@WebServlet("/list")
public class ListPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ListPageDAO dao = new ListPageDAO();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String searchFeild = request.getParameter("searchFeild");
		String searchWord = request.getParameter("searchWord");
		
		if(searchWord != null) {
			map.put("searchFeild", searchFeild);
			map.put("searchWord", searchWord);
		}
		int totalCount = dao.selectCount(map);
		
		/* 페리지 처리 start */
		ServletContext application = getServletContext();
		
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int BlockPage = Integer.parseInt(application.getInitParameter("POSTS_PER_BLOCK"));
		
		int pageNum = 1; //기본값
		String pageTemp = request.getParameter("pageNum");
		if(pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);
		
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		map.put("start", start);
		map.put("end",end);
		
		List<BookDTO> boardLists = dao.selectListPage(map);
		dao.close();
		
		String pagingImg = BoardPage.pagingStr();
		
		
		List<BookDTO> searchList = searchList();
		request.setAttribute("searchList", searchList);
		
		request.getRequestDispatcher("/ListPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private List<BookDTO> searchList() {
		List<BookDTO> booklist = new ArrayList<BookDTO>();

		booklist.add(new BookDTO(1L, "기분이 태도가 되지 않으려면", "source/book/기분이_태도가_되지_않으려면.png", "나겨울","<br>" + "<b>감정 기복이 심한 당신에게 필요한 기분 수업<b>"));
		booklist.add(new BookDTO(2L, "노인과 바다", "source/book/노인과_바다.png", "어니스트 헤밍웨이", "<br>" + "<b>세계문학전집<b>"));
		booklist.add(new BookDTO(4L, "아몬드", "source/book/아몬드.png", "손원평", "<br>" + "<b>아! 몬.드. 넥스트 레.벨.<b>"));
		booklist.add(new BookDTO(7L, "죽고 싶지만 떡볶이는 먹고 싶어", "source/book/죽고_싶지만_떡볶이는_먹고_싶어.png", "백세희", "<br>" + "<b>그냥 죽어<b>"));
		booklist.add(new BookDTO(8L, "창문넘어 도망친 100세 노인", "source/book/창문넘어_도망친_100세_노인.png", "요나스 요나손", 	"<br>" + "<b>요나스 요나손 장편소설<b>"));
		booklist.add(new BookDTO(9L, "하루도 쉬운 날이 없어", "source/book/하루도_쉬운_날이_없어.png", "소시민 J",	"<br>" + "<b>N년차 모 자치구 공무원의 오늘도 평화로운 민원창구<b>"));
		booklist.add(new BookDTO(3L, "밥을 왜먹냐 코딩만해도 배부른데", "source/book/밥을_왜먹냐_코딩만해도_배부른데.png", "코딩쟁이", "<b><span style='color: green; font-size: 15px'>[On & On 독점 도서]</span><br>배불러지는 코딩 습관<b>"));
		
		return booklist;
	}

}
