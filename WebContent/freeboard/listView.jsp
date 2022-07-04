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

<!-- 로그인 결과 -->
<c:if test="${not empty loginErrorMsg }">
	<script>
		alert('${loginErrorMsg}');
		history.back();
	</script>
</c:if>

<!-- 글쓰기 결과 --> 
<c:if test="${writeResult eq '글쓰기 성공'}">
	<script>
		alert('${writeResult}');
	</script>
</c:if>
<c:if test="${not empty writeResult && writeResult != '글쓰기 성공'}">
	<script>
		alert('${writeResult}');
		history.back();
	</script>
</c:if>

<!-- 글수정 결과 --> 
<c:if test="${modifyResult eq '글수정 성공'}">
	<script>
		alert('${modifyResult}');
	</script>
</c:if>
<c:if test="${not empty modifyResult && modifyResult != '글수정 성공'}">
	<script>
		alert('${modifyResult}');
		history.back();
	</script>
</c:if>

<!-- 답변 결과 --> 
<c:if test="${replyResult eq '답변등록 성공'}">
	<script>
		alert('${replyResult}');
	</script>
</c:if>
<c:if test="${not empty replyResult && replyResult != '답변등록 성공'}">
	<script>
		alert('${replyResult}');
		history.back();
	</script>
</c:if>

<!-- 삭제 결과 --> 
<c:if test="${deleteResult eq '글삭제 성공'}">
	<script>
		alert('${deleteResult}');
	</script>
</c:if>
<c:if test="${not empty deleteResult && deleteResult != '글삭제 성공'}">
	<script>
		alert('${deleteResult}');
		history.back();
	</script>
</c:if>

</head>
<body>

<jsp:include page="../main/header.jsp"/>
	<table style="text-align:'center'">
		<caption>게시판</caption>
		<tr>
			<th>글번호</th><th>상대MBTI</th><th colspan="2">글제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
			<c:if test="${list.size() eq 0 }">
				<tr><td colspan="7">해당 페이지 글이 없습니다</td></tr>
			</c:if>
			<c:if test="${list.size() != 0 }">
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.bno }</td>
						<td>${dto.bmbti }</td>
						
						<!-- 글제목 -->
						<td colspan="2" class="left">
						
							<!-- 답변글 들여쓰기 -->
							<c:forEach var="i" begin="1" end="${dto.bindent }">
								<c:if test="${i eq dto.bindent }">
									└
								</c:if>
								<c:if test="${i != dto.bindent }">
									&nbsp; &nbsp;
								</c:if>
							</c:forEach>
							<a href="${conPath }/freeBoardContentView.do?bno=${dto.bno }&pageNum=${pageNum }&bgroup=${dto.bgroup}&bindent=${dto.bindent}">
							${dto.btitle }</a>
							
							<!-- 조회수 10이상이면 * 넣기 -->
							<c:if test="${dto.bhit >= 10 }">
								<b> * </b>
							</c:if>
						</td> 
						<td>${dto.mname }</td>
						<td>${dto.brdate }</td>
						<td>${dto.bhit }</td>
					</tr>
				</c:forEach>
			</c:if>
		</tr>
		<tr>
			<td colspan="7">
				<a class="btn btn-primary" href="${conPath }/freeBoardWriteView.do">글쓰기</a>
			</td>
		</tr>
	</table>
	
<!-- 페이징처리  -->
	<div class="paging">
		<c:if test="${startPage > BLOCKSIZE }">
			[ <a href="${conPath }/freeBoardListView.do?pageNum=${startPage-1 }">이전</a> ] &nbsp;
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i eq pageNum }">
				[ <b> ${i } </b> ]
			</c:if>
			<c:if test="${i != pageNum }">
				 [ <a href="${conPath }/freeBoardListView.do?pageNum=${i}">${i }</a> ] 
			</c:if>
		</c:forEach>
			<%--
			<c:if test="${endPage != pageCnt}">
			. . . . [ <a href="${conPath }/freeBoardListView.do?pageNum=${pageCnt }">${pageCnt }</a> ]
			</c:if>
			--%>
		<c:if test="${endPage < pageCnt }">
			 &nbsp; [ <a href="${conPath }/freeBoardListView.do?pageNum=${endPage + 1 }">다음</a> ]
		</c:if>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>