<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Small Business - Start Bootstrap Template</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<link href="${conPath }/css/styles.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
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
<jsp:include page="../main/header.jsp"/>
	<form action="${conPath }/login.do" name="join_frm" method="post">
		<table class="join_table">
			<caption>로그인</caption>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mid" value="${mid }" required="required"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="mpw" required="required"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" class="btn btn-primary">
					<input type="button" value="회원가입" class="btn btn-primary" onclick="location.href='${conPath}/joinView.do'">
				</td>
			</tr>
		</table>	
	</form>	
<jsp:include page="../main/footer.jsp"/>
</body>
</html>