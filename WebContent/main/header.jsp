<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="${conPath }/css/headerFooter.css" rel="stylesheet">
</head>
<body>

<div id=nav_wrap>
	<div id=nav_bar>
		<div id=nav_bar_title>
			<a class="nav-link" href="${conPath }/freeBoardListView.do">
				<b>MBTI별 선물 추천하기<c:if test="${not empty admin }">(관리자로 접속 중)</c:if>
				</b>
			</a>
		</div>
		
		<div>
			<ul id="nav_bar_content">
				
	            <c:if test="${empty member && empty admin}">
	            <li class="nav_item"><a class="nav-link" href="${conPath }/adminLoginView.do">관리자</a></li>
	            <li class="nav_item"><a class="nav-link" href="${conPath }/memberListView.do">회원목록</a></li>
	            <li class="nav_item"><a class="nav-link" href="${conPath }/joinView.do">회원가입</a></li>
	            <li class="nav_item"><a class="nav-link" href="${conPath }/loginView.do">로그인</a></li>
	            </c:if>
	            
	            <c:if test="${not empty member}">
	            <li class="nav_item"><a class="nav-link" href="${conPath }/logout.do">로그아웃</a></li>
	            <li class="nav_item"><a class="nav-link active" aria-current="page" href="${conPath }/responseListView.do?mid=${member.mid}">1:1받은 질문</a></li>
	            <li class="nav_item"><a class="nav-link active" aria-current="page" href="${conPath }/requestListView.do?mid=${member.mid}">1:1한 질문</a></li>
	            <li class="nav_item"><a class="nav-link" href="${conPath }/memberListView.do">회원목록</a></li>
	            <li class="nav_item"><a class="nav-link" href="${conPath }/modifyView.do">정보수정</a></li>
	            </c:if>
	            
	            <c:if test="${empty member && not empty admin }">
	            <li class="nav_item"><a class="nav-link" href="${conPath }/logout.do">로그아웃</a></li>
	            <li class="nav_item"><a class="nav-link" href="${conPath }/memberListView.do">회원목록</a></li>
	            <li class="nav_item"><a class="nav-link" href="${conPath }/adminJoinView.do">관리자 등록</a></li>
	            </c:if>
	            
				<li class="nav_item"><a class="nav-link" href="${conPath }/freeBoardListView.do">홈</a></li>
			</ul>
		</div>
		
	</div>
</div>
</body>
</html>