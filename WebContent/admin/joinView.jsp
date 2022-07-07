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
	<form action="${conPath }/adminJoin.do" name="join_frm" method="post">
		<table class="join_table">
			<caption>관리자 등록</caption>
			<tr>
			</tr>
			<tr>
				<td colspan="2"><p class="left">아이디 <span class="red">*</span> </p>
				<input type="text" class="box" name="aid" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2"><p class="left">비밀번호 <span class="red">*</span></p>
				<input type="password" class="box" name="apw" required="required"></td>
			</tr>
			<tr>
				<td colspan="2"><p class="left">이름 <span class="red">*</span></p>
				<input type="text" class="box" name="aname" required="required">
				</td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="관리자등록" class="big_blue_btn">
				</td>
			</tr>
		</table>	
	</form>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>