package org.iptime.booke.utils;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class LocalDateABC {
	// Date -> LocalDate
	public static LocalDate toLocalDate(Date date) {
		return date.toLocalDate();
	}
	// Date -> LocalDateTime
	public static LocalDateTime toLocalDateTime(Date date) {
		return new Timestamp(date.getTime()).toLocalDateTime();
	}
	
	// LocalDate -> Date
	public static Date dateValueOf(LocalDate localDate) {
		return Date.valueOf(localDate);
	}
	// LocalDateTime -> Date
	public static Date dateValueOf(LocalDateTime localDateTime) { 
		return new Date(Timestamp.valueOf(localDateTime).getTime());
	}
	
	// String -> LocalDate
	public static LocalDate stringToLocalDate(String strDate) {		
		return LocalDate.parse(strDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}
	// String -> LocalDateTime
	public static LocalDateTime stringToLocalDateTime(String strDate) {
		return LocalDateTime.parse(strDate, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
	
	// LocalDate -> String
	public static String printDate(LocalDate localDate) {
		return localDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}
	// LocalDateTime -> String
	public static String printDate(LocalDateTime localDate) {
		return localDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
}
