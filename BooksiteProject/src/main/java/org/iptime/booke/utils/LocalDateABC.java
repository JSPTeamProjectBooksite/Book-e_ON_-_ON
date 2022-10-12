package org.iptime.booke.utils;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class LocalDateABC {
	public static LocalDate toLocalDate(Date date) {
		return date.toLocalDate();
	}
	
	public static LocalDateTime toLocalDateTime(Date date) {
		return new Timestamp(date.getTime()).toLocalDateTime();
	}
	
	public static String printLocalDate(LocalDate localDate) {
		return localDate.format(DateTimeFormatter.ofPattern("yyyy.MM.dd"));
	}
	public static String printLocalDateTime(LocalDateTime localDate) {
		return localDate.format(DateTimeFormatter.ofPattern("yyyy.MM.dd HH:mm:ss"));
	}
}
