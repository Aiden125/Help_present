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
	<form action="${conPath }/freeBoardWrite.do" method="post" enctype="multipart/form-data">
	<table>
		<caption>글쓰기</caption>
		<tr>
			<td>제목</td>
			<td><input type="text" name="btitle" required="required"></td>
		</tr>
		<tr>
			<td>선물 받을 분의 MBTI</td>
			<td>
				<select name="bmbti" style="width:300px;">
					<option value="none">선택</option>
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
				</select>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="bcontent" required="required" style="height:200px;"></textarea></td>
		</tr>
		<tr>
			<td>사진첨부</td>
			<td><input type="file" name="bfilename" ></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" class="btn btn-primary" value="글등록">
				<input type="button" class="btn btn-primary" value="글목록" onclick="location.href='${conPath}/freeBoardListView.do'">
			</td>
		</tr>
	</table>
</form>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>