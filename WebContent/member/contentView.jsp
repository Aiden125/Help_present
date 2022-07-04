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
	<table>
		<c:if test="${contentView.mid eq myid }">
		<caption>나의 프로필</caption>
		</c:if>
		
		<c:if test="${contentView.mid != myid }">
		<caption>${contentView.mname }님 프로필</caption>
		</c:if>
		<tr>
			<td>닉네임</td><td>MBTI</td><td>쓴 글 수</td><td>추천 수</td>
		</tr>
		<tr>
			<td>${contentView.mname }</td>
			<td>${contentView.mmbti }</td>
			<td>${contentView.mwritecount }</td>
			<td>${contentView.mlike }</td>
		</tr>
		<c:if test="${contentView.mid != myid }">
		<tr>
			<td colspan="4">
				<button class="btn btn-primary" onclick="location.href='${conPath}/writeOneBoardView.do?mname=${contentView.mname }&myid=${myid }'">일대일 질문</button>
			</td>
		</tr>
		</c:if>
	</table>
	
</body>
</html>