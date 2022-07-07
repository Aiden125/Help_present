<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<link href="${conPath }/css/styles.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-5">
                <a class="navbar-brand" href="${conPath }/freeBoardListView.do"><b>MBTI별 선물 추천하기<c:if test="${not empty member}">${member.mid }님</c:if></b></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="${conPath }/mainView.do">홈</a></li>
                        <c:if test="${empty member }">
                        <li class="nav-item"><a class="nav-link" href="${conPath }/loginView.do">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="${conPath }/joinView.do">회원가입</a></li>
                        <li class="nav-item"><a class="nav-link" href="${conPath }/memberListView.do">회원목록</a></li>
                        </c:if>
                        <c:if test="${not empty member }">
                        <li class="nav-item"><a class="nav-link" href="${conPath }/logout.do">로그아웃</a></li>
                        <li class="nav-item"><a class="nav-link" href="${conPath }/modifyView.do">정보수정</a></li>
                        <li class="nav-item"><a class="nav-link" href="${conPath }/memberListView.do">회원목록</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container px-4 px-lg-5"></div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</body>
</html>