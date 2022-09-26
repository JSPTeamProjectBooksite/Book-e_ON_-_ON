package org.iptime.booke.service;

import org.iptime.booke.dto.BookDTO;

public interface BookServiceImpl {
	BookDTO readBook(Long bid);
}
