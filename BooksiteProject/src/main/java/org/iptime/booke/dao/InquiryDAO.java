package org.iptime.booke.dao;

import java.util.ArrayList;

import org.iptime.booke.common.JDBConnect;
import org.iptime.booke.dto.InquiryDTO;

public class InquiryDAO extends JDBConnect {

	public InquiryDTO Inqinfo(Long Id) {
		InquiryDTO dto = null;

		try {

			String sql = "SELECT * FROM INQUIRY_TBL WHERE ID = ?";
			psmt = con.prepareStatement(sql);
			psmt.setLong(1, Id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto = new InquiryDTO();

				dto.setId(rs.getLong(1));
				dto.setMemberId(rs.getLong(2));
				dto.setTitle(rs.getString(3));
				dto.setmContent(rs.getString(4));
				dto.setaContent(rs.getString(5));
				dto.setCategroy(rs.getString(6));
				dto.setState(rs.getString(7));
//			psmt.setString(7, LocalDateABC.toLocalDateTime(dto.getRigisterDate());

				System.out.println("문의내용 조회 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("문의내용 조회중 오류발생");

		}
		return dto;
	}

	public ArrayList<InquiryDTO> Manamgeinquiryinfo() {
		ArrayList<InquiryDTO> values = new ArrayList<InquiryDTO>();

		try {
			String sql = " SELECT * FROM INQUIRY_TBL ";
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery(sql);

			while (rs.next()) {
//				Map<String, Object> map = new HashMap<String, Object>();

				InquiryDTO inquiryDTO = new InquiryDTO(rs.getLong(1), rs.getLong(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getTimestamp(8).toLocalDateTime());

//				map.put("inquiryDTO", inquiryDTO);

				values.add(inquiryDTO);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return values;
	}
	
	public int InquireRegister(InquiryDTO dto) {
		int result = 0;

		try {
			String query = "INSERT INTO INQUIRY_TBL(ID, MEMBER_ID, TITLE, M_CONTENT, CATEGROY) VALUES(INQUIRY_SEQ.nextval, ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setLong(1, 1);
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getmContent());
			psmt.setString(4, dto.getCategroy());
			result = psmt.executeUpdate();
			
			System.out.println("문의가 성공적으로 접수됨");
//		} catch (SQLIntegrityConstraintViolationException e) {
//			System.out.println("중복된 아이디가 있는 경우 오류 발생");
//			result = 2;
		} catch (Exception e) {
			System.out.println("문의 등록 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public void adminAnswer(Long id, String aContent) {

		try {
			String query = "UPDATE INQUIRY_TBL SET A_CONTENT = ? WHERE ID = ?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, aContent);
			psmt.setLong(2, id);
			psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("문의 답변 중 예외 발생");
			e.printStackTrace();
		}
	}
}

//// public InquiryDAO() {
//		super();
//	}
//
//	public List<InquiryDTO> selectListPage(Map<String, Object> map) {
//		List<InquiryDTO> inquire = new Vector<InquiryDTO>();
//
//		String sql = " SELECT * FROM INQUIRY_TBL WHERE ID = ? ";
//
//		sql += " ORDER BY ID DESC " + "    ) Tb " + " ) " + " WHERE rNum BETWEEN ? AND ?";
//
//		try {
//			psmt = con.prepareStatement(sql);
//			rs = psmt.executeQuery();
//
//			InquiryDTO dto = new InquiryDTO();
//
//			while (rs.next()) {
//				System.out.println("값 존재");
//
//				dto.setId(rs.getLong(1));
//				dto.setMemberId(rs.getLong(2));
////				dto.setPhoneNum(rs.getString(3));
//				dto.setTitle(rs.getString(3));
//				dto.setContent(rs.getString(4));
//				dto.setCategroy(rs.getNString(5));
//				dto.setState(rs.getString(6));
////				dto.setRigisterDate(LocalDateABC.toLocalDateTime(rs.getDate(8)));
//
//				inquire.add(dto);
//			}
//		}
//
//		catch (Exception e) {
//			System.out.println("게시물 조회 중 오류발생");
//			e.printStackTrace();
//		}
//		return inquire;
//	}
