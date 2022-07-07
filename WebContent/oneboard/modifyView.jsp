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
<div id="mini_wrap">
	<form action="${conPath }/oneBoardModify.do?obno=${dto.obno}&obgroup=${dto.obgroup}" method="post">
		<table>
			<caption>${dto.obno }번 글 수정하기</caption>
			<tr>
				<td colspan="2"><p class="left">제목</p>
				<input type="text" name="obtitle" class="box" value="${dto.obtitle }" required="required"></td>
			</tr>
			<tr>
				<td colspan="2"><p class="left">내용</p>
				<textarea name="obcontent" class="textarea" required="required">${dto.obcontent }</textarea></td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" class="big_blue_btn" value="수정하기">
				</td>
			</tr>
		</table>
	</form>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>