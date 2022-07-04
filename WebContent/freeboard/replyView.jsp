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
	<form action="${conPath }/freeBoardReply.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="bgroup" value="${replyView.bgroup }">
	<input type="hidden" name="bstep" value="${replyView.bstep }">
	<input type="hidden" name="bindent" value="${replyView.bindent }">
	<input type="hidden" name="pageNum" value="${param.pageNum }">
	<table>
		<caption>${param.bno }번 글 답변</caption>
		<tr>
			<td>제목</td>
			<td><input type="text" name="btitle" required="required"></td>
		</tr>
		<tr>
			<td>상대방 MBTI</td>
			<td><input type="text" name="bmbti" value="답변글" readonly="readonly"></td>
		</tr>
		<tr>
			<td>본문</td>
			<td><textarea name="bcontent" required="required" style="height:200px;"></textarea></td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td><input type="file" name="bfilename" ></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" class="btn btn-primary" value="답변등록">
				<input type="button" class="btn btn-primary" value="글목록" onclick="location.href='${conPath}/freeBoardListView.do'">
				<input type="button" class="btn btn-primary" value="이전" onclick="location.href='history.back();'">
			</td>
		</tr>
	</table>
</form>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>