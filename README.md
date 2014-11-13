SendWich
========
어.... 어? 새로 갱신하느라 지워진듯(...)
아오 ㅠㅠ 
<h1>프로젝트 도큐먼트</h1>
시작: maincontroller.java or index.jsp

MVC 구성에 따른 도큐먼트(초안)
MODEL
	MemberDAO: 회원 정보 조회, 가입, 수정, 탈퇴(삭제)
	msgDAO: 메세지 전송, 조회 
	dbcp.DBConnectionMgr: DBCP.
	DTO: 각 테이블정보를 테이블명DTO로 작성.
VIEW
	루트
		index.jsp: 시작 페이지.
		HeadInfo.jsp: 모든 페이지에 적용할 head영역 정보.
		Sub_Header.jsp: header(메뉴바) 부분. 이것도 모든 페이지에 인클루드.
		Content: 메인 화면 컨텐트(친구, 내 글)
		그외
		contact: 글쓰기 로 재활용
		single-page: 읽기 화면으로 재활용
		Mypeed: 내 글 보기로 재활용
CONTROLLER
	Front Controller 
		MainController. 회원가입, 로그인, 메인 페이지 접속 관련 
	sub Controller
		msgController: 메세지 전송, 목록 출력 관련 컨트롤러
		FriendController: 친구 목록, 친구 추가 관련 작업 연동.


<hr/>
일단 통합 작업 내용

<h1>db</h1>
-평가쪽 이름 바꿔야함.
-pq_보드, 리플 테이블 추가.
-sql문 작성해야됨.

<h1>main</h1> 
maincontroller.java 실행해서 들어가세요

-헤더 분리중. 
-싱글페이지꺼도 분리하기.
-헤더는 body 부분에서 쓸 것만 분리중.

<h1>join</h1> 
일단 기능 완료. 
-model 분리해야됨.

<h1>login</h1>  
아이디 찾기, 
비번 재설정

<h1>menu</h1>

<h1> 메인 게시판</h1>
일단 메인화면 1번글에서 연결했음.
뿌리는거랑 받는거 DAO 작성되야함.
id 받아서 넘겨주기 되야함. 

<h1>friends</h1>
친구목록 호출, 
친구검색,
친구 삭제
친구 신청은 어떻게?

<h1>msg</h1> 
디자인 맞추기.
값없을 때 에러남.


<h1>컨트롤러</h1>
메인: 로그인, 회원가입
friends: 친구 검색, 친구 추가 
msg: 쪽지 관련.