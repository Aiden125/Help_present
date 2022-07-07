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
<c:if test="${memberLikeResult eq '로그인 해주세요'}">
	<script>
		alert("${memberLikeResult}");
		location.href="${conPath}/loginView.do";
	</script>	
</c:if> 

<body>
<jsp:include page="../main/header.jsp"/>
<div id="content_top">
	<div class="caption">
		전체 회원목록
	</div>
</div>
	<c:forEach var="dto" items="${list }">
	
		<c:if test="${list.size() eq 0 }">
		<div class="small_wrap">
			<table>
				<tr>
					<td colspan="7">등록된 회원이 없습니다.</td>
				</tr>
			</table>
		</div>
		</c:if>
		
		<c:if test="${list.size()!=0 }">
		<div class="small_wrap">
			<table>
				<tr>
					<td colspan="2" rowspan="2">
						<img src="${conPath }/memberPhotoUp/${dto.mphoto}" alt="${dto.mname }등록사진" width="150px">
					</td>
					<td rowspan="2"><b>MBTI</b><br><br>
									${dto.mmbti }
					</td>
					<td rowspan="2"><b>닉네임</b><br><br>
									${dto.mname }
					</td>
					<td rowspan="2"><b>글 작성 수</b><br><br>
									${dto.mwritecount }
					</td>
					<td colspan="2" rowspan="2">
						<c:if test="${empty member || member.mid == dto.mid}">
							추천수
						</c:if>
						<c:if test="${not empty member && member.mid != dto.mid && param.pageNum eq null}">
							<a href="${conPath}/mlike.do?mid=${dto.mid}&mmyid=${member.mid}">추천수</a>
						</c:if>
						<c:if test="${not empty member && member.mid != dto.mid && param.pageNum != null}">
							<a href="${conPath}/mlike.do?mid=${dto.mid}&mmyid=${member.mid}&pageNum=${param.pageNum }">추천수</a>
						</c:if>
						<br>${dto.mlike }
					</td>
					<td colspan="2" rowspan="2">
						<c:if test="${member.mid != dto.mid}">
							<input type="button" class="blue_btn" value="질문하기"
							onclick="location.href='${conPath}/writeOneBoardView.do?mname=${dto.mname }&myid=${member.mid }'">
						</c:if>
						<c:if test="${member.mid eq dto.mid}">
							내 프로필
						</c:if>
					</td>
				</tr>
			</table>
		</div>
		</c:if>
	</c:forEach>
	
<div id="content_bottom">
</div>
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