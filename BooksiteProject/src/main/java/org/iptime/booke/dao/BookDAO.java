package org.iptime.booke.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.iptime.booke.common.DBConnPool;
import org.iptime.booke.dto.BookDTO;
import org.iptime.booke.utils.MyBatisSqlSessionFactory;

public class BookDAO extends DBConnPool{
	private SqlSessionFactory sessionFactroy = MyBatisSqlSessionFactory.getSqlSessionFactory();
	
	public BookDTO readBook(Long bId) {
		BookDTO dto = null;
		
		try(SqlSession session = sessionFactroy.openSession(true)) {
			dto = session.selectOne("readBook", bId);
		}
		
		return dto;
	}
}
