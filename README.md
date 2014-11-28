SendWichㅇ
========
.<br/>
<h1>프로젝트 도큐먼트</h1>
<br/>
시작: 도메인/SendWich
<br/>
<pre>
MVC 구성에 따른 도큐먼트(초안)
MODEL
	dao
		BoardDAO.java : 글/댓글 입력, 수정, 삭제 처리
		ChartDAO.java : 평가 그래프 작성, 출력 처리.
		FriendsDAO.java: 친구 목록, 친구신청, 삭제 기능 처리
		MapDAO.java: 지도 검색, 지도정보 저장 기능
		MemberDAO: 회원 정보 조회, 가입, 수정, 탈퇴 처리
		msgDAO: 메세지 전송, 조회 
	dbcp
		DBConnectionMgr: DBCP.
	dto
		각 테이블정보를 테이블명DTO로 작성. 
	util
		Encode.java : 암호화 처리 bean
		fileUpload.java: 파일 업로드 bean

VIEW
	루트
		index.jsp: 메인 화면 페이지.
		HeadInfo.jsp: 모든 페이지에 적용할 head영역 정보.
		Sub_Header.jsp: header(메뉴바) 부분.
		Content.jsp: 메인 화면 글 목록(친구, 내 글)
	assets : bootstrap 파일
		... : 부트스트랩 적용을 위한 css, js, img.
	board
		aboutus.jsp: 소개 페이지(샘플)
		post.jsp: 글 작성 페이지
		Read.jsp: 글 보기
		Sub_comment.jsp : 글보기
		update.jsp: 글 수정 페이지		
	chart : 평가그래프 기능
		Chart_Insert.jsp : 그래프 입력 페이지(참조자료.)
		Chart_Read.jsp: 그래프 출력 페이지(참조자료.)
		Chart.jsp: 미사용. 그래프 테스트용.
		Nwagon_no_vml.js : 그래프 참조 js
		Nwagon.css : 그래프 디자인 css 
		Nwagon.js : 그래프 구현 js
	error
		404_error.jsp: 404에러 안내페이지
		500_error.jsp: 500에러 안내페이지
		NeedLogin.html: 로그인 세션 필요한 페이지에서 세션이 없는 경우 안내
	friends
		FriendList.jsp: 친구 목록 페이지
	images
		...: 홈페이지 장식용 이미지들.
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
		passEditComplete.jsp: 비번변경 완료 메세지
		passReset.jsp: (비번 변경)회원정보 확인 페이지
		passResetChk.jsp: 비번병경 정보확인 완료 메세지
		passUpdate.jsp: 비번 변경 페이지.
	map
		map.jsp: 검색 시 지도 창.
		mapinfo.jsp: 검색 지역관련 정보 창
		mapkey.html: 정적 지도 api호출 스크립트. 
	message
		deleteProc.jsp : 삭제 완료 메세지
		msglist.jsp : 쪽지 목록 창
		write.jsp : 메세지 전송 양식
		writeProc.jsp: 전송완료 메세지
	old: 기존 프레임 사용 페이지들. 이후 활용시 base
		contact.jsp: 글쓰기 로 재활용
		single-page.jsp: 읽기 화면으로 재활용
		Mypeed.jsp: 내 글 보기로 재활용
	upload: 홈페이지 업로드된 파일들 저장 폴더
		
CONTROLLER
	Front Controller 
		MainController. 회원정보 관리, 로그인, 글/댓글 입력, 수정, 삭제, 지도검색 
	sub Controller
		msgController: 메세지 전송, 목록 출력 관련 컨트롤러
		FriendController: 친구 목록, 친구 추가 관련 작업 연동.
		ChartController: 평가그래프 입/출력.


보완사항
-메인페이지 기능 분리
-회원관리 db연결 dbcp 적용
-차트 기능 개선(수정, 삭제)
-글쓰기 기능 개선()
-회원가입 약관 추가.
-지도 검색결과에서 친구글목록과 회원 그래프 보여주기.

확인된 문제(1128)
-글 작성시 차트기능.
	- 작성시 값을 아예 넣지 않으면 에러남
	- 주제가 비어도 값이 입력됨.(주제를 비우면 입력이 됮 ㅣ않아야함) 
</pre>

M:\workspace\JSP\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SendWich\upload