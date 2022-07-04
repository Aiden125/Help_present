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
<jsp:include page="../main/header.jsp"/>
<form action="${conPath }/oneBoardModify.do?obno=${dto.obno}&obgroup=${dto.obgroup}" method="post">
	<table>
		<caption>${dto.obno }번 글 수정하기</caption>
		<tr>
			<td>제목</td>
			<td><input type="text" name="obtitle" required="required" value="${dto.obtitle }"></td>
		</tr>
		<tr>
			<td>본문</td>
			<td><textarea name="obcontent" required="required" style="height:200px;">${dto.obcontent }</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" class="btn btn-primary" value="수정하기">
				<input type="button" class="btn btn-primary" value="글목록" onclick="location.href='${conPath}/freeBoardListView.do'">
			</td>
		</tr>
	</table>
</form>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>