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
<c:if test="${empty member }">
	<script>
		alert('로그인 해주세요');
		location.href="loginView.do";
	</script>
</c:if>

<jsp:include page="../main/header.jsp"/>
	<form action="${conPath }/modify.do" name="join_frm" method="post">
		<table class="join_table">
			<caption>정보수정</caption>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mid" value="${member.mid }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="mpw" required="required"></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="mname" value="${member.mname }" required="required"></td>
			</tr>
			<tr>
				<th>나의 MBTI</th>
				<td><input type="text" value="${member.mmbti }" name="mmbti"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="memail" value="${member.memail }" required="required"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
				<label><input type="radio" name="mgender" value="m" checked="checked"> 남자</label>
      			<label><input type="radio" name="mgender" value="f"> 여자</label>
				</td>
			</tr>
			<tr class="lasttr">
				<th>생년월일</th>
				<td><input type="date" value="${member.mbirth }" name="mbirth"></td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="정보수정" class="btn btn-primary">
					<input type="reset" value="초기화" class="btn btn-primary">
					<input type="button" value="이전" class="btn btn-primary" onclick="history.back()">
				</td>
			</tr>
		</table>	
	</form>	
<jsp:include page="../main/footer.jsp"/>
</body>
</html>