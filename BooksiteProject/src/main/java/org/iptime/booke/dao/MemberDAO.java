package org.iptime.booke.dao;

import java.security.Timestamp;
import java.sql.Date;
import java.sql.SQLIntegrityConstraintViolationException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.iptime.booke.common.JDBConnect;
import org.iptime.booke.dto.MemberDTO;
import org.iptime.booke.utils.LocalDateABC;

public class MemberDAO extends JDBConnect {

	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM member_TBL WHERE email=? and password=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setEmail(rs.getString("email"));
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

//	public MemberDTO userInfo(String id) {
//		try {
//
//			String sql = "SELECT * FROM TBL_USER WHERE id = ?";
//			psmt = con.prepareStatement(sql);
//			psmt.setString(1, id);
//			rs = psmt.executeQuery();
//
//			if (rs.next()) {
//				MemberDTO dto = new MemberDTO(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
//						rs.getString(6), rs.getString(7), rs.getDate(8), rs.getInt(9));
//				
//				System.out.println("이름 : " + rs.getString(2));
//				System.out.println("성별 : " + rs.getString(3));
//				System.out.println("비밀번호 : " + rs.getString(4));
//				System.out.println("핸드폰번호 : " + rs.getString(5));
//				System.out.println("주소 : " + rs.getString(6));
//				System.out.println("이메일 : " + rs.getString(7));
//				System.out.println("생년월일 : " + rs.getDate(8));
//				System.out.println("포인트 : " + rs.getInt(9));
//				return dto;
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return null;
//	}

	public ArrayList<Map<String, Object>> ManagerUserInfo(String list) {
		ArrayList<Map<String, Object>> values = new ArrayList<Map<String, Object>>();
		
		
		try {

			String query = "SELECT * FROM MEMBER_TBL mt, MEMBER_STATE_TBL mst WHERE mt.MEMBER_STATE_ID = mst.ID";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery(query);

			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
	
				MemberDTO memberDto = new MemberDTO(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getDate(5).toLocalDate(), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getTimestamp(11).toLocalDateTime());
				
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

//	public static void main(String[] args) {
//		MemberDAO dao = new MemberDAO();
//		dao.ManagerUserInfo("");
//	}

}
