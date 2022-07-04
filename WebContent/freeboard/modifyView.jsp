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
	<form action="${conPath }/freeBoardModify.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="pageNum" value="${param.pageNum }">
	<input type="hidden" name="bno" value="${modifyView.bno }">
	<input type="hidden" name="dbfilename" value="${modifyView.bfilename }">
	<table>
		<caption>${param.bno }번 글 수정</caption>
		<tr>
			<td>제목</td>
			<td><input type="text" name="btitle" value="${modifyView.btitle }" required="required"></td>
		</tr>
		<tr>
			<td>상대방 MBTI</td>
			<td><input type="text" name="bmbti" value="${modifyView.bmbti }"></td>
		</tr>
		<tr>
			<td>본문</td>
			<td><textarea name="bcontent" required="required" style="height:200px;">${modifyView.bcontent }</textarea></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<input type="file" name="bfilename" class="btn"> 원첨부파일:
					<c:if test="${not empty modifyView.bfilename }">
				 		<a href="${conPath }/fileboardUp/${modifyView.bfilename}" target="_blank">${modifyView.bfilename}</a>
				 	</c:if>
				 	<c:if test="${empty modifyView.bfilename }">
				 		없음
				 	</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" class="btn btn-primary" value="글수정">
				<input type="button" class="btn btn-primary" value="글목록" onclick="location.href='${conPath}/freeBoardListView.do?pageNum=${param.pageNum }'">
				<input type="button" class="btn btn-primary" value="이전" onclick="history.back();">
			</td>
		</tr>
	</table>
</form>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>