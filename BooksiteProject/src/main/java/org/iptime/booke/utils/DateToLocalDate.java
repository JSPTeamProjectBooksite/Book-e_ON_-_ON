package org.iptime.booke.utils;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class DateToLocalDate {
	public static LocalDate toLocalDate(java.sql.Date date) {
		return date.toLocalDate();
	}
	
	public static LocalDateTime toLocalDateTime(java.sql.Date date) {
		return new Timestamp(date.getTime()).toLocalDateTime();
	}
}
