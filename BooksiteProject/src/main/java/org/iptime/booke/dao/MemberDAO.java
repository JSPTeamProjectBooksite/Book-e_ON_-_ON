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

}
