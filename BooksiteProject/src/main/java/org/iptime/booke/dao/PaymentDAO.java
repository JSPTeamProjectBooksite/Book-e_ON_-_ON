package org.iptime.booke.dao;

import java.util.ArrayList;
import java.util.List;

import org.iptime.booke.common.DBConnPool;
import org.iptime.booke.dto.MemberDTO;

public class PaymentDAO extends DBConnPool {

	public List<MemberDTO> selectList() {
		List<MemberDTO> list = new ArrayList<>();

		String sql = "SELECT NAME, PHONENUMBER, EMAIL, ADDRESS " + "FROM TBL_USER" + "WHERE NAME = ?";

		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				MemberDTO dto = new MemberDTO();

				dto.setName(rs.getString("NAME"));
				dto.setPhoneNumber(rs.getString("PHONENUMBER"));
				dto.setEmail(rs.getString("EMAIL"));
				dto.setAddress(rs.getString("ADDRESS"));

				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Member정보 조회 중 오류발생");
			e.printStackTrace();
		}
		return list;

	}

}
