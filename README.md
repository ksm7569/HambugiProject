햄버거가게 웹 프로젝트 HambugiProject입니다
프로젝트명
햄버거 주문 웹 시스템 (Hambugi)

개요
이 애플리케이션은 사용자가 햄버거 메뉴를 조회하고 장바구니에 담아 주문하는 웹 기반 시스템이다. 일반 사용자와 관리자의 역할을 분리했으며, 사용자 측에선 주문과 내역 확인, 관리자 측에선 메뉴/회원/주문 관리와 매출 통계를 다룰 수 있다. Java Servlet과 JSP를 기반으로 하고 있으며, 객체지향 프로그래밍의 MVC 패턴을 따르고 있다.

용법

Eclipse IDE를 통해 프로젝트를 import한다.

로컬 톰캣 서버에 배포 후 실행한다.

브라우저를 통해 /index.jsp에 접속하여 기능을 사용한다.

파일 링크

메인 진입점: index.jsp

컨트롤러: com.hamproject.controller.*

DAO/DTO: com.hamproject.model.*

JSP: src/main/webapp/views/

구조

🔹 메인 JSP
index.jsp는 메인 페이지 역할을 하며 로그인, 메뉴 조회 등으로 진입하는 첫 화면이다. 모든 기능은 여기서부터 분기된다.

🔹 컨트롤러 클래스
com.hamproject.controller 패키지에 있는 수많은 서블릿들은 다음과 같은 사용자 상호작용을 처리한다:

LoginServlet, LogoutServlet: 사용자 인증 처리

MenuListServlet: 메뉴 전체 조회

CheckoutServlet: 주문 처리

AdminOrderListServlet, AdminPurchaseServlet: 관리자용 주문/매출 관리

AdminDeleteMemberServlet, AdminMemberDetailServlet: 회원 정보 확인 및 삭제

🔹 행동 양식

LoginServlet: 로그인 요청 처리

MenuListServlet: DB에서 메뉴 목록을 가져와 뷰로 전달

CheckoutServlet: 장바구니 정보 → 주문 → DB 저장

AdminPurchaseServlet: 매출 통계 데이터 계산 및 전송

DeleteMenuServlet, AddMenuServlet: 관리자 메뉴 추가/삭제 처리

🔹 DAO/DTO 클래스
com.hamproject.model 패키지는 DB와 직접 연동하는 계층이다. 각각의 주요 테이블에 대한 DAO와 DTO가 존재하며, 다음 메서드들을 담당한다:

insert(), delete(), update(), findById(), findAll() 등 CRUD 기본 메서드

MemberDAO, MenuDAO, OrderDAO, PurchaseDAO, StoreDAO 등

🔹 JSP 뷰

login.jsp, register.jsp: 사용자 로그인/회원가입 UI

menu.jsp: 메뉴 리스트 표시 및 장바구니 담기

cart.jsp, checkout.jsp: 장바구니 확인 및 결제

mypage.jsp, passwordcheck.jsp: 사용자 정보 관리

관리자 전용: adminpage.jsp, adminmemberlist.jsp, saleschart.jsp
