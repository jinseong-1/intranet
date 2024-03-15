<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*
	body{
		background-image : url("resources/img/bg.jpg"); 
		background-repeat: no-repeat;
	}
*/
table {
	margin: auto;
	padding: auto;
	background-color: white;
	border-collapse: collapse;
	border-radius: 10px;
	border-style: hidden;
	box-shadow: 0 0 0 1px #000;
	text-align: center;
	transform: translate(-50%, -50%);
	position: absolute;
	top: 50%;
	left: 50%;
}

table td {
	text-align: center;
	padding: 10px;
}

input[type='button'] {
	color: white;
	background-color: #1BBC9B;
	border: 1px;
	border-radius: 10px;
	padding: 10px;
	margin-left: 20px;
	margin-right: 20px;
	width: 80px;
}

input[type='button']:hover {
	color: black;
	cursor: pointer;
}

input[type='submit'] {
	color: white;
	background-color: #1BBC9B;
	border: 1px;
	border-radius: 10px;
	padding: 10px;
	margin-left: 20px;
	margin-right: 20px;
	width: 80px;
}

input[type='submit']:hover {
	color: black;
	cursor: pointer;
}

table tr {
	height: 50px;
}

table tr td, table tr th {
	border: 1px solid #ccc;
	text-align: center;
}

table tr .a:first-child {
	padding: 10px;
}

table tr td input[type='text'], table tr td input[type='password'],
	table tr td input[type='number'], table tr td input[type='email'] {
	width: 200px;
	outline: none;
	border: none;
	padding: 10px;
	font-size: 15px;
}

.btn {
	text-align: center;
}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<form method="post" action="memberUpdate">
		<br />
		<br />
		<br />
		<table align="center">
			<tr>
				<th colspan="3"><h3>
						👨 회원 정보 수정 👩
						<h3></th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid"
					value="${loginMember.getUid()}" placeholder="아이디를 입력해주세요" readonly
					required /></td>
			</tr>
			<tr>
				<td>기존 비밀번호</td>
				<td><input type="password"  name="upw"
					placeholder="비밀번호를 입력해주세요" required /></td>
			</tr>
			<tr>
				<td>새 비밀번호</td>
				<td><input type="password" name="newUpw"
					data-msg="비밀번호" placeholder="비밀번호를 입력해주세요" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="uname"
					value="${loginMember.getUname()}"
					placeholder="이름을 입력해주세요" /></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="uaddr"
					value="${loginMember.getUaddr()}"
					placeholder="주소를 입력해주세요" /></td>
			</tr>
			<tr>

				<td>전화번호</td>
				<td><input type="text" name="uphone"
					value="${loginMember.getUphone()}"
					placeholder="전화번호를 입력해주세요" /></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="uemail"
					value="${loginMember.getUemail()}"
					placeholder="이메일을 입력해주세요" /></td>
			</tr>
			<tr>
				<th colspan="3"><input type="submit" id="done" value="수정 완료" />
					<input type="button" id="cancel" value="수정 취소" /></th>
			</tr>
		</table>
	</form>

	<script>
	
	$("#done").on("click",function() {
			
			// 회원가입 빈칸시 알람
			if($("#uid").val().length <= 0){
				alert("사용자아이디를 입력해주세요");
				$("#uid").val("");
				$("#uid").focus();
				return ;
			}
			
			if($("#upw").val().length <= 0){
				alert("비밀번호를 입력해주세요");
				$("#upw").val("");
				$("#upw").focus();
				return;
			}
			
			if($("#uname").val().length <= 0){
				alert("이름을 입력해주세요");
				$("#uname").val("");
				$("#uname").focus();
				return;
			}
			
			if($("#uaddr").val().length <= 0){
				alert("주소를 입력해주세요");
				$("#uaddr").val("");
				$("#uaddr").focus();
				return;
			}
			
			if($("#uemail").val().length <= 0){
				alert("이메일을 입력해주세요");
				$("#uemail").val("");
				$("#uemail").focus();
				return;
			}
			
			if($("#uphone").val().length <= 0){
				alert("휴대폰 번호를 입력해주세요");
				$("#uphone").val("");
				$("#uphone").focus();
				return;
			}
			
			// --------- 여기부터
			
			// 기존 비밀번호, 새 비밀번호 중복 확인 
			if($("#upw").equals($("#newUpw")){
				alert("비밀번호가 똑같아요");
				return;
			}
			
			// 로그인한 비밀번호와 입력한 비밀번호의 일치 확인
			if($(MemberVO.upw) == ("#upw")){
				alert("번호가 달라요");
				return;
			}
			
			// 새 비밀번호 입력 안 하면 그냥 넘기도록 하기
			if($("#newUpw").val().length <= 0){
				$("#newUpw").val("#upw");
				return;
			}
			
			// -------- 여기까지 다 안 됨 
			
			$("#memberUpdate").submit();
			
		}); 
		
		// 수정 취소 버튼 ---- 얘도 안됨;; 		
		$("#cancel").on("click",function(){
			if(confirm("회원 수정을 취소하시겠습니까?")){
				location.href = "${pageContext.request.contextPath}/main";
			}
		});
		
	</script>

</body>
</html>