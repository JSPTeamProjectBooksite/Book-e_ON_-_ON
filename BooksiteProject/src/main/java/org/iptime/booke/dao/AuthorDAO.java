package org.iptime.booke.dao;

import org.iptime.booke.common.DBConnPool;
import org.iptime.booke.dto.AuthorDTO;

public class AuthorDAO extends DBConnPool {
	
	// 작가아이디(Long)을 받으면, 
	public AuthorDTO findAuthor(Long AuthorId) {
		AuthorDTO DTO = null;
		
		String query = "SELECT ID, PROFILE_IMG, NAME, NATIONALITY, PROFILE_CONTENTS FROM AUTHOR_TBL WHERE ID = ?";
		
		if(AuthorId > 0) {
			try {
				psmt = con.prepareStatement(query);
				psmt.setLong(1, AuthorId);
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					DTO = new AuthorDTO();
					
					DTO.setId(rs.getLong(1));
					DTO.setProfileImg(rs.getString(2));
					DTO.setName(rs.getString(3));
					DTO.setNationality(rs.getString(4));
					DTO.setProfileContents(rs.getString(5));
						
					//DTO.printOut();
				}
				
				return DTO;
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("작가정보 조회 중 예외 발생");
				
				e.printStackTrace();
			}
		}
		
		return DTO;
	}
	
}
