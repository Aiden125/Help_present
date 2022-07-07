<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
<c:if test="${empty member }">
	<script>
		alert('로그인 해주세요');
		location.href="${conPath }/loginView.do";
	</script>
</c:if>

<jsp:include page="../main/header.jsp"/>
<div id="mini_wrap">
	<form action="${conPath }/freeBoardWrite.do" method="post" enctype="multipart/form-data">
		<table>
			<caption>글쓰기</caption>
			<tr>
				<td colspan="2"><p class="left">제목</p>
				<input type="text" class="box" name="btitle" required="required"></td>
			</tr>
			<tr>
				<td colspan="2"><p class="left">선물 받을 사람의 MBTI</p>
					<select name="bmbti" class="box">
						<option value="미등록">선택</option>
						<option>ENTP</option>
						<option>ENTJ</option>
						<option>ENFP</option>
						<option>ENFJ</option>
						<option>ESTP</option>
						<option>ESTJ</option>
						<option>ESFP</option>
						<option>ESFJ</option>
						
						<option>INTP</option>
						<option>INTJ</option>
						<option>INFP</option>
						<option>INFJ</option>
						<option>ISTP</option>
						<option>ISTJ</option>
						<option>ISFP</option>
						<option>ISFJ</option>
						
						<option value="미등록">모름</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2"><p class="left">내용</p>
				<textarea name="bcontent" class="textarea" required="required"></textarea></td>
			</tr>
			<tr>
				<td class="right">사진첨부</td>
				<td class="right"><input type="file" name="bfilename" ></td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" class="big_blue_btn" value="글등록">
					<!--  <input type="button" class="btn btn-primary" value="글목록" onclick="location.href='${conPath}/freeBoardListView.do'"> -->
				</td>
			</tr>
		</table>
	</form>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>