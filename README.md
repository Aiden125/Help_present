# :pushpin: Help_present
>MBTI별 선물 추천 커뮤니티

</br>

## 1. 제작 기간 & 참여 인원
- 2022년 6월 27일 ~ 7월 7일
- 개인 프로젝트(1명)

</br>

## 2. 사용 기술
#### `Back-end`
  - Java 8
  - Oracle 11
  
#### `DevOps`
  - Tomcat 9.0
  - eclipse
  - Windows 10

#### `Front-end`
  - HTML/CSS
  - JavaScript
  - JQuery 3.6

</br>

## 3. ERD 설계
![개인프로젝트 erd](https://user-images.githubusercontent.com/101315869/188383501-a85071e5-dec4-4f1b-9098-6bae738b1225.jpg)


## 4. 핵심 기능
- 내가 원하는 글을 검색하여 조회 가능합니다.
- 내가 원하는 상대방에게 1:1 질문 받기, 답변하기 등이 가능합니다.
- 내가 원하는 멤버를 MBTI 필터링을 통해 확인할 수 있습니다.
- 특정 게시글 좋아요 및 멤버 추천이 가능합니다.

<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. 전체 흐름
![개인플젝2](https://user-images.githubusercontent.com/101315869/188384086-cec26664-e79c-4716-ad47-8e46abb03d88.jpg)

### 4.2. 핵심 기능

- **게시글 검색기능** :pushpin: [코드 확인](https://github.com/Aiden125/Help_present/blob/e4527e0f9ceb95f298770604816080632d655803/src/com/pro/present/dao/FreeBoardDao.java#L38-L51)
  - 통합검색을 통해 게시물의 MBTI, 제목, 본문 등을 검색가능하도록 구현했습니다.
  
- **질문글과 답변글 함께보기** :pushpin: [코드 확인](https://github.com/Aiden125/Help_present/blob/e4527e0f9ceb95f298770604816080632d655803/src/com/pro/present/service/BcontentViewService.java#L15-L35)
  - 질문글, 답변글, 댓글보기 서비스를 한 번에 처리하여 한 페이지에서 볼 수 있도록 구현했습니다.

- **멤버 추천 하기** :pushpin: [코드 확인](https://github.com/Aiden125/Help_present/blob/13605ea910b86e60d31f1b7bd5e960cfa6ea5a29/src/com/pro/present/dao/MemberLikeDao.java#L32-L120)
  - 멤버 추천을 했는지 안 했는지에 따라서 추천 혹은 취소가 되도록 동기식 구현했습니다.

</div>
</details>

</br>

## 5. 핵심 트러블 슈팅
### 5.1. MBTI 필터링 기능 구현
- 사용자가 MBTI를 표준과 다르게 작성하는 방향이나 방식이해가 어려울 수 있는 문제가 있었습니다.
- MBTI별 회원 검색을 할 경우는 option 태그를 통해 표준 MBTI만 검색이 가능하도록 구현하였습니다.
<details>
<summary><b>코드 펼치기</b></summary>
<div markdown="1">

https://github.com/Aiden125/Help_present/blob/13605ea910b86e60d31f1b7bd5e960cfa6ea5a29/src/com/pro/present/dao/MemberDao.java#L286-L331
https://github.com/Aiden125/Help_present/blob/13605ea910b86e60d31f1b7bd5e960cfa6ea5a29/WebContent/member/listView.jsp#L42-L70

</div>
</details>

</br>

### 5.2. 질문과 답변 함께보기
- 기존 게시판의 경우 질문글과 답변글이 따로 보여 UI적인 불편함이 있었습니다.
- 이에 글번호와 글 그룹번호를 파라미터로 받아 한 페이지 내에서 함께 보여주는 형식으로 구현했습니다.
<details>
<summary><b>코드 펼치기</b></summary>
<div markdown="1">

https://github.com/Aiden125/Help_present/blob/13605ea910b86e60d31f1b7bd5e960cfa6ea5a29/src/com/pro/present/service/BcontentViewService.java#L15-L35
https://github.com/Aiden125/Help_present/blob/13605ea910b86e60d31f1b7bd5e960cfa6ea5a29/WebContent/freeboard/contentView.jsp#L55-L215

</div>
</details>

</br>

### 5.3. 멤버 추천 및 게시글 좋아요
- 멤버 추천에 따른 순위 변화 및 좋아요 기능을 이미 누른 사람이 다시 못누르게 구현하고자 했습니다.
- 멤버 추천여부를 다룬 테이블을 따로 두어 동기식 방법으로 구현했습니다.

<details>
<summary><b>코드 펼치기</b></summary>
<div markdown="1">

https://github.com/Aiden125/Help_present/blob/13605ea910b86e60d31f1b7bd5e960cfa6ea5a29/src/com/pro/present/dao/MemberLikeDao.java#L32-L120
https://github.com/Aiden125/Help_present/blob/13605ea910b86e60d31f1b7bd5e960cfa6ea5a29/src/com/pro/present/dao/LikeBoardDao.java#L32-L112

</div>
</details>

</br>

### 5.4. ajax통신을 통한 로그인 검증
- 중복확인 버튼 등을 따로 누르지 않고 로그인 검증을 처리하는 방법을 고려하였습니다.
- ajax 통신을 통한 비동기식 로그인 검증을 구현했습니다.

<details>
<summary><b>코드 펼치기</b></summary>
<div markdown="1">

https://github.com/Aiden125/Help_present/blob/13605ea910b86e60d31f1b7bd5e960cfa6ea5a29/WebContent/member/joinView.jsp#L13-L101

</div>
</details>


</br>

## 6. 차후 개선 사항
- 로그인 보안 강화(password 암호화 등)
- 입력된 데이터 기반 MBTI별 인기 선물 추천
- 실제로 사용가능하도록 배포 사이트로 배포

</br>

## 7. 회고 / 느낀점
>뜬구름 잡는 느낌으로 배워가던 내용들을 조금 더 웹에 맞게 구현을 해본 것 같은 기회였다. 단순히 기능을 여러가지 늘려가기보다 기능이 적더라도 실제로 쓸 수 있을 정도의 구현을 하는 것에 초점을 맞춰야겠다.
</br> [자세한 회고](https://dosmallthing.tistory.com/67)
  

  
  
  
