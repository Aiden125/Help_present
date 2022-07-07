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
	<table>
		<caption>전체회원보기</caption>
		<tr>
			<c:forEach var="dto" items="${list }">
				<td>
					${dto.mid}<br>
					${dto.mpw}<br>
					${dto.mname }<br>
					(${dto.memail })<br>
					(${dto.mbirth })<br>
					<c:if test="${not empty dto.mmbti}">${dto.mmbti }</c:if>
					<c:if test="${empty dto.mmbti}">미등록</c:if><br>
					(${dto.mrdate })<br>
					(${dto.mlike })<br>
					(${dto.mwritecount })
				</td>
			</c:forEach>
		</tr>
	</table>
	<div class="paging">
		<c:if test="${startPage > BLOCKSIZE }">
			[ <a href="${conPath }/memberListView.do?pageNum=${startPage-1 }">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i eq pageNum }">
				[ <b> ${i } </b> ]
			</c:if>
			<c:if test="${i != pageNum }">
				[ <a href="${conPath }/memberListView.do?pageNum=${i }">${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			[ <a href="${conPath }/memberListView.do?pageNum=${endPage + 1 }">다음</a> ]
		</c:if>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>