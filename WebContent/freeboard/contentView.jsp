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
<c:if test="${replyResult eq '댓글작성 성공'}">
	<script>
		alert('${replyResult}');
	</script>
</c:if>
<c:if test="${replyResult eq '댓글작성 실패'}">
	<script>
		alert('${replyResult}');
		history.back();
	</script>
</c:if>
<c:if test="${replyResult eq '로그인 해주세요'}">
	<script>
		alert('${replyResult}');
		location.href="${conPath }/loginView.do";
	</script>
</c:if>


</head>

<body>
<jsp:include page="../main/header.jsp"/>
<!-- 원글 상세 보여주기 -->
	<table style="margin-bottom:0;">
		<caption>원글</caption>
		<tr>
			<td colspan="8" style="text-align:right"><b>상대MBTI :</b> ${freeBoard.bmbti }<br>
													<b>작성자 :</b> ${freeBoard.mname }</td>
		</tr>
		<tr>
			<td colspan="1" style="text-align:left; font-size:1.5em;">제목 </td>
			<td colspan="7" style="text-align:left; font-size:1.5em;">${freeBoard.btitle }</td>
		</tr>
		<tr>
			<td colspan="1" style="height: 200px; text-align: left;">본문</td>
			<td colspan="7" style="height: 200px; text-align: left;">${freeBoard.bcontent }</td>
		</tr>
		<c:if test="${not empty freeBoard.bfilename }">
		<tr>
			<td colspan="8"><a href="${conPath }/freeboardUp/${freeBoard.bfilename}" target="_blank">${freeBoard.bfilename}</a></td>
		</tr>
		</c:if>
		<tr>
		</tr>
		<tr>
			<td colspan="8" style="text-align:right;">
			조회수 : ${freeBoard.bhit }<br>
			작성일 : ${freeBoard.brdate }
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:left;">
			<a href="${conPath }/freeBoardLike.do?bno=${param.bno }&pageNum=${param.pageNum }">좋아요 : </a>${freeBoard.blike }
			</td>
			<td colspan="6" style="text-align:right;">
			<c:if test="${member.mid eq freeBoard.mid }">
				<button class="btn btn-primary" onclick="location.href='${conPath}/freeBoardModifyView.do?bno=${param.bno }&pageNum=${param.pageNum }'">수정</button>
				<button class="btn btn-primary" onclick="location.href='${conPath}/freeBoardDelete.do?bno=${param.bno }&pageNum=${param.pageNum }'">삭제</button>
			</c:if>
			<c:if test="${member.mid != freeBoard.mid }">
				<button class="btn btn-primary" onclick="location.href='${conPath}/freeBoardReplyView.do?bno=${param.bno }'">답변작성</button>
			</c:if>
				<button class="btn btn-primary" onclick="location.href='${conPath}/freeBoardListView.do?pageNum=${param.pageNum }'">글목록</button>
			</td>
		</tr>
	</table>
	
		<c:if test="${replyList.size() != 0 }">
			<c:forEach var="replys" items="${replyList }">
		<table>
			<tr style="margin:0 auto;">
				<td colspan="8">
					<textarea name=rcontent style="height:50px;" readonly="readonly">댓글 내용 : ${replys.rcontent }</textarea><br>
					<p style="text-align:right;">작성자 : ${replys.mname }</p>
				</td>
			</tr>
		</table>
			</c:forEach>
		</c:if>
	
<!-- 댓글 -->	
		<form action="${conPath}/replyWrite.do?bno=${param.bno }&pageNum=${param.pageNum }&bgroup=${param.bgroup }" method="post">
			<table style="margin-top:10px;" >
			<tr>
				<td colspan="8">
					<textarea name=rcontent style="height:50px;" required="required"></textarea>
					<input type="submit" class="btn" value="댓글 등록" style="text-align:center; background-color:lightgray;">
				<c:if test="${member.mid eq replys.mid }">
					<input type="button" class="btn" value="댓글 삭제" style="text-align:center; background-color:lightgray;"
					onclick="location.href='${conPath}/freeBoardDelete.do?rno=${rno }&bno=${param.bno }&pageNum=${param.pageNum }'">
				</c:if>
				</td>
			</tr>
			</table>
		</form>
			
	

<!-- 원글/답변글 구분  -->
<div class="card text-white bg-secondary my-5 py-4 text-center">
<div class="card-body"><p class="text-white m-0"></p></div>
</div>

<!-- 답변 리스트 보여주기 -->
<c:if test="${answerList.size() != 0 }">
	<c:forEach var="dtos" items="${answerList }">
	
	<table>
		<tr>
			<td colspan="1" style="text-align:left; font-size:1.5em;">제목 </td>
			<td colspan="7" style="text-align:left; font-size:1.5em;">${dtos.btitle }</td>
		</tr>
		<tr>
			<td colspan="1" style="height: 200px; text-align: left;">본문</td>
			<td colspan="7" style="height: 200px; text-align: left;">${dtos.bcontent }</td>
		</tr>
		<c:if test="${not empty dtos.bfilename }">
		<tr>
			<td colspan="8"><a href="${conPath }/freeboardUp/${dtos.bfilename}" target="_blank">${dtos.bfilename}</a></td>
		</tr>
		</c:if>
		<tr>
		</tr>
		<tr>
			<td colspan="8" style="text-align:right;">
			<b>작성자 :</b> ${dtos.mname }<br>
			작성일 : ${dtos.brdate }
			</td>
		</tr>
		<tr>
			<td colspan="8" style="text-align:right;">
			<c:if test="${member.mid != dtos.mid }">
			<button class="btn btn-primary" onclick="location.href='${conPath}/freeBoardReplyView.do?bno=${dtos.bno }'">답변작성</button>
			</c:if>
			</td>
		</tr>
	</table>
	</c:forEach>
</c:if>
	
	
<jsp:include page="../main/footer.jsp"/>
</body>
</html>