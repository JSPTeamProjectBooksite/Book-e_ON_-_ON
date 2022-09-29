package org.iptime.booke.dao;

import java.util.ArrayList;
import java.util.List;

import org.iptime.booke.common.DBConnPool;
import org.iptime.booke.dto.MemberDTO;

public class PaymentDAO extends DBConnPool {

	public MemberDTO payment(String id) {
		MemberDTO dto = new MemberDTO();

		String query = "SELECT NAME, ID, PHONENUMBER, ADDRESS " + "FROM TBL_USER " + "WHERE ID = ? ";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(2, id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setName(rs.getString("NAME"));
				dto.setId(rs.getString("ID"));
				dto.setPhoneNumber(rs.getString("PHONENUMBER"));
//				dto.setEmail(rs.getString("EMAIL"));
				dto.setAddress(rs.getString("ADDRESS"));
			}
		} catch (Exception e) {
			System.out.println("Member정보 조회 중 오류발생");
			e.printStackTrace();
		}
		return dto;

	}

}
