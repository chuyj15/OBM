# OBM
더조은아카데미 미니프로젝트 3조

<br>

💿[웹 페이지 시연 연상](https://www.youtube.com/watch?v=FXuwoeX0iZo) <br>
🔗[방탈출카페 사이트 OBM(자막있음)](http://joeun27083.cafe24.com/) <br>
🔗[방탈출카페 사이트 OBM](https://www.youtube.com/watch?v=zTWtnNXpxvQ)

***
<br>

![메인화면](https://github.com/chuyj15/OBM/assets/140798105/60c4ab47-8cbb-4667-823c-caac96847449)

<br>

***
# 1. 프로젝트 주제 및 기획의도
 ### 주제❗
방 탈출 상품에 대한 실시간 예약서비스, 회원 관리 서비스
### 기획의도 및 차별화❗️
온라인으로 예약을 받는 기존의 방탈출 웹페이지들은 비회원으로 예약을 진행하고 있었습니다.<br>
이에 착안점을 두어 포인트 적립 제도를 비롯한 고객 관리 기능을 추가하여 차별화된 방탈출 웹페이지를 개발하고자 생각했습니다.

<br><br>

# 2. 프로젝트 구조
### ✨프로젝트 계획도  
|구역|설명|
|--|--|
|Index|회원, 비회원, 관리자 공동 구역|
|Admi|관리자 권한 구역|
|User|회원 권한 구역|
|Layout|전역 JSP에서 사용되는 공통 JSP|
|Static|정적 자료 구역|
|Filter|전역 및 일부 계층에 대한 공통 프로세스|
|DAO|DB에 접근하기 위한 기능 구현|
|DTO|DB 및 각 구역에 접근을 돕는 객체 구역|
|Service|서비스 로직|

***
### ✨계층 구축
Index / Admin / User 권한별로 계층을 나누어 뷰 및 프로세스를 구축 <br>
필터, 레이아웃, 정적 자료 등의 JSP와 DAO, DTO, Service 등 기능적 요소를 담은 Java Class를 기준으로 구분

***
### ✨요구사항 정의서
![요구사항정의서](https://github.com/chuyj15/OBM/assets/140798105/c06855e9-c965-4e66-8863-c1b89e353912)

***
### ✨프로젝트 일정
![projectDate](https://github.com/chuyj15/OBM/assets/140798105/8fafd970-a3bd-4510-bdc4-3224310ea702)

***
### ✨DB 설계
![erd](https://github.com/chuyj15/OBM/assets/140798105/96055521-a23c-4952-ba58-514640b095b0)

***
### ✨플로우 차트
![flowchart](https://github.com/chuyj15/OBM/assets/140798105/0e0331b0-de59-4170-a90e-6ff12cd25611)

***
### ✨화면 설계서
![화면설계서](https://github.com/chuyj15/OBM/assets/140798105/c039b6b6-9b20-408d-9ff8-f9e641efecbd)


***
### ✨개발 환경 및 수행 도구
![servlet jsp](https://github.com/chuyj15/OBM/assets/140798105/9f969e17-e7d7-4ccc-a97e-cc668c788a09)
- 사용 언어
  + <img src="https://img.shields.io/badge/Java-007396?style=flat&logo=Java&logoColor=white"> <img src="https://img.shields.io/badge/SQL-F80000?style=flat&logo=SQL&logoColor=white"> <img src="https://img.shields.io/badge/html-E34F26?style=flat&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=flat&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=flat&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/jquery-0769AD?style=flat&logo=jquery&logoColor=white">
- 프레임워크
  + <img src="https://img.shields.io/badge/bootstrap-7952B3?style=flat&logo=bootstrap&logoColor=white">
- 사용 Tools
  + <img src="https://img.shields.io/badge/eclipseide:4.25.0-2C2255?style=flat&logo=eclipseide&logoColor=white"/> <img src="https://img.shields.io/badge/openjdk:17.0.4.1-686767?style=flat&logo=openjdk&logoColor=black"/> <img src="https://img.shields.io/badge/visualstudiocode:1.74.1-007ACC?style=flat&logo=visualstudiocode&logoColor=white"/> <img src="https://img.shields.io/badge/mysql:8.0.31-4479A1?style=flat&logo=mysql&logoColor=white"/>
- 라이브러리
  +   <img src="https://img.shields.io/badge/commons.io-D22128?style=flat&logo=apache&logoColor=white"> 
- 사용 DB : <img src="https://img.shields.io/badge/mysql:8.0.31-4479A1?style=flat&logo=mysql&logoColor=white"/> 
- 협업 Tools : <img src="https://img.shields.io/badge/trello-0052CC?style=flat&logo=trello&logoColor=white"/>
- 웹 IDE : <img src="https://img.shields.io/badge/github-181717?style=flat&logo=github&logoColor=white"/> <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">
- 서버 :  <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">

***

<br><br>


# 3. 프로젝트 역할분담 👥
|구역|설명|
|--|--|
|강진수|Order DB, OTO DB, Filter 계층 Java Class|
|이유나|Review DB, Index 계층 및 기타 JSP|
|이정훈|Course DB, Admin 계층 JSP|
|추윤주|User DB, User 계층 JSP|

<br><br>

# 4. 프로젝트 핵심 기능 ✅

## 사용자 페이지 😃
### 1) 회원/비회원 실시간 예약제
- 유저가 날짜, 코스, 시간을 선택하여 예약을 위한 정보들 입력하여 예약 진행
- 예약 날짜 선택 시 시스템상의 로컬 날짜 정보를 기준으로 이전 날짜들은 비활성화하여 선택 불가하도록 구현
- DB상의 데이터를 실시간으로 반영하여 이미 예약이 완료 된 시간을 다른 유저가 예약하지 못하도록 비활성화 기능 구현
- 세션상의 로그인 아이디 정보를 통해 비회원 및 회원을 구분하며, 비회원일 시엔 포인트 사용이 불가하고 회원일 시엔 포인트 사용이 가능하도록 구현
![예약하기](https://github.com/chuyj15/OBM/assets/140798105/495a5234-6287-401a-9cbc-4fd05c583c92)

***
### 1) 예약 관리 기능
- 유저가 예약 취소 요청 시, 관리자가 취소 진행 가능하도록 기능 구현
- ![예약관리기능](https://github.com/chuyj15/OBM/assets/140798105/9c874dd6-7798-4dda-b023-40492edf7975)








***
<br><br>


## 5. Troubleshooting ⁉️

|&nbsp;&nbsp;Name&nbsp;&nbsp;|Issues|Problem solving|
|:--:|--|--|
|강진수|⦁ 자동로그인을 비롯한 여러 기능들이 구현이 된 줄 알았으나 배포 이후 여러 결점들이
 발견되었습니다.
로직 결함을 포함하여 정상적으로 기능하지 않는 곳들이 있어서, 여러 환경에서
여러 번 테스트하는 작업이 필요하다는 사실을 느꼈습니다.
<br><br>⦁ 처음 프로젝트 구성 당시에 회의를 적극적으로 진행하고 구체적으로 설계가 되어야 팀원 모두에게 혼란이 적고 체계적으로 프로젝트가 수행될 수 있다는 것을 깨달았습니다. <br><br>⦁ 문제점3: |⦁ 솔루션1: 비동기 통신을 하여 해결하는 방법에 착안 -> AJAX를 이용하여 각 게시판의 데이터를 JSON객체에 담고, 각 게시판을 서버와 비동기 통신하여 해결<br><br>⦁ 솔루션2: 힘<br><br>⦁ 솔루션3:| 
|이유나|⦁ 5일이란 시간에 대한 제약으로 기능 구현에 대한 마음이 앞서 화면 설계 및 기능 정의에 대한 회의를 급하게  끝내다보니 프로젝트 진행 시 약간의 혼선이 있었습니다.
<br><br>⦁ 이를 통해 실제 기능 구현도 중요하지만, 화면 설계 및 기능 정의에 대한 회의가 좀 더 상세하게 이루어져있어야 프로젝트가 원활하게 진행될 수 있다는것을 깨달았습니다.  <br><br>⦁ 문제점3: . <br><br>|⦁ 솔루션1: ..<br><br>⦁솔루션2: .| 
|이정훈|⦁ 관리자 권한 체크를 통해 진입하는 관리자 계층을 구성하는 과정에서,코스 추가에서의 이미지를 등록하는 기능 구현이 다소 어려웠습니다. 하지만팀원들에게 제가 어려움을 겪고있는 부분을 도움 받아 해결해 나갈 수 있어서팀 프로젝트를 하면 좋은 점들을 알게 되었습니다. <br><br>⦁ 아쉬웠던 점으로는 제가 일을 처리할 때 먼저 나서서 의견을 제시하거나 해결방안을 찾는 성격이 아니다보니 이번 팀 프로젝트에서도 팀원들에게 많은 의견제시를 하지 못하여 팀원들이 모든 기획을 하게 만들게 해서 많은 도움이 되지 못한 것 같아 아쉬운 부분으로 남습니다. <br><br> ⦁ 문제점3: . |⦁ 솔루션1:결.<br><br>⦁솔루션2:결<br><br> ⦁솔루션3: id값에 board + ${board.boardKey} 를 부여하여 반복시 해당 태그의 id가 자동으로 boardKey에 맞게 생성되어 겹치지가 않게 만들 수 있게 됐음.  | 
|추윤주|⦁이번 프로젝트를 통해서, 서로 다양한 의견을 제시하고 조율하는 과정에서 데이터베이스 설계와 계층구조 설계를 기존에 생각했던 것보다 더 효율적으로 해서 개발하는 시간을 단축할 수 있는 방법을 알게되었고, 협업과 의사소통의 중요성을 알게 되었습니다. <br><br>⦁ 또한 개발을 하다보니 작업 구역이 겹쳐서, 두 명이 같은 일을 하는 경우도 발생했었는데, 회의 때 각자 맡은 역할을 세분화하는 작업이 필요함을 알게 되었습니다. <br><br>⦁문제점3: 날음|⦁솔루션1: '용<br><br>⦁솔루션2 변경<br><br>⦁솔루션3:| 
