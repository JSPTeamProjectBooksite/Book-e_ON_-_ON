package org.iptime.booke.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iptime.booke.dao.CustomerCenterDAO;
import org.iptime.booke.dto.MemberDTO;

@WebServlet("/customercenter")
public class CustomerInquiryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		String UserId = (String) session.getAttribute("user_id");
		session.setAttribute("user_id", UserId);

		CustomerCenterDAO dao = new CustomerCenterDAO();
		
		MemberDTO cusinfo = dao.cusinfo((String) session.getAttribute("user_id"));
		System.out.println(cusinfo);

	}
	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//		Connection conn = null;
//		String sql = null;
//		String url1 = "jdbc:sqlserver://localhost:1433;databaseName=;user=;password=;";
//		String id = request.getParameter("ID");
//		String pw = request.getParameter("PW");
//		String name = request.getParameter("NAME");
//		String[] gender = request.getParameterValues("GENDER");
//		try {
//			conn = DriverManager.getConnection(url1);
//		} catch (SQLException e) {
//			System.out.println(e);
//			e.printStackTrace();
//		}
//		try {
//			PreparedStatement pstmt = conn.prepareStatement("insert into ex_tbl values(?, ?, ?, ?)");
//			pstmt.setString(1, name);
//			pstmt.setString(2, id);
//			pstmt.setString(3, pw);
//			pstmt.setString(4, gender.toString());
//			pstmt.executeUpdate();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}		
}
