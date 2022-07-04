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
<!-- 글수정 결과 --> 
<c:if test="${oModifyResult eq '글 수정 성공'}">
	<script>
		alert('${oModifyResult}');
	</script>
</c:if>
<c:if test="${not empty oModifyResult && oModifyResult != '글 수정 성공'}">
	<script>
		alert('${oModifyResult}');
		history.back();
	</script>
</c:if>

<!-- 글삭제 결과 --> 
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

<jsp:include page="../main/header.jsp"/>
<!-- 원글 상세 보여주기 -->
	<table style="margin-bottom:0;">
		<caption>원글</caption>
		<tr>
			<td>제목</td>
			<td>${oContentView.obtitle }</td>
		</tr>
		<tr>
			<td style="height:200px;">본문</td>
			<td>${oContentView.obtitle }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${oContentView.mname }</td>
		</tr>
		<tr>
			<td>작성날짜</td>
			<td>${oContentView.obrdate }</td>
		</tr>
		<tr>
			<td colspan="6" style="text-align:right;">
			<c:if test="${member.mid eq oContentView.mid }">
				<button class="btn btn-primary" onclick="location.href='${conPath}/oneBoardModifyView.do?obno=${param.obno }&pageNum=${param.pageNum }'">수정</button>
				<button class="btn btn-primary" onclick="location.href='${conPath}/oneBoardDelete.do?obno=${param.obno }&pageNum=${param.pageNum }'">삭제</button>
			</c:if>
			<c:if test="${member.mid != oContentView.mid }">
				<button class="btn btn-primary" onclick="location.href='${conPath}/oneBoardReplyView.do?obno=${param.obno }&obgroup=${param.obgroup }'">답변작성</button>
			</c:if>
			</td>
		</tr>
	</table>
	
<!-- 원글/답변글 구분  -->
<div class="card text-white bg-secondary my-5 py-4 text-center">
<div class="card-body"><p class="text-white m-0"></p></div>
</div>

<!-- 답변 리스트 보여주기 -->

<c:if test="${answerList.size() != 0 }">
	<c:forEach var="dtos" items="${answerList }">
	
	<table style="margin-bottom:0;">
		<caption>답변글</caption>
		<tr>
			<td>제목</td>
			<td>${dtos.obtitle }</td>
		</tr>
		<tr>
			<td style="height:200px;">본문</td>
			<td>${dtos.obtitle }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${dtos.mname }</td>
		</tr>
		<tr>
			<td>작성날짜</td>
			<td>${dtos.obrdate }</td>
		</tr>
		<tr>
			<td colspan="6" style="text-align:right;">
			<c:if test="${member.mid eq dtos.mid }">
				<button class="btn btn-primary" onclick="location.href='${conPath}/oneBoardModifyView.do?obno=${dtos.obno }&obgroup=${param.obgroup }'">수정</button>
				<button class="btn btn-primary" onclick="location.href='${conPath}/oneBoardDelete.do?obno=${dtos.obno }&obgroup=${param.obgroup }'">삭제</button>
			</c:if>
			<c:if test="${member.mid != dtos.mid }">
				<button class="btn btn-primary" onclick="location.href='${conPath}/oneBoardReplyView.do?obno=${param.obno }&obgroup=${param.obgroup }'">답변작성</button>
			</c:if>
			</td>
		</tr>
	</table>
	</c:forEach>
</c:if>
	
<jsp:include page="../main/footer.jsp"/>
</body>
</html>