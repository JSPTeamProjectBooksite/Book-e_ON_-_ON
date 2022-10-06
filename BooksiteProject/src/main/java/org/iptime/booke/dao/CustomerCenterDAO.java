package org.iptime.booke.dao;

import org.iptime.booke.common.JDBConnect;
import org.iptime.booke.dto.MemberDTO;

public class CustomerCenterDAO extends JDBConnect{
	
	public MemberDTO cusinfo(String id) {
		MemberDTO dto = new MemberDTO();
		try {
			
			String sql = "SELECT NAME, ID " + "FROM TBL_USER " + "WHERE ID = ? ";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				MemberDTO cusinfo = new MemberDTO(rs.getString(1), rs.getString(3));
				return cusinfo;
			}
		} catch (Exception e) {
			System.out.println("Member정보 조회 중 오류발생");
			e.printStackTrace();
		}
		return null;

	}
}
