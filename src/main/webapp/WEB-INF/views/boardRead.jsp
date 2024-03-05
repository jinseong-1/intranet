<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<style>
	#wrap{
		margin:0;
		display:flex;
		flex-direction: column;
	}
</style>
<div id="wrap">
<!-- 반복문 처리시킬 것 -->
	<table border="1">
	<tr>
		<td>제목</td>
		<td> 
			${read.title}
		</td>
	</tr>
	<tr>
		<td>카테고리</td>
		<td> 
			${read.category}
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td style="width:300px; height:500px"> 
			${read.content}
		</td>
	</tr>
	<tr> 
		<td colspan="2">
			<a href="modify?bno=${read.bno}">수정</a> |
			<a href="remove?bno=${read.bno}">삭제</a> |
			<a href="${path}/Board/board">목록으로</a>
		</td>
	</tr>
	</table>
	<br/>
	<div>
	<hr style="clear:both;"/>
	</div>
<%@ include file="comment.jsp" %>
</div>
<%@ include file = "footer.jsp" %>