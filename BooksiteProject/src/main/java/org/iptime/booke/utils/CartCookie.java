package org.iptime.booke.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public interface CartCookie {
	default void setCookieCart(HttpServletResponse response, String cName,
            String cValue, int cDay) {
		Cookie cookie = new Cookie(cName, cValue); 
        cookie.setPath("/cart/");       
        cookie.setMaxAge(cDay * (24*60*60));    
        
        
        response.addCookie(cookie); 
	}
}
