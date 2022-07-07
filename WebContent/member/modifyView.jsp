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
<div id="mini_wrap">
	<form action="${conPath }/modify.do" name="join_frm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="dbmphoto" value="${member.mphoto }">
		<table class="join_table">
			<caption>정보수정</caption>
			<tr>
				<td colspan="2">
					<img src="${conPath }/memberPhotoUp/${member.mphoto}" alt="나의 등록사진" width="150px">
				</td>
			</tr>
			<tr>
				<td colspan="2"><p class="left">프로필 사진수정</p>
				<input type="file" class="box" name="mphoto"></td>
			</tr>
			<tr>
				<td colspan="2"><p class="left">아이디</p>
				<input type="text" name="mid" class="box readonly" value="${member.mid }" readonly="readonly"></td>
			</tr>
			<tr>
				<td colspan="2"><p class="left">비밀번호</p>
				<input type="password" name="mpw" class="box" required="required"></td>
			</tr>
			<tr>
				<td colspan="2"><p class="left">닉네임</p>
				<input type="text" name="mname" class="box" value="${member.mname }" required="required"></td>
			</tr>
			<tr>
				<td colspan="2"><p class="left">나의MBTI</p>
				<select name="mmbti" class="box">
					<option value="미등록">선택</option>
					<option ${member.mmbti == "ENTP" ? "selected":""}>ENTP</option>
					<option ${member.mmbti == "ENTJ" ? "selected":""}>ENTJ</option>
					<option ${member.mmbti == "ENFP" ? "selected":""}>ENFP</option>
					<option ${member.mmbti == "ENFJ" ? "selected":""}>ENFJ</option>
					<option ${member.mmbti == "ESTP" ? "selected":""}>ESTP</option>
					<option ${member.mmbti == "ESTJ" ? "selected":""}>ESTJ</option>
					<option ${member.mmbti == "ESFP" ? "selected":""}>ESFP</option>
					<option ${member.mmbti == "ESFJ" ? "selected":""}>ESFJ</option>
					
					<option ${member.mmbti == "INTP" ? "selected":""}>INTP</option>
					<option ${member.mmbti == "INTJ" ? "selected":""}>INTJ</option>
					<option ${member.mmbti == "INFP" ? "selected":""}>INFP</option>
					<option ${member.mmbti == "INFJ" ? "selected":""}>INFJ</option>
					<option ${member.mmbti == "ISTP" ? "selected":""}>ISTP</option>
					<option ${member.mmbti == "ISTJ" ? "selected":""}>ISTJ</option>
					<option ${member.mmbti == "ISFP" ? "selected":""}>ISFP</option>
					<option ${member.mmbti == "ISFJ" ? "selected":""}>ISFJ</option>
					
					<option value="미등록">모름</option>
				</select>
				<%-- <input type="text" class="box" value="${member.mmbti }" name="mmbti"></td> --%>
			</tr>
			<tr>
				<td colspan="2"><p class="left">이메일</p>
				<input type="text" class="box" name="memail" value="${member.memail }" required="required"></td>
			</tr>
			<tr>
				<td colspan="2"><p class="left">생년월일</p>
				<input type="date" class="box" value="${member.mbirth }" name="mbirth"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
				<label><input type="radio" name="mgender" value="m" checked="checked">남자</label>
      			<label><input type="radio" name="mgender" value="f"> 여자</label>
				</td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="정보수정" class="big_blue_btn">
					<!--  
					<input type="reset" value="초기화" class="btn btn-primary">
					<input type="button" value="이전" class="btn btn-primary" onclick="history.back()">
					-->
				</td>
			</tr>
		</table>	
	</form>
</div>

<jsp:include page="../main/footer.jsp"/>
</body>
</html>