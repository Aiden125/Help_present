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
	<form action="${conPath }/freeBoardReply.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bgroup" value="${replyView.bgroup }">
		<input type="hidden" name="bstep" value="${replyView.bstep }">
		<input type="hidden" name="bindent" value="${replyView.bindent }">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<table>
			<caption>답변하기</caption>
			<tr>
				<td colspan="2"><p class="left">제목</p>
				<input type="text" class="box_readonly" name="btitle" value="답변글" readonly="readonly"></td>
			</tr>
			<tr>
				<td colspan="2"><p class="left">선물 받을 사람의 MBTI</p>
				<input type="text" class="box_readonly" name="bmbti" value="답변글" readonly="readonly">
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
					<input type="submit" class="big_blue_btn" value="답변등록">
				</td>
			</tr>
		</table>
	</form>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>