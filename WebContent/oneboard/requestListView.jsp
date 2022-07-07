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
	<link href="${conPath }/css/boardList.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>

<c:if test="${oWriteResult eq '질문등록 성공'}">
	<script>
		alert('${oWriteResult}');
	</script>
</c:if>
<c:if test="${not empty oWriteResult && oWriteResult!= '질문등록 성공'}">
	<script>
		alert('${oWriteResult}');
		history.back();
	</script>
</c:if>

<body>

<jsp:include page="../main/header.jsp"/>
<div class="height_wrap">
<div id="content_top">
	<div class="caption">
		내가 보낸 일대일 질문
	</div>
</div>

<div id="big_wrap_list">
	<table>
		<tr class="tr_top">
			<th>글번호</th><th colspan="4">글제목</th><th>상대방</th><th>작성일</th><th>답변여부</th>
			<c:if test="${list.size() eq 0 }">
				<tr><td colspan="8">내가 한 질문이 없습니다.</td></tr>
			</c:if>
			<c:if test="${list.size() != 0 }">
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.obno }</td>
						<!-- 글제목 -->
						<td colspan="4">
						<a href="${conPath }/oneBoardContentView.do?obno=${dto.obno}&obgroup=${dto.obgroup}">
						${dto.obtitle }</a>
						</td> 
						<td>${dto.obgetname }</td>
						<td>${dto.obrdate }</td>
						<td>${dto.obanswer }</td>
					</tr>
				</c:forEach>
			</c:if>
	</table>
</div>
<div id="content_bottom">
</div>
<!-- 페이징처리  -->
	<div class="paging">
		<c:if test="${startPage > BLOCKSIZE }">
			[ <a href="${conPath }/requestListView.do?mid=${mid }&pageNum=${startPage-1 }">이전</a> ] &nbsp;
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i eq pageNum }">
				[ <b> ${i } </b> ]
			</c:if>
			<c:if test="${i != pageNum }">
				 [ <a href="${conPath }/requestListView.do?mid=${mid }&pageNum=${i}">${i }</a> ] 
			</c:if>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			 &nbsp; [ <a href="${conPath }/requestListView.do?mid=${mid }&pageNum=${endPage + 1 }">다음</a> ]
		</c:if>
	</div>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>