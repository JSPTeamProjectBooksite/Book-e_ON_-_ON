package org.iptime.booke.utils;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.iptime.booke.dto.BookDTO;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class WebCrawlingTest {
	public static void main(String[] args) {
		String[] URL = new String[]{
				"https://product.kyobobook.co.kr/detail/S000000581727",
				"https://product.kyobobook.co.kr/detail/S000001983540",
				"https://product.kyobobook.co.kr/detail/S000001983540",
				"https://product.kyobobook.co.kr/detail/S000001913217"};
		
		
		WebCrawlingTest.webCrawling(URL[3]);
		
		
		
		
	}
	public static BookDTO webCrawling(String URL) {
		
		BookDTO dto = null;
		
		if(URL != null) {
			
			try {
				Document doc = Jsoup.connect(URL).get();
				
				dto = new BookDTO();
				
				//title
				Elements elem1 = doc.select("div[class=\"prod_title_area\"]");
				for(Element e: elem1.select("span")) {
					if(e.className().equals("prod_title") && dto.getTitle()==null) {
						dto.setTitle(e.html());
					}else if(e.className().equals("prod_desc") && dto.getCatchphrase()==null) {
						dto.setCatchphrase(e.html());
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
				Elements elem5 = doc.select("div[class=\"intro_bottom\"]");
				String introduce = "";
				for(Element e: elem5.select("div")) {
					if(e.className().equals("info_text fw_bold")) {
						introduce += "<b>"+ e.html() +"</b>";
					}
					else if(e.className().equals("info_text")) {
						if(!introduce.equals("")) {
							introduce += "<br><br><br>";
						}
						introduce += e.html();
						
					}
				}
				dto.setIntroduce(introduce);
				
				//introduceImg
				Elements elem6 = doc.select("div[class=\"inner\"]");
				if(elem6.toString().length() > 0) {
					String introduceImg = elem6.toString().replace("<div class=\"inner\"><img loading=\"lazy\" src=\"", "");
					introduceImg = introduceImg.substring(0 , introduceImg.indexOf("\" alt"));
					dto.setIntroduceImg(introduceImg);
				}
				
				//publisher & publicationDate
				Elements elem7 = doc.select("div[class=\"prod_info_text publish_date\"]");
				String publication = elem7.text();
				String publisher = publication.substring(0,publication.indexOf(" · "));
				publication = publication.substring(publication.indexOf(" · ")+3, publication.indexOf(" 출시"));
				//System.out.println(publisher);
				//System.out.println(publication);
				dto.setPublisher(publisher);
				
				LocalDate publicationDate = LocalDate.parse(publication, DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
				//System.out.println(publicationDate);
				dto.setPublicationDate(publicationDate);
				
				//contents
				Elements elem8 = doc.select("div[class=\"auto_overflow_inner\"]");
				for(Element e: elem8.select("li")) {
					if(e.className().equals("book_contents_item")) {
						//System.out.println(e.text());
						dto.setContents(e.html());
					}
				}
				
				//publisherReview
				Elements elem9 = doc.select("div[class=\"product_detail_area book_publish_review\"]");
				for(Element e: elem9.select("p")) {
					if(e.className().equals("info_text")) {
//					System.out.println(e.html());
						dto.setPublisherReview(e.html());
					}
				}
				
				
				Elements elem10 = doc.select("div[class=\"tbl_row_wrap\"]");
				List<String> bookInfo = new ArrayList<String>();
				for(Element e: elem10.select("td")) {
//					System.out.println(e.text());
					bookInfo.add(e.text());
				}
				String isbn13;
				String isbn10;
				String weight;
				String totalPages;
				
				if(bookInfo.size() > 0) {
					isbn13 = bookInfo.get(0).substring(0,bookInfo.get(0).indexOf(" "));
					isbn10 = bookInfo.get(0).substring(bookInfo.get(0).indexOf(" ( ")+3,bookInfo.get(0).indexOf(" )"));
					weight = bookInfo.get(1).substring(0,bookInfo.get(1).indexOf("쪽"));
					totalPages = bookInfo.get(2).substring(bookInfo.get(2).indexOf(" / ")+3,bookInfo.get(2).indexOf(" g "));
					
//				System.out.println(isbn13);
//				System.out.println(isbn10);
//				System.out.println(weight);
//				System.out.println(totalPages);
					
					dto.setIsbn13(isbn13);
					dto.setIsbn10(isbn10);
					dto.setWeight(Integer.parseInt(weight));
					dto.setTotalPages(Integer.parseInt(totalPages));
				}
				
				
				dto.setDeliveryFee(2500);
				
				System.out.println("[교보에서 불러온 BookDTO 정보]");
				dto.DTOPrintOut();
				
			}
			catch (IOException e) {
				e.printStackTrace();
				System.out.println("교보 크롤링 중 오류발생");
			}
		}
		return dto;
	}
}
