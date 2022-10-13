package org.iptime.booke.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iptime.booke.dao.CustomerCenterDAO;
import org.iptime.booke.dao.CustomerInquiryDAO;
import org.iptime.booke.dto.InquiryDTO;
import org.iptime.booke.dto.MemberDTO;

@WebServlet("/customercenter")
public class ManageinquireController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		CustomerInquiryDAO dao = new CustomerInquiryDAO();

		Map<String, Object> map = new HashMap<String, Object>();

		
		int totalCount = dao.selectCount(map);

		ServletContext application = getServletContext();
		int pageSize = Integer.parseInt(application.getInitParameter("POST_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("POST_PER_BLOCK"));

		int pageNum = 1;
		String pagetemp = req.getParameter("pageNum");
		if (pagetemp != null && !pagetemp.equals(""))
			pageNum = Integer.parseInt(pagetemp);

		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		map.put("start", start);
		map.put("end", end);

		List<InquiryDTO> inquireLists = dao.selectListPage(map);
		dao.close();

		req.setAttribute("inquireLists", inquireLists);
		req.setAttribute("map", map);
		req.getRequestDispatcher("ManageInquiry.jsp").forward(req, resp);

	}

}
