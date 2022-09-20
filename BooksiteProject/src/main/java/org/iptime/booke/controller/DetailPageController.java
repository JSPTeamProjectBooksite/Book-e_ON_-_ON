package org.iptime.booke.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iptime.booke.dto.BookDTO;

@WebServlet("/detail")
public class DetailPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<BookDTO> bookList = dao();
		
		request.setAttribute("bookList", bookList);
		
		request.getRequestDispatcher("/DetailPage.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private List<BookDTO> dao() {
		List<BookDTO> booklist = new ArrayList<BookDTO>();

		booklist.add(new BookDTO(0, "기분이 태도가 되지 않으려면", "source/book/기분이_태도가_되지_않으려면.png", "나겨울", "떠오름(RISE)", 13500,
				"<br>" + "<b>감정 기복이 심한 당신에게 필요한 기분 수업<b>",
				"<p><h3>‘남들 챙기느라 정작 나를 사랑하는 법을<br>잊어버린 당신에게 바치는 따뜻한 감정 수업’</h3></p><br>"
						+ "우리는 지금까지 나 자신보다 상대방의 감정을 더 배려하고 존중해왔다. 상대방에게 불편한 사람, 싫은 사람이 되고 싶지 않았기 때문. 하지만 정작 상대방의 감정을 배려하느라 내가 느끼고 있는 솔직한 감정들을 마주 볼 시간 없이 몸만 큰 ‘어른아이’가 됐다.<br>문자로 진행되는 ‘텍스트테라피’를 통해 1만 건이 넘는 상담을 했고, 글쓰기를 통해 마음을 치유하는 ‘상담&치유 글쓰기 수업’도 진행하고 있는 나겨울 작가는 남들을 챙기느라 정작 자신의 감정을 챙기지 못하고 살아가는 ‘어른아이’들에게 이렇게 말한다. ‘치유의 기본은 자신을 알아가는 것이고, 자신을 알아가기 위해선 스스로의 감정을 정확하게 파악해야 한다.’그녀는 이번 책을 통해 우리가 일상에서 익숙하게 느끼는 감정들을 정확히 파악하는 법과, 그 감정들을 바람직하게 받아들이는 구체적인 방법을 제시한다."));

		booklist.add(new BookDTO(1, "노인과 바다", "source/book/노인과_바다.png", "어니스트 헤밍웨이", "민음사", 8000,
				"<br>" + "<b>세계문학전집<b>", "<p><h3>먼 바다에서 펼쳐지는 노인의 고독한 사투!</h3></p><br>"
						+ "미국 현대 문학의 개척자라 불리는 어니스트 헤밍웨이의 대표작 『노인과 바다』. 퓰리처상 수상작이자 헤밍웨이의 마지막 소설로, 작가 고유의 소설 수법과 실존 철학이 집약된 헤밍웨이 문학의 결정판이다. 한 노인의 실존적 투쟁과 불굴의 의지를 절제된 문장으로 강렬하게 그려냈다. 십여 년 동안 이렇다 할 작품을 내놓지 못했던 헤밍웨이는 이 작품을 통해 작가적 생명력을 재확인하고 삶을 긍정하는 성숙한 태도를 보여주었다. 개인주의와 허무주의를 넘어 인간과 자연을 긍정하고 진정한 연대의 가치를 역설한다. 감정을 절제한 문체와 사실주의 기법, 다양한 상징과 전지적 화법을 활용하여 작품의 깊이를 더했다."));

		booklist.add(new BookDTO(2, "밥을 왜먹냐 코딩만해도 배부른데", "source/book/밥을_왜먹냐_코딩만해도_배부른데.png", "코딩쟁이", "코딩충 집합소", 18500,
				"<b><span style='color: green; font-size: 15px'>[On & On 독점 도서]</span><br>배불러지는 코딩 습관<b>",
				"<p><h3>대충 설명글</h3></p>"));

		booklist.add(new BookDTO(3, "아몬드", "source/book/아몬드.png", "손원평", "창비", 12000, "<br>" + "<b>아! 몬.드. 넥스트 레.벨.<b>",
				"<p><h3>괴물인 내가 또 다른 괴물을 만났다!</h3></p><br>"
						+ "영화와도 같은 강렬한 사건과 매혹적인 문체로 시선을 사로잡는 한국형 영 어덜트 소설 『아몬드』. 타인의 감정에 무감각해진 공감 불능인 이 시대에 큰 울림을 주는 이 작품은 감정을 느끼지 못하는 한 소년의 특별한 성장을 그리고 있다. 감정을 느끼는 데 어려움을 겪는 열여섯 살 소년 선윤재와 어두운 상처를 간직한 곤이, 그와 반대로 맑은 감성을 지닌 도라와 윤재를 돕고 싶어 하는 심 박사 사이에서 펼쳐지는 이야기가 우리로 하여금 타인의 감정을 이해한다는 것이 얼마나 어려운 일인지, 그럼에도 그것이 얼마나 소중한 일인지 다시 한 번 생각해 볼 기회를 전한다.<br>"));
		booklist.add(new BookDTO(4, "밥처먹고 코딩만 하기1", "source/book/밥처먹고_코딩만_하기1.png", "코딩에 미친놈", "코딩충 집합소", 14500,
				"<b><span style='color: green; font-size: 15px'>[On & On 독점 도서]</span><br>최고의 다이어트는 코딩?!<b>",
				"<p><h3>(대충 코딩만 한다는 내용)</h3></p><br>" + "설명<br>"));
		booklist.add(new BookDTO(5, "밥처먹고 코딩만 하기2", "source/book/밥처먹고_코딩만_하기2.png", "코딩에 미친놈", "코딩충 집합소", 15000,
				"<b><span style='color: green; font-size: 15px'>[On & On 독점 도서]</span><br>이게 어떻게 2권 나옴?!<b>",
				"<p><h3>(대충 코딩만 한다는 내용)</h3></p><br>" + "설명<br>"));
		booklist.add(new BookDTO(6, "죽고 싶지만 떡볶이는 먹고 싶어", "source/book/죽고_싶지만_떡볶이는_먹고_싶어.png", "백세희", "흔", 13800,
				"<br>" + "<b>그냥 죽어<b>",
				"<p><h3>의심 없이 편안하게 사랑하고 사랑받고 싶은 한 사람의 이야기</h3></p><br>"
						+ "10년 넘게 기분부전장애(가벼운 우울 증상이 지속되는 상태)와 불안장애를 겪으며 정신과를 전전했던 저자와 정신과 전문의와의 12주간의 대화를 엮은 『죽고 싶지만 떡볶이는 먹고 싶어』. 지독히 우울하지도 행복하지도 않은 애매한 기분에 시달렸고, 이러한 감정들이 한 번에 일어날 수 있다는 사실을 알지 못해서 괴로웠던 저자는 2017년 잘 맞는 병원을 찾아 약물치료와 상담치료를 병행하고 있다.<br><br>"
						+ "이 책은 저자의 치료 기록을 담고 있다. 사적인 이야기가 가득하지만 어두운 감정만 풀어내기보다는 구체적인 상황을 통해 근본적인 원인을 찾고, 건강한 방향으로 나아가는 것에 중점을 두고 있다. 겉보기에는 멀쩡하지만 속은 곪아 있는 사람들, 불안 속에 하루하루를 버티고 있는 사람들에게 이제까지 간과하고 있었지만 본인으로부터 나오고 있을지 모를 또 다른 소리에 귀 기울여보게 한다.<br>"));
		booklist.add(new BookDTO(7, "창문넘어 도망친 100세 노인", "source/book/창문넘어_도망친_100세_노인.png", "요나스 요나손", "열린책들", 16800,
				"<br>" + "<b>요나스 요나손 장편소설<b>",
				"<p><h3>세계 역사를 뒤바꾼 영감님의 모험!</h3></p><br>"
						+ "데뷔작으로 전 유럽 서점가를 강타한 스웨덴의 작가 요나스 요나손의 장편소설 『창문 넘어 도망친 100세 노인』. 100세 생일날 슬리퍼 바람으로 양로원의 창문을 넘어 탈출한 알란이 우연히 갱단의 돈가방을 손에 넣고 자신을 추적하는 무리를 피해 도망 길에 나서며 벌어지는 이야기를 담은 작품이다. 기자와 PD로 오랜 세월 일해 온 저자의 늦깎이 데뷔작으로 1905년 스웨덴의 한 시골 마을에서 태어난 노인이 살아온 백 년의 세월을 코믹하고도 유쾌하게 그려냈다.<br><br>"
						+ "양로원을 탈출해 남은 인생을 즐기기로 한 알란은 버스 터미널에서 한 예의 없는 청년의 트렁크를 충동적으로 훔친다. 사실은 돈다발이 가득 차 있었던 트렁크로 인해 쫓기는 신세가 된 그의 여정에 평생 좀스러운 사기꾼으로 살아온 율리우스, 수십 개의 학위를 거의 딸 뻔한 베니, 코끼리를 키우는 예쁜 언니 구닐라 등 잡다한 무리가 합류한다. 그리고 갱단과 그 뒤로 경찰까지 그들의 자취를 따라간다. 이와 같은 이야기 속에서 시한폭탄과도 같은 노인 알란이 세계사의 격변에 휘말리며 살아온 인생을 되돌아보게 된다.<br>"));
		booklist.add(new BookDTO(8, "하루도 쉬운 날이 없어", "source/book/하루도_쉬운_날이_없어.png", "소시민 J", "로그인", 16000,
				"<br>" + "<b>N년차 모 자치구 공무원의 오늘도 평화로운 민원창구<b>",
				"<p><h3>공무원의,<br>공무원에 의한,<br>그러나 공무원만을 위한 것은 아닌 우리 모두의 이야기</h3></p><br>"
						+ "이 책 《하루도 쉬운 날이 없어》는 수많은 민원인을 만나며 겪는 분노와 동요, 그리고 가끔씩 찾아오는 감동과 기쁨을 재밌는 일러스트로 승화한 서울시 모 자치구 N년차 공무원 소시민J의 리얼 민원창구 이야기다.<br>소시민J에게 이제 첫눈은 설레고 기쁜 낭만의 대상이 아닌 밤새 치워야 할 ‘적’이고, 조금씩 커져가는 빗소리는 고소한 파전이 생각나는 환상의 대상이 아닌 두려움과 공포의 대상이 되었다. 하루도 쉬운 날이 없다는 말을 시험하듯 오늘은 또 어떤 상대(민원인)를 만날지, 무슨 일이 생길지 무척이나 궁금하지만, 그래서 매일이 즐거우니 참 이상한 일이다. 읽으면 읽을수록 웃긴데 슬프고, 슬픈데 웃긴 진짜 민원창구 스토리, 그리고 우리의 이야기. 무엇을 상상해도 그 이상! 이제 누구도 함부로 민원실을 평화롭다 말하지 마라.<br>"));

		return booklist;
	}
}
