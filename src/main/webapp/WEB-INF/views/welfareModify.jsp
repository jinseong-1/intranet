<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!-- page import 할땐 패키지명을 다 기입할 것. 파일을 열어서 제일 상단에 있는 1줄 -->
<%@ page import=
	"java.sql.*, java.util.*, com.bitc.intranet.vo.WelfareVO, com.bitc.intranet.util.*" %>
<style>
	div{
		text-align: center;
	}
	
	table{
		margin : 100px;
		padding : 100px;
		background-color: white;
	  	border-collapse: collapse;
	  	border-radius: 10px;
	  	border-style: hidden;
	  	box-shadow: 0 0 0 1px #000;
	  	text-align: center;
	  	table-layout: fixed;
	  	word-spacing: normal;
	}
  
	
	table tr td{
		width : 1500px;
		height : 200px;
		border-bottom: 1px solid #ccc;
		padding:10px;
		text-align: center;
		word-spacing: normal;
		
	}
	
	#title{
		text-align: center;
		height:30px;
	}
	
	.product:hover{
		cursor: pointer;
		
	}
	
	input[type="text"]{
		text-align: center;
		width: 200px;
		height: 200px;
	}
	
	input[type='button']{
		color: white;
		background-color: #1BBC9B;
		border : 1px;
		border-radius : 10px;
		padding : 10px;
		margin-left : 20px;
		margin-right : 20px;
		width : 130px;
	}
	
	input[type='button']:hover{
	    color: black;
	    cursor: pointer;
	}
	
</style>
<script src="http://code.jquery.com/jquery-latest.min.js">
</script>
</head>
<body>
	<!-- 게시판 리스트 -->
	<form id="welfareModify" method="POST">
		<div id="wrap">
			<div id="detail">
				<h2>상품 수정하기</h2>	
				 <table border="1" class="list">
	                <tr id="title">
	                    <th>상품 이미지</th>
	                    <th>상품 번호</th>
	                    <th>상품명</th>
	                    <th>상품 설명</th>
	                    <th>가격</th>
	                    <th>재고 수량</th>
	                </tr>
	                <tr>
	                	<td><img src="https://static.ebs.co.kr/images/public/lectures/2014/06/19/10/bhpImg/44deb98d-1c50-4073-9bd7-2c2c28d65f9e.jpg" height="300px" alt="제품 사진"></td>
	                	<td><input type="text" value="${welfareVO.num}" placeholder="상품 번호를 입력하세요." /></td>
						<td><input type="text" value="${welfareVO.model}" placeholder="상품명을 입력하세요." /></td>
						<td><input type="text" value="${welfareVO.intro}" placeholder="상품 설명을 입력하세요." /></td>
						<td><input type="text" value="${welfareVO.price}" placeholder="상품 가격을 입력하세요." /></td>
						<td><input type="text" value="${welfareVO.stock}" placeholder="상품 재고를 입력하세요." /></td>
					</tr>
	            </table>
	            <hr/>
	            <br/>
	            <input type="button" id="modify" value="수정하기" />
	            <input type="button" id="cancel" value="취소하기" />
			</div>
		</div>
	</form>
	<script>
		$(function(){
			$("#modify").on("click",function(){
				if(confirm("상품을 수정합니다.")){
					$("#welfareModify").submit();
					alert("서브밋");
					location.href="${pageContext.request.contextPath}/Welfare/welfare";
				}
			});
			
			$("#cancel").on("click",function(){
				if(confirm("상품 수정을 취소합니다.")){
					location.href="${pageContext.request.contextPath}/Welfare/welfare";
				}
			})
		});
	</script>
</body>
</html>