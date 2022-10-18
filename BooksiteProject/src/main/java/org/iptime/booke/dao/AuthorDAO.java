package org.iptime.booke.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.iptime.booke.common.DBConnPool;
import org.iptime.booke.dto.AuthorDTO;

public class AuthorDAO extends DBConnPool {

	// 작가아이디(Long)로 검색
	public AuthorDTO findAuthor(Long AuthorId) {
		AuthorDTO DTO = null;

		String query = "SELECT ID, PROFILE_IMG, NAME, NATIONALITY, PROFILE_CONTENTS FROM AUTHOR_TBL WHERE ID = ?";

		if (AuthorId > 0) {
			try {
				psmt = con.prepareStatement(query);
				psmt.setLong(1, AuthorId);
				rs = psmt.executeQuery();

				if (rs.next()) {
					DTO = new AuthorDTO();

					DTO.setId(rs.getLong(1));
					DTO.setProfileImg(rs.getString(2));
					DTO.setName(rs.getString(3));
					DTO.setNationality(rs.getString(4));
					DTO.setProfileContents(rs.getString(5));

					// DTO.printOut();
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

	// 작가아이디(Long)로 검색
	public List<AuthorDTO> findAuthor(String name) {
		List<AuthorDTO> authorList = new ArrayList<AuthorDTO>();

		String query = "SELECT * FROM AUTHOR_TBL WHERE NAME LIKE '%"+ name +"%'";

		if (name != null) {
			try {
				psmt = con.prepareStatement(query);
				rs = psmt.executeQuery();
				
				AuthorDTO dto;

				while (rs.next()) {
					dto = new AuthorDTO();

					dto.setId(rs.getLong(1));
					dto.setProfileImg(rs.getString(2));
					dto.setName(rs.getString(3));
					if(rs.getDate(4) != null)
						dto.setBirth(rs.getDate(4).toLocalDate());
					if(rs.getDate(5) != null)
						dto.setDeath(rs.getDate(5).toLocalDate());
					dto.setNationality(rs.getString(6));
					dto.setProfileContents(rs.getString(7));

					// DTO.printOut();
					
					authorList.add(dto);
				}
				System.out.println("작가 정보 조회 완료");
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("작가리스트 조회 중 예외 발생");

				e.printStackTrace();
			}
		}

		return authorList;
	}
	
	public boolean addAuthor(AuthorDTO dto) {
		String query = "INSERT INTO author_TBL (id, profile_Img, name, birth, death, nationality, PROFILE_CONTENTS) VALUES(author_SEQ.nextval, ?, ?, ?, ?, ?, ?)";
		
		try {
			psmt = con.prepareStatement(query);
			Date birth = null;
			Date death = null;
			psmt.setString(1, dto.getProfileImg());
			psmt.setString(2, dto.getName());
			if(dto.getBirth()!=null)
				birth = Date.valueOf(dto.getBirth());
			psmt.setDate(3, birth);
			if(dto.getDeath()!=null)
				death = Date.valueOf(dto.getDeath());
			psmt.setDate(4, death);
			psmt.setString(5, dto.getNationality());
			psmt.setString(6, dto.getProfileContents());
			
			int applyResult = psmt.executeUpdate();
			
			return (applyResult == 1);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("작가 INSERT 중 예외 발생");
			return false;
		}
	}
}
