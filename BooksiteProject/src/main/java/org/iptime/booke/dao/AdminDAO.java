package org.iptime.booke.dao;

import org.iptime.booke.common.DBConnPool;

public class AdminDAO extends DBConnPool{
	public String checkManager(Long memberId) {
		String query = "SELECT JOB_POSITION FROM admin_TBL WHERE MEMBER_ID = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setLong(1, memberId);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String jobPosition = rs.getString(1);
				System.out.println("관리자 계정 로그인: '" + jobPosition + "'님 접속");
				return jobPosition;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("관리자 확인 중 오류발생");
		}
		
		return null;
	}
}
