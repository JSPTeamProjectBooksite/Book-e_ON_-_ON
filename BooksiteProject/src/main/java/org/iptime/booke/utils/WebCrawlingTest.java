package org.iptime.booke.utils;

import java.io.IOException;

import org.iptime.booke.dto.BookDTO;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class WebCrawlingTest {
	public static void main(String[] args) {
		try {
//			String URL = "https://product.kyobobook.co.kr/detail/S000000581866";
			String URL = "https://product.kyobobook.co.kr/detail/S000001983540";
			Document doc = Jsoup.connect(URL).get();
			
			BookDTO dto = new BookDTO();

			//title
			Elements elem1 = doc.select("div[class=\"prod_title_area\"]");
			for(Element e: elem1.select("span")) {
				if(e.className().equals("prod_title") && dto.getTitle()==null) {
					dto.setTitle(e.toString().replace("<span class=\"prod_title\">", "").replace("</span>", ""));
				}else if(e.className().equals("prod_desc") && dto.getCatchphrase()==null) {
					dto.setCatchphrase(e.toString().replace("<span class=\"prod_desc\">", "").replace("</span>", ""));
				}
			}
			
			//coverImg
			Elements elem2 = doc.select("div[class=\"portrait_img_box\"]");
			String coverImg = elem2.toString().replace("<div class=\"portrait_img_box\"><img src=\"", "");
			coverImg = coverImg.substring(0 , coverImg.indexOf("\" alt"));
			dto.setCoverImg(coverImg);
			
			
			//translator
			Elements elem3 = doc.select("div[class=\"author\"]");
			if(elem3.text().indexOf(" 번역") != -1) {
				String translator = elem3.text();
				translator = translator.substring(0,translator.indexOf(" 번역"));
				translator = translator.substring(translator.lastIndexOf(" · ")+3);
				dto.setTranslator(translator);
			}
			
			
			//price
			Elements elem4 = doc.select("div[class=\"prod_price\"]");
			for(Element e: elem4.select("s")) {
				if(e.className().equals("val")) {
					dto.setPrice(Integer.parseInt(e.toString().replace("<s class=\"val\">", "").replace("<span class=\"unit\">원</span></s>", "").replace(",", "")));
					break;
				}
			}
			
			//introduce
			Elements elem5 = doc.select("div[class=\"info_text\"]");
			String introduce = "";
			for(Element e: elem5.select("div")) {
				if(e.className().equals("info_text")) {
					if(!introduce.equals("")) {
						introduce += "<br><br><br>";
					}
					introduce += e.toString().replace("<div class=\"info_text\">\n ", "").replace("\n</div>", "");
				}
			}
			dto.setIntroduce(introduce);
			
			//introduceImg
			Elements elem6 = doc.select("div[class=\"inner\"]");
			String introduceImg = elem6.toString().replace("<div class=\"inner\"><img loading=\"lazy\" src=\"", "");
			introduceImg = introduceImg.substring(0 , introduceImg.indexOf("\" alt"));
			dto.setIntroduceImg(introduceImg);
			
			
			
			System.out.println("[dto에 저장된 정보 출력]");
			dto.DTOPrintOut();
			
		}
		catch (IOException e) {
			e.printStackTrace();
			System.out.println("교보 크롤링 중 오류발생");
		}
	}
}
