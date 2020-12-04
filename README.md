### 요약
- COURSE : 웹기반 빅데이터 전문 개발자 양성과정 (1) - KH정보교육원 (강남지원)
- SUBJECT : 세미 프로젝트
- TITLE : TYDEE
- SUMMARY : 소유 재화의 웹으로의 마이그레이션
- PERIOD : 2020.07.15 ~ 2020.08.10

### 프로젝트 멤버
- [박진희](https://github.com/pomeloEater)
- [김태현](https://github.com/ffolabear)
- [라현준](https://github.com/la-Hyun-Jun)
- [박정은](https://github.com/jungeun-p)
- [정형빈](https://github.com/AbelJung)

### 개발 동기
- 한정된 공간, 소비로 인해 계속해서 적재되는 물건들
- 정리정돈 습관이 체화되어 있지 않으면 한정된 공간을 효율적으로 사용할 수 없음
- 정리정돈의 중요성과 방법들은 여러 매체를 통해 송출됨에 따라 필연적으로 분산됨

> 자신이 어떤 물건을 갖고 있는지 손쉽게 확인할 수 있다면, <br />
> 그리고 정리정돈 방법, 재활용 방법들을 한곳에서 모아볼 수 있다면?

### 구현 기능
- D3.js를 통해 저장된 재화들을 계층형 다이어그램으로 시각화
- 


### 개발환경
* 구현 언어 : Java, JavaScript, HTML, CSS
* 사용 기술 : MyBatis, Servlet/JSP, jQuery
* 사용 API : SNS 로그인-NAVER, D3.js, Google Vision AI, 다음 도로명 주소, 카카오지도, TOAST UI Editor, 아임포트-카카오페이
* 사용 도구 : Eclipse IDE, Visual Studio Code
* 사용 DB : Oracle Database 11g
* 사용 서버 : Apache Tomcat 9.0
* 협업 도구 : Github, Google Drive, Notion

### 화면 구성
> 사용자 화면
* 인덱스 : 접속 시 초기 화면
* 로그인 : 로그인 화면, NAVER SNS LOGIN
    * 회원가입 : 사용자 등록 화면, 아이디·닉네임 중복 확인, 비밀번호 정규식
* MY TYDEE
    * Zoomable Sunburst Diagram : TYDEE(구획, 수납함)과 TINY(재화), 마우스 오버로 조회
    * 등록, 수정, 삭제, 검색
    * 영수증 등 업로드 후 열람
* 게시판
    * 정리 정돈 팁 게시판
    * 중고 매매 게시판
* 지도 : 재활용센터, 아름다운 가게
* eshop
    * 전체/카테고리별 상품 보기
    * 장바구니
    * 결제창 : 도로명 주소, 최근 사용한 주소록 불러오기(ajax), 아임포트-카카오페이
    * 결제 목록
* 마이페이지
    * 개인 정보 수정
    *
    
> 관리자 화면
* eshop
    * 상품 등록, 수정, 삭제
* 관리자 화면
