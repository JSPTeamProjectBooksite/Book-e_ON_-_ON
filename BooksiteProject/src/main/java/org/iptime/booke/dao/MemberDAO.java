package org.iptime.booke.dao;

import java.sql.Date;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.iptime.booke.common.JDBConnect;
import org.iptime.booke.dto.MemberDTO;

public class MemberDAO extends JDBConnect {

	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = null;
		String query = "SELECT ID, NAME, EMAIL, PASSWORD FROM member_TBL WHERE email=? and password=? AND  MEMBER_STATE_ID=0";

		System.out.println("로그인시도 아이디 : " + uid);
		System.out.println("로그인시도 비밀번호 : " + upass);
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto = new MemberDTO();

				dto.setId(rs.getLong(1));
				dto.setName(rs.getString(2));
				dto.setEmail(rs.getString(3));
				dto.setPassword(rs.getString(4));

				System.out.println("로그인 성공 : '" + dto.getName() + "'님이 로그인 하셨습니다.");
			} else {
				System.out.println("로그인 하려는 아이디가 없습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인 시도중 오류발생");
		}

		return dto;
	}

	public int SignUp(MemberDTO dto) {
		int result = 0;

		try {
			String query = "INSERT INTO member_TBL(id, name, email, password, birth, gender, phone_num, address) VALUES(member_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?)";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getEmail());
			psmt.setString(3, dto.getPassword());
			psmt.setDate(4, Date.valueOf(dto.getBirth()));
			psmt.setString(5, dto.getGender());
			psmt.setString(6, dto.getPhoneNum());
			psmt.setString(7, dto.getAddress());
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

	public boolean IDCheck(String id) {
		try {
			String query = "SELECT * FROM login WHERE id='" + id + "'";
			rs = stmt.executeQuery(query);
			rs.last();

			if (rs.getRow() == 0) {
				System.out.println("0 row selected...");
			} else {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

//	public String findId(String member_name, String member_address) {
//		String mid = null;
//
//		try {
//			String sql = "SELECT ID FROM TBL_USER WHERE NAME=? AND ADDRESS =?";
//			psmt = con.prepareStatement(sql);
//			psmt.setString(1, member_name);
//			psmt.setString(2, member_address);
//			rs = psmt.executeQuery();
//
//			if (rs.next()) {
//				mid = rs.getString("id");
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return mid;
//	}
//
//	public String findPassword(String member_name, String member_id, String member_address) {
//		String mpass = null;
//
//		try {
//			String sql = "SELECT PASSWORD FROM TBL_USER WHERE NAME=? AND ID=? and ADDRESS =?";
//			psmt = con.prepareStatement(sql);
//			psmt.setString(1, member_name);
//			psmt.setString(2, member_id);
//			psmt.setString(3, member_address);
//			rs = psmt.executeQuery();
//
//			if (rs.next()) {
//				mpass = rs.getString("password");
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return mpass;
//	}

	public MemberDTO userInfo(Long id) {
		MemberDTO dto = null;

		try {

			String sql = "SELECT * FROM member_TBL WHERE ID = ?";
			psmt = con.prepareStatement(sql);
			psmt.setLong(1, id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto = new MemberDTO();

				dto.setId(rs.getLong(1));
				dto.setName(rs.getString(2));
				dto.setEmail(rs.getString(3));
				dto.setPassword(rs.getString(4));
				dto.setBirth(rs.getDate(5).toLocalDate());
				dto.setGender(rs.getString(6));
				dto.setPhoneNum(rs.getString(7));
				dto.setAddress(rs.getString(8));
				dto.setPoint(rs.getInt(9));
				dto.setMemberStateId(rs.getShort(10));
				dto.setRegisterDate(new Timestamp(rs.getDate(11).getTime()).toLocalDateTime());

				System.out.println("유저정보 성공적 조회");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("유저정보 조회중 오류발생");
		}

		return dto;
	}

	public ArrayList<Map<String, Object>> ManagerUserInfo() {
		ArrayList<Map<String, Object>> values = new ArrayList<Map<String, Object>>();

		try {

			String query = "SELECT * FROM MEMBER_TBL mt, MEMBER_STATE_TBL mst WHERE mt.MEMBER_STATE_ID = mst.ID";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery(query);

			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();

				MemberDTO memberDto = new MemberDTO(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getDate(5).toLocalDate(), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9),
						rs.getTimestamp(11).toLocalDateTime());

				String memberState = rs.getString(13);

				map.put("memberDto", memberDto);
				map.put("memberState", memberState);

				values.add(map);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return values;
	}

//	public int updateUserEdit(MemberDTO dto) {
//		int result = 0;
//
//		try {
//			String query = "UPDATE TBL_USER SET password = ? WHERE id = ?";
//
//			psmt = con.prepareStatement(query);
//			psmt.setString(1, dto.getPassword());
//			psmt.setString(2, dto.getId());
//
//			result = psmt.executeUpdate();
//		} catch (Exception e) {
//			System.out.println("회원정보 수정 중 예외 발생");
//			e.printStackTrace();
//		}
//		return result;
//	}
//
//	public int ReSign(String id) {
//		int result = 0;
//		try {
//			String query = "DELETE FROM TBL_USER WHERE ID = '" + id + "'";
//			psmt = con.prepareStatement(query);
//
//			result = psmt.executeUpdate();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return result;
//	}

	public int deleteUser(String idx) {
		int result = 0;

		try {
			String query = "UPDATE MEMBER_TBL SET MEMBER_STATE_ID = 1 WHERE ID = ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("회원 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

//	public static void main(String[] args) {
//		MemberDAO dao = new MemberDAO();
//		dao.ManagerUserInfo();
//	}

}
