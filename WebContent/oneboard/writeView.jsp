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
	<link href="${conPath }/css/styles.css" rel="stylesheet" type="text/css">
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
<form action="${conPath }/oneBoardWrite.do?mid=${param.myid}&mname=${param.mname}" method="post">
	<table>
		<caption>${param.mname }님 께 일대일 질문하기</caption>
		<tr>
			<td>제목</td>
			<td><input type="text" name="obtitle" required="required"></td>
		</tr>
		<tr>
			<td>본문</td>
			<td><textarea name="obcontent" required="required" style="height:200px;"></textarea></td>
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