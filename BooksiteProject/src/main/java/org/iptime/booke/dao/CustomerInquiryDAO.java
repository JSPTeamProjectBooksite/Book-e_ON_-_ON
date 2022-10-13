package org.iptime.booke.dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.iptime.booke.common.JDBConnect;
import org.iptime.booke.dto.InquiryDTO;
import org.iptime.booke.utils.LocalDateABC;

public class CustomerInquiryDAO extends JDBConnect {
	public CustomerInquiryDAO() {
		super();
	}

	public List<InquiryDTO> selectListPage(Map<String, Object> map) {
		List<InquiryDTO> inquire = new Vector<InquiryDTO>();

		String sql = " SELECT * FROM INQUIRY_TBL ";

//		if (map.get("searchWord") != null) {
//
//			sql += " WHERE " + map.get("searchField") + "LIKE '%" + map.get("searchWord") + "%' ";
//		}
		
		sql += " ORDER BY ID DESC " + "    ) Tb " + " ) " + " WHERE rNum BETWEEN ? AND ?";
		
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				InquiryDTO dto = new InquiryDTO();

				dto.setId(rs.getLong(1));
				dto.setMemberId(rs.getLong(2));
//				dto.setPhoneNum(rs.getString(3));
				dto.setTitle(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setCategroy(rs.getNString(6));
				dto.setState(rs.getString(7));
				dto.setRigisterDate(LocalDateABC.toLocalDateTime(rs.getDate(8)));

				inquire.add(dto);
			}
		}

		catch (Exception e) {
			System.out.println("게시물 조회 중 오류발생");
			e.printStackTrace();
		}
		return inquire;
	}
	
	public int insertWrite(InquiryDTO dto) {
		int result = 0;
		
		try {
			String sql = " INSERT INTO INQUIRY_TBL ( "
					   + " id, member_id, title, content, categroy, state, rigisterDate) "
					   + " VALUES ( "
					   + " INQUIRY_SEQ.nextval,?,?,?,?,?,?)";
			
			psmt = con.prepareStatement(sql);
			psmt.setLong(1, dto.getId());
			psmt.setLong(2, dto.getMemberId());
			psmt.setString(3, dto.getTitle());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getCategroy());
			psmt.setString(6, dto.getState());
//			psmt.setString(7, LocalDateABC.toLocalDateTime(dto.getRigisterDate());
					
		}
		catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}
