<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!-- page import 할땐 패키지명을 다 기입할 것. 파일을 열어서 제일 상단에 있는 1줄 -->
<%@ page import=
	"java.sql.*, java.util.*, com.bitc.intranet.vo.FreeVO, com.bitc.intranet.util.*" %>
<style>
	body{
		height : 600px;
	}
	.member{
		border : "1";
		height : "163px";
	}
	#wrap{
    	border:1px solid red;
        width:1450px;
        height:600px;
        margin:10px 0 10px 30px;
        display:flex;
        flex-direction:column;
        justify-content:space-between;
    }
</style>
<script src="http://code.jquery.com/jquery-latest.min.js">
	/* 2/28 작업 */
	let result = '${result}';
	if(result != ''){
		alert(result);
	}
</script>
</head>
<body>
	<!-- 게시판 리스트 -->
	<div id="wrap">
		<div id="borders">
			<h2>자유게시판</h2>	
			 <table border="1" class="list">
                <tr>
                    <th>글 번호</th>
                    <th>글 제목</th>
                    <th>작성자</th>
                    <th>작성시간</th>
                    <th>조회수</th>
                </tr>
				<c:choose>
					<c:when test="${!empty List }">
						<c:forEach var="b" items="${List }">
							<tr>
								<td>${b.bno}</td>
								<td>${b.title}</td>
								<td>${b.writer}</td>
								<td>${b.regdate}</td>
								<td>${b.viewcnt}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5"> 등록된 게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
            </table>
            <input type="button" id="regist" value="새 글 작성" />
		</div>
	</div>
	
	<script>
		$(function(){
			$("#regist").on("click",function(){
				if(confirm("새 글 작성 페이지로 이동합니다")){
					location.href="${pageContext.request.contextPath}/free/freeRegist";
				}
			});
		});
	</script>
</body>
</html>
</html>


