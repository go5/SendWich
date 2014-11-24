SendWich
========
.
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
		FriendList.jsp: 친구 목록 출력 페이지
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
	map(작업중)
		map.jsp: 검색 시 지도 창.
		mapdb.jsp: 일단 보존.(미사용)
		resultpage.jsp: 마커누르면 가는 곳.
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
일단 작업 할 것들. 

<h1>db</h1>

<h1>main</h1> 

<h1>join</h1> 
-model 분리해야됨.
-약관동의

친구목록 안뜸!!

<h1>게시판</h1>

글 수정 
-보드만 수정.
-지도 수정 안함. 
-차트는 수정 불가. (지우고 다시 쓰도록)

삭제
-보드만 삭제. 
-지도부분은 남김
-차트도 남김. 


M:\workspace\JSP\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SendWich\upload