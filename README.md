SendWich
========
어.... 어? 새로 갱신하느라 지워진듯(...)
아오 ㅠㅠ 
<h1>프로젝트 도큐먼트</h1>
시작: maincontroller.java or index.jsp
<pre>
MVC 구성에 따른 도큐먼트(초안)</div>
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
		Content.jsp: 메인 화면 글 목록(친구, 내 글)
		그외
			contact.jsp: 글쓰기 로 재활용
			single-page.jsp: 읽기 화면으로 재활용
			Mypeed.jsp: 내 글 보기로 재활용
	board
		Read.jsp: 글 보기(해야됨)
		Sub_comment.jsp : 댓글(해야됨)
	css
		main.css: 주 화면 css인듯
		style.css: 그 외 화면 css 인듯.
	error
		NeedLogin.html: 로그인 세션 필요한 페이지에서 세션이 없는 경우 안내
	friends
		FriendList.jsp: 친구 목록 출력 페이지(해야됨)
	images
		... : 기존 틀에서 사용되는 이미지.
	join_v1
		conn_db.jsp: dbcp로 이전 작업 해야됨.(삭제예정)
		deleteemeber_Proc.jsp: 탈퇴 완료 메세지 출력
		deleteemeber.jsp: 탈퇴 암호 확인 페이지
		editmember_Proc.jsp: 정보 수정 완료 메세지 출력.
		EditMember.jsp: 회원정보 출력/ 수정 페이지
		emaildup_Proc.jsp: 이메일 검증(db 정리필요) & 메세지
		Emaildup.jsp: 회원가입 전 이메일 검증.
		join_Proc.jsp : 회원가입 처리(db정리 필요) & 메세지
		join.jsp: 회원가입 양식
		login_Proc.jsp: 로그인 처리(db정리) & 메세지 
		logout_Proc.jsp: 로그아웃 처리 메세지.
	js
		...: 기존 틀에서 사용되는 JS
	map
		지도 검색 관련 자료
	message
		deleteProc.jsp : 삭제 완료 메세지
		msglist.jsp : 쪽지 목록 창
		write.jsp : 메세지 전송 양식
		writeProc.jsp: 전송완료 메세지
		
CONTROLLER
	Front Controller 
		MainController. 회원가입, 로그인, 메인 페이지 접속 관련 
	sub Controller
		msgController: 메세지 전송, 목록 출력 관련 컨트롤러
		FriendController: 친구 목록, 친구 추가 관련 작업 연동.

</pre>
<hr/>
일단 통합 작업 내용

<h1>db</h1>

-pq_보드, 리플 테이블 추가.

-sql파일 수정
	위에 추가한 테이블.

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
친구검색
 -기등록 친구 제외 : JS 부분 수정해야됨.
 
친구 삭제
친구 신청 로직(테이블 값은 sender reciever invite)
검색이 복잡해지므로 그냥 테이블 두개로 처리.
2. 테이블 두개
a가 b에 신청 
-insert into friends value(a, b, 1);
-insert into friends value(b, a, 0);

0중 받는사람(b)에게 항목 띄움. 
-select reciever from friends where sender=b AND invite=0;

b가 수락 
update friends set invite=1 where sender=b AND reciever=a;
a b 1 완성

삭제: 
a에게는 친구 b를
b에게는 초청자 a를 삭제 해야 함. 

delete from friends where (sender=a and reciever=b) OR (sender=b AND reciever=a);

b 기준 검색- 본, 친 중에 자신이 있는 상대방 출력.
select reciever from firends where sender= b


<h1>msg</h1> 
디자인 맞추기.
목록을 사각형으로 맞춰보자.


<h1>컨트롤러</h1>
메인: 로그인, 회원가입
friends: 친구 검색, 친구 추가 
msg: 쪽지 관련.


<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
