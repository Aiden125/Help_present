<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<c:if test="${not empty joinResult }">
	<script>
		alert('${joinResult}');
	</script>
</c:if>

<!-- ${requestScope.joinErrorMsg } -->
<c:if test="${not empty joinErrorMsg }">
	<script>
		alert('${joinErrorMsg}');
		history.back();
	</script>
</c:if>
<body>
<jsp:include page="../main/header.jsp"/>
<div class="height_wrap">
<div id="mini_wrap">
	<form action="${conPath }/login.do" name="join_frm" method="post">
		<table>
			<caption>로그인</caption>
			<tr>
			</tr>
			<tr>
				<td><p class="left">아이디</p><input type="text" name="mid" class="box" value="${mid }" required="required"></td>
			</tr>
			<tr>
				<td>
				<p class="left">비밀번호</p>
				<input type="password" name="mpw" class="box" required="required">
				</td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" class="big_blue_btn">
					<!--
					<input type="button" value="회원가입" class="blue_btn" onclick="location.href='${conPath}/joinView.do'">
					-->
				</td>
			</tr>
		</table>	
	</form>
</div>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>