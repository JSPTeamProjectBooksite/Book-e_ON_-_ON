package org.iptime.booke.dao;

import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletContext;

import org.iptime.booke.common.JDBConnect;
import org.iptime.booke.dto.MemberDTO;

public class MemberDAO extends JDBConnect {
	public MemberDAO() {

	}

	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}

	public MemberDAO(ServletContext application) {
		super(application);
	}

	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM tbl_user WHERE id=? and password=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("password"));
				System.out.println(uid);
				System.out.println(upass);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	public int SignUp(MemberDTO dto) {
		int result = 0;

		try {
			String query = "INSERT INTO tbl_user(name, id, password, phonenumber, address) VALUES(?, ?, ?, ?, ?)";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getPassword());
			psmt.setString(4, dto.getPhoneNumber());
			psmt.setString(5, dto.getAddress());

			result = psmt.executeUpdate();

		} catch (SQLIntegrityConstraintViolationException e) {
			System.out.println("중복된 아이디가 있는 경우 오류 발생");
			result = 2;
		} catch (Exception e) {
			System.out.println("회원가입 도중에 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	public String findId(String member_name, String member_address) {
		String mid = null;

		try {
			String sql = "SELECT ID FROM TBL_USER WHERE NAME=? AND ADDRESS =?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, member_name);
			psmt.setString(2, member_address);
			rs = psmt.executeQuery();

			if (rs.next()) {
				mid = rs.getString("id");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mid;
	}
	
	public String findPassword(String member_name, String member_id , String member_address) {
		String mpass = null;

		try {
			String sql = "SELECT PASSWORD FROM TBL_USER WHERE NAME=? AND ID=? and ADDRESS =?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, member_name);
			psmt.setString(2, member_id);
			psmt.setString(3, member_address);
			rs = psmt.executeQuery();

			if (rs.next()) {
				mpass = rs.getString("password");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mpass;
	}
	
	public MemberDTO userInfo(String id) {
		try {

			String sql = "SELECT * FROM TBL_USER WHERE id = ?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				MemberDTO dto = new MemberDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				System.out.println("이름 : " + rs.getString(1));
				System.out.println("아이디 : " + rs.getString(2));
				System.out.println("비밀번호 : " + rs.getString(3));
				System.out.println("핸드폰번호 : " + rs.getString(4));
				System.out.println("주소 : " + rs.getString(5));
				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	public static void main(String[] args) {
		MemberDAO dao = new MemberDAO();
		dao.userInfo("green");
	}

}
