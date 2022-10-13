package org.iptime.booke.dao;

import java.util.Map;

import org.iptime.booke.common.JDBConnect;

public class CustomerInquiryDAO extends JDBConnect{
	public CustomerInquiryDAO() {
		super();
	}
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String sql = "SELECT COUNT(*) FROM"
	}

}
