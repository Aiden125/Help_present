<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="${conPath }/css/styletemp.css" rel="stylesheet">

</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="big_wrap">
		<table class="small_table">
			<tr>
				<td>1</td>
			</tr>
			<tr>
				<td>2</td>
			</tr>
			<tr>
				<td>3</td>
			</tr>
			<tr>
				<td>4</td>
			</tr>
		</table>
	</div>
<jsp:include page="../main/footer.jsp"/>
    </body>
</body>
</html>