<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!-- page import 할땐 패키지명을 다 기입할 것. 파일을 열어서 제일 상단에 있는 1줄 -->
<%@ page import=
	"java.sql.*, java.util.*, com.bitc.intranet.vo.BoardVO, com.bitc.intranet.util.*" %>
<%
	// 요청한 페이지 번호
	String strPageNum = request.getParameter("page");
	int pageNum = 1;
	if(strPageNum != null){
		pageNum = Integer.parseInt(strPageNum);
	}
	
	/* Criteria cri = new Criteria(pageNum, 10);
	PageMaker pm = new PageMaker();
	pm.setCri(cri); */
	
	List<BoardVO> boardList = new ArrayList<>();
	
%>


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
	<div class="wrapper" style="display: flex;">
		<div class="selfinfo">
			<img src="resources/img/profile.jpg" height="100px"><br>
			<img src="resources/img/mail.jpg" height="30px"><br>
		</div>
	<div id="wrap">
		<div id="borders">
			<h2>공지사항</h2>	
			 <table border="1" class="list">
                <tr>
                    <th>글 번호</th>
                    <th>글 제목</th>
                    <th>작성자</th>
                    <th>작성시간</th>
                    <th>조회수</th>
                </tr>
                
               <% if(!boardList.isEmpty()){ %>
                	<% for(BoardVO b : boardList){ %>
                	<tr>
						<td><%=b.getBno() %></td>
					<td>
						<a href="#">
							[<%=b.getCategory() %>] <%=b.getTitle() %>
						</a>
					</td>
					<td><%=b.getWriter() %></td>
					<td><%=b.getRegdate() %></td>
					<td><%=b.getViewcnt() %></td>
				</tr>
                <%} %>
                
				<%}else{ %>
					<tr><th colspan="4">등록된 게시물이 없습니다</th></tr>
				<%} %>
            </table>
            <input type="button" id="regist" value="새 글 작성" />
		</div>
	</div>
	
	<script>
		$(function(){
			$("#regist").on("click",function(){
				if(confirm("새 글 작성 페이지로 이동합니다")){
					location.href="${pageContext.request.contextPath}/Board/BoardRegist";
				}
			});
		});
	</script>
</body>
</html>