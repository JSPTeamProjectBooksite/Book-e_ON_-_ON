package org.iptime.booke.dao;

import org.iptime.booke.common.JDBConnect;
import org.iptime.booke.dto.MemberDTO;

public class PaymentDAO extends JDBConnect {

	public MemberDTO delinfo(String id) {
		MemberDTO dto = new MemberDTO();
		try {
			
			String sql = "SELECT NAME, ID, PHONENUMBER, ADDRESS " + "FROM TBL_USER " + "WHERE ID = ? ";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				MemberDTO delinfo = new MemberDTO(rs.getString(1), rs.getString(2),
						rs.getString(3), rs.getString(4));
				return delinfo;
			}
		} catch (Exception e) {
			System.out.println("Member정보 조회 중 오류발생");
			e.printStackTrace();
		}
		return null;

	}

}
