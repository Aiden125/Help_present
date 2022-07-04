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
	<link href="${conPath }/css/style.css" rel="stylesheet" type="text/css">
	<link href="${conPath }/css/styles.css" rel="stylesheet" type="text/css">
	<script src="${conPath }/js/join.js"></script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<form action="${conPath }/join.do" name="join_frm" method="post" enctype="multipart/form-data">
		<table class="join_table">
			<caption>회원가입</caption>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mid" required="required"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="mpw" required="required"></td>
			</tr>
			<tr>
				<th>비밀번호체크</th>
				<td><input type="password" name="mpwChk" required="required"></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="mname" required="required"></td>
			</tr>
			<tr>
				<th>나의 MBTI</th>
				<td><input type="text" name="mmbti"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="memail" required="required"></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="mphoto"></td>
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
				<td><input type="date" name="mbirth"></td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="회원가입" class="btn btn-primary">
					<input type="reset" value="초기화" class="btn btn-primary">
					<input type="button" value="로그인" class="btn btn-primary" onclick="location.href='${conPath }/loginView.do'">
				</td>
			</tr>
		</table>	
	</form>	
<jsp:include page="../main/footer.jsp"/>
</body>
</html>