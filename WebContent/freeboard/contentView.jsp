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

<c:if test="${replyDeleteResult eq '댓글삭제 성공'}">
	<script>
		alert('${replyDeleteResult}');
	</script>
</c:if>
<c:if test="${replyDeleteResult eq '댓글삭제 실패'}">
	<script>
		alert('${replyDeleteResult}');
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


<!-- 원글 삭제된 경우 보여주기 -->
<c:if test="${empty freeBoard }">
<div id="content_top">
	<div class="caption">삭제된 글입니다.</div>
	<br>
</div>
</c:if>

<!-- 원글 있는 경우 보여주기 -->
<c:if test="${not empty freeBoard }">
<div id="content_top">
	<div class="caption">
	질문글
	</div>
</div>

<div class="small_wrap_q">
	<div class="title">${freeBoard.btitle }</div><hr class="lightgreen">
	<p>${freeBoard.bcontent }</p><br>
	<c:if test="${not empty freeBoard.bfilename }">
	<p class="center">
	<img src="${conPath }/freeboardUp/${freeBoard.bfilename}" class="center" alt="${freeBoard.bfilename }등록사진" width="150px">
	</p>
	<br>
	</c:if>
	<br>
	<br>
	<div>
		<c:if test="${empty member || member.mid eq freeBoard.mid }">
			좋아요 : ${freeBoard.blike }
		</c:if>
		<c:if test="${not empty member && member.mid != freeBoard.mid}">
			<a href='${conPath}/freeBoardLike.do?bno=${param.bno }&bgroup=${param.bgroup}&mid=${member.mid}'>좋아요 : ${freeBoard.blike }</a>
		</c:if>
	</div>
	<div class="small_text" style="float:left;">
		${freeBoard.mname } * ${freeBoard.brdate } * 조회수 ${freeBoard.bhit }
	</div>
	<div class="right" style="float:right;">
		<c:if test="${not empty admin }">
			<button class="gray_btn" onclick="location.href='${conPath}/freeBoardDelete.do?bno=${param.bno }&pageNum=${param.pageNum }&bgroup=${param.bgroup }'">삭제</button>
		</c:if>
		<c:if test="${member.mid eq freeBoard.mid }">
			<button class="gray_btn" onclick="location.href='${conPath}/freeBoardModifyView.do?bno=${param.bno }&pageNum=${param.pageNum }&bgroup=${param.bgroup }'">수정</button>
			<button class="gray_btn" onclick="location.href='${conPath}/freeBoardDelete.do?bno=${param.bno }&pageNum=${param.pageNum }&bgroup=${param.bgroup }'">삭제</button>
		</c:if>
		<c:if test="${member.mid != freeBoard.mid && empty admin}">
			<button class="blue_btn" onclick="location.href='${conPath}/freeBoardReplyView.do?bno=${param.bno }&pageNum=${param.pageNum }&bgroup=${param.bgroup }'">답변작성</button>
		</c:if>
	</div>
	<br>

</div>

<!-- 댓글 작성하기 -->
<div class="reply_wrap">
	<form action="${conPath}/replyWrite.do?bno=${param.bno }&pageNum=${param.pageNum }&bgroup=${param.bgroup }" method="post">
		<textarea name="rcontent" class="reply_textarea" required="required"></textarea>
		<div class="right">
			<input type="submit" class="gray_btn" value="댓글 등록">
		</div>
	</form>
</div>

<!-- 댓글 보여주기 -->
<div class="reply_wrap">
	<c:if test="${replyList.size() != 0 }">
		<c:forEach var="replys" items="${replyList }">
		<hr>
		<p>댓글 : ${replys.rcontent }</p>
		<br>
		<div class="small_text" style="float:left;">${replys.mname } * ${replys.rrdate }</div>
		<c:if test="${member.mid eq replys.mid }">
		<div style="float:right">
			<input type="button" class="gray_btn_margin" value="삭제"
			onclick="location.href='${conPath}/replyDelete.do?rno=${replys.rno }&bno=${param.bno }&pageNum=${param.pageNum }&bgroup=${param.bgroup }'">
		</div>
		</c:if>
		<c:if test="${not empty admin }">
		<div style="float:right">
			<input type="button" class="gray_btn_margin" value="삭제"
			onclick="location.href='${conPath}/replyDelete.do?rno=${replys.rno }&bno=${param.bno }&pageNum=${param.pageNum }&bgroup=${param.bgroup }'">
		</div>
		</c:if>
		<br>
		<br>
		</c:forEach>
	</c:if>
</div>
</c:if>

<c:if test="${answerList.size() eq 0 }">
<hr>
<hr>
<div id="content_top">
	<div class="caption">
	아직 등록된 답변이 없습니다.
	</div>
</div>
<div class="height_wrap_mini">
</div>
</c:if>
<!-- 답변 리스트 보여주기 -->

<c:if test="${answerList.size() != 0 }">
<!-- 원글/답변글 구분  -->
<hr>
<hr>
<div id="content_top">
	<div class="caption">
	</div>
</div>


<div id="content_top">
</div>
	<c:forEach var="dtos" items="${answerList }">
<div class="small_wrap_a">

	<div class="title">${dtos.btitle }</div>
	<hr>
	<p>${dtos.bcontent }</p>
	<br>
	<c:if test="${not empty dtos.bfilename }">
		<p class="center">
			<img src="${conPath }/freeboardUp/${dtos.bfilename}" class="center" alt="${dtos.bfilename }등록사진" width="150px">
		</p>
		<br>
	</c:if>
	
	<br>
	<br>
	<div>
		<c:if test="${empty member}">
			좋아요 : ${freeBoard.blike }
		</c:if>
		<c:if test="${not empty member}">
			<a href='${conPath}/freeBoardLike.do?bno=${dtos.bno }&bgroup=${param.bgroup}&mid=${member.mid}'>좋아요 : ${dtos.blike }</a>
		</c:if>
	</div>
	
	<div class="small_text" style="float:left;">
		 ${dtos.mname } * ${dtos.brdate }
	</div>
	<div class="right" style="float:right;">
		<c:if test="${member.mid eq dtos.mid }">
			<button class="gray_btn" onclick="location.href='${conPath}/freeBoardModifyView.do?bno=${dtos.bno }'">수정</button>
			<button class="gray_btn" onclick="location.href='${conPath}/freeBoardDelete.do?bno=${dtos.bno }'">삭제</button>
		</c:if>
		<c:if test="${not empty admin }">
			<button class="gray_btn" onclick="location.href='${conPath}/freeBoardDelete.do?bno=${dtos.bno }'">삭제</button>
		</c:if>
		<c:if test="${member.mid != dtos.mid && empty admin}">
			<button class="blue_btn" onclick="location.href='${conPath}/freeBoardReplyView.do?bno=${dtos.bno }'">답변작성</button>
		</c:if>
	</div>
	<br>	

</div>
	</c:forEach>
</c:if>
	
	
	
<jsp:include page="../main/footer.jsp"/>
</body>
</html>