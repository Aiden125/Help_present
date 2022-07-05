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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			
			// id check
			$('input[name="mid"]').keyup(function(){
				var mid = $('input[name="mid"]').val();
				
				$.ajax({
					url : '${conPath}/idCheck.do',
					data : 'mid='+mid,
					type : 'get',
					dataType : 'html',
					success : function(data){
						$('#idCheckResult').html(data);
					}
				});
			});
			
			// pw check
			$('input[name="mpw"], input[name="mpwChk"]').keyup(function(){
				var mPw = $('input[name="mpw"]').val();
				var mPwChk = $('input[name="mpwChk"]').val();
				if(mPw == mPwChk){
					$('#pwCheckResult').text('비밀번호 일치');
				}else{
					$('#pwCheckResult').html('<b>비밀번호 불일치</b');
				}
			});// pw check
			
			// name check
			$('input[name="mname"]').keyup(function(){
				var mname = $('input[name="mname"]').val();
				
				$.ajax({
					url : '${conPath}/nameCheck.do',
					data : 'mname='+mname,
					type : 'get',
					dataType : 'html',
					success : function(data){
						$('#nameCheckResult').html(data);
					}
				});
			});
			
			$('input[name="memail"]').keyup(function(){
				var patternEmail = /^[a-zA-Z0-9_]+@[a-zA-Z0-9]+(\.[a-zA-Z]+){1,2}$/; // 메일 패턴
				var memail = $('input[name="memail"]').val();
				if(patternEmail.test(memail)){
					$.ajax({
						url : '${conPath}/emailCheck.do',
						type : 'get',
						dataType : 'html',
						data : "memail="+memail,
						success : function(data){
							$('#emailCheckResult').html(data);
						}
					});//ajax
				}else if(!memail){
					$('#emailCheckResult').html(' &nbsp; ');
				}else{
					$('#emailCheckResult').html('메일 형식을 지켜주세요');
				}//if
			});// mEmail keyup 이벤트
			
			
			// 조건 부합x인 경우 가입 못하게
			$('form').submit(function(){
				var idCheckResult = $('#idCheckResult').text().trim();
				var pwCheckResult = $('#pwCheckResult').text().trim();
				var nameCheckResult = $('#nameCheckResult').text().trim();
				var emailCheckResult = $('#emailCheckResult').text().trim();
				if(idCheckResult != '사용가능한 ID입니다'){
					alert('아이디를 확인해주세요')
					$('#idCheckResult').focus();
					return false;
				}else if(pwCheckResult != '비밀번호 일치'){
					alert('비밀번호를 확인해주세요')
					return false;
				}else if(nameCheckResult != '사용가능한 닉네임입니다'){
					alert('닉네임을 확인해주세요')
					return false;
				}else if(emailCheckResult != '사용가능한 이메일입니다'){
					alert('이메일을 확인해주세요')
					return false;
				}
			});
			
		});
	</script>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  	
 <script>
  $( function() {
    $( "#mbirth" ).datepicker({
    	dateFormat : 'yy-mm-dd',
    	changeMonth : true, // 월을 바꿀 수 있는 셀렉트 박스 표시
    	monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    	showMonthAfterYear : true,
    	yearSuffix : '년', // "2020년 3월"
    	showOtherMonths : true,
    	dayNamesMin:['일','월','화','수','목','금','토'],
			changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스 표시
			minDate : '-100y', // 현재 날짜로부터 100년 이전까지 표시
			maxDate : 'y', // 현재 날짜이전까지만 표시
			yearRange : 'c-100:c+100', // 년도 선택 셀렉트 
    });
  } );
  </script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<form action="${conPath }/join.do" name="join_frm" method="post" enctype="multipart/form-data">
		<table class="join_table">
			<caption>회원가입</caption>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mid" required="required">
				<div id="idCheckResult"> &nbsp; </div></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="mpw" required="required"></td>
			</tr>
			<tr>
				<th>비밀번호확인</th>
				<td><input type="password" name="mpwChk" required="required">
				<div id="pwCheckResult"> &nbsp; </div></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="mname" required="required">
				<div id="nameCheckResult"> &nbsp; </div></td>
			</tr>
			<tr>
				<th>나의 MBTI</th>
				<td><input type="text" name="mmbti"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="memail" required="required">
				<div id="emailCheckResult"> &nbsp; </div></td>
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
				<td><input type="date" name="mbirth" id="datepicker"></td>
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