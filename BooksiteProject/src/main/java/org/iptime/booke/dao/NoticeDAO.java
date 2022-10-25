package org.iptime.booke.dao;

import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;

import org.iptime.booke.common.DBConnPool;
import org.iptime.booke.dto.NoticeDTO;
import org.iptime.booke.utils.LocalDateABC;

public class NoticeDAO extends DBConnPool {
	
	public int totalCount() {
		int ret = 0;
		String sql = "SELECT count(*) FROM INQUIRY_TBL";
		
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			
			if(rs.getRow() != 0) {
				ret = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ret;
	}
	
	// 페이징 기능
	public List<NoticeDTO> selectListPage(Map<String, Object> map) {
		List<NoticeDTO> list = new LinkedList<NoticeDTO>();
		String query;
		
		query = "SELECT * FROM ( 	"
			+ "		SELECT Tb.*, ROWNUM rNum FROM ( "
			+ "			SELECT ID, MEMBER_ID, TITLE, CATEGORY, CONTENT, TARGET_MEMBER_ID, REGISTER_DATE  FROM NOTICE_TBL "
			+ "			ORDER BY ROWNUM ASC	"
			+ "		) Tb "
			+ "	)WHERE rNum BETWEEN ? AND ?";
		
		
		
		System.out.println("SQL : " + query);
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				dto.setId(rs.getLong(1));
				dto.setMemberId(rs.getLong(2));
				dto.setTitle(rs.getString(3));
				dto.setCategory(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setTargetMemberId(rs.getLong(6));
				dto.setRegisterDate(LocalDateABC.toLocalDateTime(rs.getDate(7)));
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return list;
	}
}
