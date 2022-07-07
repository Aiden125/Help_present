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
<div class="height_wrap">
<div id="mini_wrap">
	<form action="${conPath }/oneBoardReply.do?mid=${myid}" method="post">
	<input type="hidden" name="obgroup" value="${replyView.obgroup }">
	<input type="hidden" name="obstep" value="${replyView.obstep }">
	<input type="hidden" name="obgetname" value="${replyView.mname }">
		<table>
			<caption>${param.mname }님께 답변</caption>
			<tr>
				<td colspan="2"><p class="left">제목</p>
				<input type="text" class="box_readonly" name="obtitle" value="답변글" readonly="readonly"></td>
			</tr>
			<tr>
				<td colspan="2"><p class="left">내용</p>
				<textarea name="obcontent" class="textarea" required="required"></textarea></td>
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
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>